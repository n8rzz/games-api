source 'https://rubygems.org'
ruby '2.2.2'

# Bundle edge Rails instead: gem 'rails', github: 'rails/rails'
gem 'rails', '>= 5.0.0.beta3', '< 5.1'
gem 'puma'
gem 'pg'
gem 'faker', '~> 1.5.0'
gem 'active_model_serializers', '~> 0.10.0.rc2'
# Use Rack CORS for handling Cross-Origin Resource Sharing (CORS), making cross-origin AJAX possible
gem 'rack-cors', :require => 'rack/cors'

group :development, :test do
  gem 'rspec-rails', '3.1.0' # :branch => 'rails-5-support'
  gem 'byebug'
  gem 'better_errors', '~>2.1.1'
  gem 'database_cleaner'
  gem 'rubocop', require: false
  gem 'guard-bundler', '2.1.0'
  gem 'guard-rspec', '4.5.0', require: false
  gem 'guard-rubocop', '1.2.0', require: false
end

group :test do
  gem 'factory_girl_rails', '4.5.0'
  gem 'shoulda-matchers', '2.8.0'
end

group :development do
  gem 'listen', '~> 3.0.5'
  # Spring speeds up development by keeping your application running in the background. Read more: https://github.com/rails/spring
  gem 'spring'
  gem 'spring-watcher-listen', '~> 2.0.0'
end

group :production do
  gem 'rails_12factor'
end
