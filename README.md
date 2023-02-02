# weather_check

This is a Rails 7 app.

## Documentation

This README describes the purpose of this repository and how to set up a development environment.

## Prerequisites

This project requires:

* Ruby 3.1.3, preferably managed using [rbenv][]
* PostgreSQL must be installed and accepting connections
* pnpm (add via corepack)
  * corepack prepare pnpm@latest --activate
  Note: If you get an error with OSX `command not found: corepack` remove pnpm and yarn `npm uninstall -g yarn pnpm` then reinstall corepack `npm install -g corepack`

## Getting started

### bin/setup

Run the `bin/setup` script. This script will:

* Check you have the required Ruby version
* Install dependencies using Bundler and pnpm
* Create a `.env.development` file
* Create, migrate, and seed the database

### Run it!

1. Run `bin/rake` to run all tests and lint checks.
2. Start the app with `pnpm start`

Access the app at <http://localhost:3000/>.

[rbenv]:https://github.com/sstephenson/rbenv
