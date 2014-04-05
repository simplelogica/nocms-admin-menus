# This file is copied to spec/ when you run 'rails generate rspec:install'
ENV["RAILS_ENV"] ||= 'test'
require File.expand_path("../dummy/config/environment", __FILE__)
require 'rspec/rails'
require 'capybara/rspec'
require 'capybara/poltergeist'


# Requires supporting ruby files with custom matchers and macros, etc,
# in spec/support/ and its subdirectories.
# We get those from this gem root and from nocms_pages root
[
  Rails.root.join("../../"),
  Gem::Specification.find_by_name("nocms-menus").gem_dir
].each do |d|
  Dir["#{d}/spec/support/**/*.rb"].each { |f| require f }
  FactoryGirl.definition_file_paths << "#{d}/spec/factories"
end

# Checks for pending migrations before tests are run.
# If you are not using ActiveRecord, you can remove this line.
ActiveRecord::Migration.check_pending! if defined?(ActiveRecord::Migration)
RSpec.configure do |config|

  Capybara.javascript_driver = :poltergeist

  # Avoid repeating FactoryGirl
  config.include FactoryGirl::Syntax::Methods

  # Capybara DSL only in request specs
  config.include Capybara::DSL, :type => :request

  # Remove this line if you're not using ActiveRecord or ActiveRecord fixtures
  config.fixture_path = "#{::Rails.root}/spec/fixtures"

  # If you're not using ActiveRecord, or you'd prefer not to run each of your
  # examples within a transaction, remove the following line or assign false
  # instead of true.
  config.use_transactional_fixtures = true

  # If true, the base class of anonymous controllers will be inferred
  # automatically. This will be the default behavior in future versions of
  # rspec-rails.
  config.infer_base_class_for_anonymous_controllers = false

  # Run specs in random order to surface order dependencies. If you find an
  # order dependency and want to debug it, you can fix the order by providing
  # the seed, which is printed after each run.
  #     --seed 1234
  config.order = "random"

   # Cleaning database on before and afters
  config.before(:suite) do
    DatabaseCleaner.clean_with(:truncation)
  end

  config.before :each do
    DatabaseCleaner.strategy = :transaction
  end

  config.before(:each) do
    DatabaseCleaner.start
  end

  config.after(:each) do
    DatabaseCleaner.clean
  end

end

# Now we define a shared connection so every activerecord object shares the connection and we can use transactions over phantomjs
class ActiveRecord::Base
  mattr_accessor :shared_connection
  @@shared_connection = nil

  def self.connection
    @@shared_connection || retrieve_connection
  end
end

# Forces all threads to share the same connection. This works on
# Capybara because it starts the web server in a thread.
ActiveRecord::Base.shared_connection = ActiveRecord::Base.connection

FactoryGirl.reload


# $stderr.reopen("log/test.error.log", "w")
