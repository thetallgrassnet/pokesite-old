source 'https://rubygems.org'
ruby '2.2.3'

# Bundle edge Rails instead: gem 'rails', github: 'rails/rails'
gem 'rails', '4.2.4'
# Use SCSS for stylesheets
gem 'sass-rails', '~> 5.0.4'
# Use Uglifier as compressor for JavaScript assets
gem 'uglifier', '>= 1.3.0'
# Use CoffeeScript for .js.coffee assets and views
gem 'coffee-rails', '~> 4.1.0'
# See https://github.com/sstephenson/execjs#readme for more supported runtimes
# gem 'therubyracer', platforms: :ruby

# Use jQuery as the JavaScript library
gem 'jquery-rails', '~> 4.0'
# Build JSON APIs with ease. Read more: https://github.com/rails/jbuilder
gem 'jbuilder', '~> 2.0'
# bundle exec rake doc:rails generates the API under doc/api.
gem 'sdoc', '~> 0.4.0', group: :doc

# Use ActiveModel has_secure_password
# gem 'bcrypt', '~> 3.1.7'

# Use Unicorn as the app server
# gem 'unicorn'

# Use Capistrano for deployment
# gem 'capistrano-rails', group: :development

gem 'slim-rails', '~> 3.0.1'
gem 'bootstrap-sass', '~> 3.3'
gem 'bootstrap_form', '~> 2.3.0'

gem 'neo4j', '~> 5.0'
gem 'devise-neo4j', '~> 2.0.0'

gem 'devise', '~> 3.5'
gem 'obscenity', '~> 1.0.2'
gem 'allowy', '~> 2.1.0'

group :development, :test do
  gem 'guard'
  gem 'guard-rails'
  gem 'guard-rspec'

  gem 'rspec-rails', '~> 3.3'
  gem 'capybara'
  gem 'factory_girl_rails'

  # Call 'debugger' anywhere in the code to stop execution and get a debugger console
  gem 'byebug'

  # Access an IRB console on exception pages or by using <%= console %> in views
  gem 'web-console', '~> 2.2'

  # Spring speeds up development by keeping your application running in the background. Read more: https://github.com/rails/spring
  gem 'spring'
end

group :test do
  gem "codeclimate-test-reporter", require: nil
  gem "database_cleaner"
end
