require 'factory_bot'

RSpec.configure do |config|
  config.before(:suite) do
    begin
      DatabaseCleaner.start
    # FactoryBot.lint # strategy: :build, traits: true
    ensure
      DatabaseCleaner.clean
    end
  end
end