# Configuration for this gem with RSpec
RSpec.configure do |config|
  config.include FactoryBot::Syntax::Methods
  config.before(:all) { FactoryBot.reload }
end
