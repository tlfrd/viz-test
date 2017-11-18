# VizTest

A tool to crowdsource graphical perception experiments built using Ruby on Rails and D3.js

## Installation

Install Ruby 2.4 and RubyGems.

Run ```$ bundler install``` to install necessary gems.

Run ```$ rake db:migrate``` to initialise database/run migrations.

Finally, set APP_USER and APP_SECRET environment variables for basic HTTP authentication.

## Tests

Run ```$ rspec``` to run tests (some will fail as they have not been updated, this is a WIP).