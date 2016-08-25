$:.push File.expand_path("../lib", __FILE__)

# Maintain your gem's version:
require "no_cms/admin/menus/version"

# Describe your gem and declare its dependencies:
Gem::Specification.new do |s|
  s.name        = "nocms-admin-menus"
  s.version     = NoCms::Admin::Menus::VERSION
  s.authors     = ["Simplelogica"]
  s.email       = ["gems@simplelogica.net"]
  s.homepage    = "https://github.com/simplelogica/nocms-admin-menus"
  s.summary     = "Gem with custom back for nocms-menus gem"
  s.description = "Gem with custom back for nocms-menus gem"

  s.files = Dir["{app,config,db,lib}/**/*", "MIT-LICENSE", "Rakefile", "README.rdoc"]
  s.add_dependency "rails", "~> 4.0", ">= 4.0.4"
  s.add_dependency "nocms-admin", '~> 0.0', '>= 0.0.1'
  s.add_dependency "nocms-menus", '~> 0.0', '>= 1.0.1'

  s.add_development_dependency "sqlite3"
end
