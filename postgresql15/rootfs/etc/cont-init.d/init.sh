#!/usr/bin/with-contenv bashio
# ==============================================================================
# Home Assistant Add-on: PostgreSQL
# Initializes the container during startup
# ==============================================================================
declare postgres_data
declare version_file
declare new_install

postgres_data=/data/postgres
version_file=/data/version
new_install=false;

applyPermissions () {
	chown -R postgres:postgres ${postgres_data}
	chmod 700 ${postgres_data}
}

initializeDataDirectory () {
    bashio::log.info "Creating new postgres config..."
	mkdir -p ${postgres_data}
	applyPermissions
	su - postgres -c "initdb -D ${postgres_data}"
	# shellcheck disable=SC2129
	echo "host    all             all             0.0.0.0/0               md5" >> ${postgres_data}/pg_hba.conf
	echo "local    all             all                                    md5" >> ${postgres_data}/pg_hba.conf
	echo "local    all             all                                   peer" >> ${postgres_data}/pg_hba.conf
	sed -r -i "s/[#]listen_addresses.=.'.*'/listen_addresses\ \=\ \'\*\'/g" ${postgres_data}/postgresql.conf
	bashio::log.info "done"
}

if ! bashio::fs.directory_exists "${postgres_data}"; then
    bashio::log.info "Initializing new postgresql instance..."
    new_install=true
else
    bashio::log.info "Using existing postgresql instance..."
    touch ${version_file}
	applyPermissions
fi

if bashio::var.true "${new_install}"; then
	touch /data/firstrun
	bashio::addon.version > ${version_file}
	initializeDataDirectory
fi

bashio::log.info "done"

bashio::log.info "Configuring max connections..."
sed -i -e "/max_connections =/ s/= .*/= $(bashio::config 'max_connections')/" ${postgres_data}/postgresql.conf
bashio::log.info "done"
