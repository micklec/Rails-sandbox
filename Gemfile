source 'https://rubygems.org'

gem 'rails', '3.2.1'
gem 'jquery-rails'
gem 'bcrypt-ruby', '3.0.1'

group :development, :test do
  gem 'sqlite3', '1.3.5'
  gem 'annotate', '~> 2.4.1.beta'
  gem 'growl'
  gem 'rspec-rails', '2.8.1'
  gem 'capybara', '1.1.2'
  gem 'guard'
  gem 'guard-rspec', '0.5.5'
  gem 'rb-fsevent', '0.4.3.1', :require => false
end

# Gems used only for assets and not required
# in production environments by default.
group :assets do
  gem 'sass-rails',   '~> 3.2.3'
  gem 'coffee-rails', '~> 3.2.1'
  gem 'uglifier', '>= 1.0.3'
end

group :test do
  gem 'guard-spork', '0.3.2'
  gem 'spork', '~> 0.9.0.rc'
  gem 'factory_girl_rails', '1.4.0'
end

group :production do
  gem 'pg', '0.12.2'
end
