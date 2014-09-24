require 'capybara/rspec'
require 'capybara/poltergeist'

Capybara.match = :prefer_exact
Capybara.javascript_driver = :poltergeist
options = {timeout: 60}
Capybara.register_driver(:poltergeist) do |app|
  Capybara::Poltergeist::Driver.new app, options
end