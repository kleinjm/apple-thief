source 'https://rubygems.org'

# Basic environment
ruby '1.9.3'
gem 'rails', '3.2.18'

# Frontend
gem 'bootstrap-sass', '3.1.1.1'
gem 'haml', '4.1.0.beta.1'
gem 'jquery-rails', '3.1.1'

# Database
gem 'pg', '0.17.1'
gem 'simple_form'
gem 'seed_dump', '0.5.3'
gem 'faker', '1.4.3'    # create fake data. Used for testing but needed outside that group so that we can use it in the db seed file

# Gems used only for assets and not required
# in production environments by default.
group :assets do
  gem 'sass-rails',   '3.2.3'
  gem 'coffee-rails', '3.2.1'

  # See https://github.com/sstephenson/execjs#readme for more supported runtimes
  # gem 'therubyracer', :platforms => :ruby

  gem 'uglifier', '>= 1.0.3'
end

group :development do
  gem "better_errors", "1.1.0"
  gem "binding_of_caller"
  gem 'pry'
  gem 'pry-nav' 

  # testing
  gem 'guard', '~> 2.12.6' # allows tests to be automatically run when files are modified
  gem 'guard-rspec', '~> 4.5.2'
  gem 'rspec-rails', '~> 3.0'
  gem 'factory_girl_rails', '~> 4.5.0'  # uses factories insead of fixtures in tests
  gem 'capybara', '2.4.4' # simulating how a real user would interact with your app. Acts as outside user
  gem "launchy"
end

group :production do
  gem 'rails_12factor', '0.0.2'
end

# To use ActiveModel has_secure_password
# gem 'bcrypt-ruby', '~> 3.0.0'

# To use Jbuilder templates for JSON
# gem 'jbuilder'

# Use unicorn as the app server
# gem 'unicorn'

# Deploy with Capistrano
# gem 'capistrano'

# To use debugger
# gem 'debugger'