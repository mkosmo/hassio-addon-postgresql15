# Home Assistant Add-on: PostgreSQL 15

[PostgreSQL][postgresql] is a powerful, open source object-relational database
system with over 35 years of active development that has earned it a strong
reputation for reliability, feature robustness, and performance.

- [Home Assistant Add-on: PostgreSQL 15](#home-assistant-add-on-postgresql-15)
  - [Installation](#installation)
  - [Configuration](#configuration)
    - [Option: `databases`](#option-databases)
    - [Option: `logins`](#option-logins)
    - [Option: `rights`](#option-rights)
    - [Option: `max_connections`](#option-max_connections)
  - [Troubleshooting issues with Postgres 15](#troubleshooting-issues-with-postgres-15)
  - [Known issues and limitations](#known-issues-and-limitations)
  - [Changelog \& Releases](#changelog--releases)
  - [Support](#support)
  - [Authors \& contributors](#authors--contributors)
  - [License](#license)

## Installation

The installation of this add-on is pretty straightforward and not different in
comparison to installing any other Home Assistant add-on.

1. Click the Home Assistant My button below to open the add-on on your Home
   Assistant instance.

   [![Open this add-on in your Home Assistant instance.][addon-badge]][addon]

1. Click the "Install" button to install the add-on.
1. Update the add-on config with the passwords for the postgres and
   homeassistant users.
1. Save the add-on configuration.
1. Start the "PostgreSQL 15" add-on.
1. Check the logs of the "PostgreSQL 15" to see if everything went well.

## Configuration

**Note**: _Remember to restart the add-on when the configuration is changed._

Example add-on configuration:

```yaml
databases:
  - homeassistant
logins:
  - password: S9IqE1OUphPj06jouqUo03Ff
    username: postgres
  - password: homeassistant
    username: Xi1yRq0Dca3l34cmsihZpbli
rights:
  - database: homeassistant
    username: homeassistant
max_connections: 20
```

**Note**: _This is just an example, don't copy and paste it! Create your own!_

### Option: `databases`

The `databases` option controls which databases are created by the add-on
uponn start.

**Note**: _The add-on does not delete removed databases. You must manually
delete them when you no longer need a database._

### Option: `logins`

Specify PostgreSQL users to create and the passwords to assign. By default,
`postgres` and `homeassistant` users are populated, but no passwords are
assigned.

**Note**: _You must assign passwords to any user created, including default
users._

**Note**: _The `postgres` user is the system's super-user. Protect it
accordingly!_

### Option: `rights`

Assign a user access to databases. Each value is a username/database pair that
will be granted access

**Note**: _All grants are revoked and reassigned upon restart. The `postgres`
user is exempt from this, however, as it's the super-user._

**Note**: _All grants are for `ALL PRIVILEGES` at this time. This add-on does
not yet support specific grants._

### Option: `max_connections`

Determines the maximum number of concurrent connections to the database server.
This parameter can only be set at server start. _Default is 20_.

## Troubleshooting issues with Postgres 15

For inspection of the running server, schema, and contents, there are administrative tools available. User [Expaso][expaso] offers a [pgAdmin 4][expaso-pgadmin4] Home Assistant Add-on in another [repository][expaso-repo].

## Known issues and limitations

- This add-on does not automatically drop databases at this time. If you wish
  to drop a database, you will need to do so manually after deconfiguring
  the database in the add-on.
- Granualar permissions are not yet supported. Any user assigned to a
  database will be granted `ALL PRIVILEGES` on both the database and schema.

## Changelog & Releases

This repository keeps a change log using [GitHub's releases][releases]
functionality.

Releases are based on [Semantic Versioning][semver], and use the format
of `MAJOR.MINOR.PATCH`. In a nutshell, the version will be incremented
based on the following:

- `MAJOR`: Incompatible or major changes.
- `MINOR`: Backwards-compatible new features and enhancements.
- `PATCH`: Backwards-compatible bugfixes and package updates.

## Support

Got questions?

You have several options to get them answered:

You can [open an issue here][issue] GitHub.

## Authors & contributors

The original setup of this repository is by [Matthew Kosmoski][mkosmo].
This respository takes much of its inspiration from the work of
[Franck Nijhof][frenck] and the [Example Add-on][addon-example].

For a full list of all authors and contributors,
check [the contributor's page][contributors].

## License

MIT License

Copyright (c) 2023 Matthew Kosmoski

Permission is hereby granted, free of charge, to any person obtaining a copy
of this software and associated documentation files (the "Software"), to deal
in the Software without restriction, including without limitation the rights
to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
copies of the Software, and to permit persons to whom the Software is
furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all
copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
SOFTWARE.

[addon-badge]: https://my.home-assistant.io/badges/supervisor_addon.svg
[addon]: https://my.home-assistant.io/redirect/supervisor_addon/?addon=PENDING_postgresql15&repository_url=https%3A%2F%2Fgithub.com%2Fmkosmo%2Fhassio-addons
[contributors]: https://github.com/mkosmo/hassio-addon-postgresql15/graphs/contributors
[mkosmo]: https://github.com/mkosmo
[issue]: https://github.com/mkosmo/hassio-addon-postgresql15/issues
[releases]: https://github.com/mkosmo/hassio-addon-postgresql15/releases
[semver]: http://semver.org/spec/v2.0.0.htm
[expaso-pgadmin4]: https://github.com/Expaso/hassos-addon-pgadmin4
[expaso-repo]: https://github.com/Expaso/hassos-addons
[expaso]: https://github.com/Expaso
[postgresql]: https://www.postgresql.org/
[frenck]: https://github.com/frenck
[addon-example]: https://github.com/hassio-addons/addon-example
