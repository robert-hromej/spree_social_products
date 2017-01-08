# encoding: UTF-8
Gem::Specification.new do |s|
  s.platform    = Gem::Platform::RUBY
  s.name        = 'spree_social_products'
  s.version     = '3.0.0.beta'
  s.summary     = 'Adds social network sharing to product pages'
  s.required_ruby_version = '>= 2.1'

  s.author    = 'John Dyer'
  s.email     = 'jdyer@spreecommerce.com'
  s.homepage  = 'http://www.spreecommerce.com'

  s.files       = `git ls-files`.split("\n")
  s.require_path = 'lib'
  s.requirements << 'none'

  s.add_dependency 'spree_core', '~> 3.2.0.rc2'
  
  s.add_development_dependency 'capybara', '~> 2.4.4'
  s.add_development_dependency 'factory_girl', '~> 4.5'
  s.add_development_dependency 'ffaker'
  s.add_development_dependency 'rspec-rails',  '~> 3.1'
  s.add_development_dependency 'sqlite3'
end
