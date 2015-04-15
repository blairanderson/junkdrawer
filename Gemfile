ruby '2.2.0'
source 'https://rubygems.org'


gem 'rails', '4.1.4'

#DATABASES
gem 'pg'
gem 'dalli'

#WORKERS
gem 'delayed_job_active_record'

#ASSETS
gem 'sass-rails', '~> 4.0.3'
gem 'uglifier', '>= 1.3.0'
gem 'bootstrap-sass', github: 'twbs/bootstrap-sass'
gem 'bootstrap-sass-extras'

#DEVELOPMENT
gem 'bundler'

#LIBS
gem 'simple_form'
gem 'tzinfo-data'
gem 'validates_formatting_of'

#SERVICES
gem 'devise', github: 'plataformatec/devise'
gem 'omniauth'
gem 'omniauth-facebook'


group :development do
  gem 'spring'
  gem 'binding_of_caller'
  gem 'better_errors'
  gem 'pry-rails'
end

group :development, :test do
  gem 'dotenv-rails'
  gem 'rspec-rails'
  gem 'factory_girl_rails'
end

group :test do
  gem 'shoulda-matchers'
  gem 'cucumber-rails', require: false
  gem 'database_cleaner'
end



# API_SLUG

gem 'api_cache'
