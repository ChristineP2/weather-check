# Weather Check

## Prerequisites

This project requires:

* Ruby 3.1.3, preferably managed using [rbenv][]
* PostgreSQL must be installed and accepting connections
* pnpm (added via corepack)
    * corepack prepare pnpm@latest --activate
      Note: If you get an error with OSX `command not found: corepack` remove
      pnpm and yarn `npm uninstall -g yarn pnpm` then reinstall
      corepack `npm install -g corepack`

### API Keys

You will need an API key from https://www.weatherapi.com/. For the purposes of
this demo project store API key in `API_KEY_WEATHER_API` in
your `.env.development` file. Assumes Enterprise standard key management would
be in use in place of this solution.

## Getting started

### bin/setup

Run the `bin/setup` script. This script will:

* Check you have the required Ruby version
* Install dependencies using Bundler and pnpm
* Create a `.env.development` file
* Create, migrate, and seed the database

### Run it!

1. Run `bin/rake` to run all tests and lint checks.
2. Start the app with `pnpm start` to start both the vite and rails servers in
   command line, or use foreman to load Procfile.dev (In Rubymine Gem Command
   foreman with `start -f Procfile.dev`.

Access the app at <http://localhost:3000/>

# Engineering Note:

This app will be changing to an app for [temperature blanket][] patterns for
various years once I am done with this demo. Some of the patterns will be a
[granny square][] of a month and may use the data in that month to fill out the
extra squares needed, so I am saving extra info beyond what is needed for the
demo project. [I can't decide which pattern I'm using.]


[rbenv]:https://github.com/sstephenson/rbenv

[temperature blanket]:https://www.handylittleme.com/temperature-blanket-patterns/

[granny square]:https://tlycblog.com/bias-granny-temperature-blanket-free-crochet-granny-square-afghan-pattern/

[I can't decide which pattern I'm using.]:https://www.bewitchingstitch.com/temperature-project-library/
