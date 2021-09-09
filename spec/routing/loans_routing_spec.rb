require "rails_helper"

RSpec.describe LoansController, type: :routing do
  describe "routing" do
    it "routes to #show" do
      expect(get: "/loans/1").to route_to("loans#show", id: "1")
    end


    it "routes to #create" do
      expect(post: "/loans").to route_to("loans#create")
    end
  end
end
