require "rails_helper" 

RSpec.describe LoansController do
  before do
    post :create, params: { :value => 1999, :fee => 0.03, :months => 2 }
  end

  describe "GET show" do
    it do
      get :show, params: { id: 1 }
      param = JSON.parse(response.body).with_indifferent_access
      expect(param[:loan][:id]).to(eq(1))
    end
  end

  describe "Invalid POST" do
    it "Blank fee" do
      post :create, params: { :value => 1999, :months => 2 }
      param = JSON.parse(response.body).with_indifferent_access
      expect(param[:fee]).to be == ["can't be blank", "is not a number"]
    end

    it "Blank number of month" do
      post :create, params: { :value => 1999, :fee => 0.03 }
      param = JSON.parse(response.body).with_indifferent_access
      expect(param[:months]).to be == ["can't be blank", "is not a number"]
    end

    it "Blank value" do
      post :create, params: { :fee => 0.03, :months => 2 }
      param = JSON.parse(response.body).with_indifferent_access
      expect(param[:value]).to be == ["can't be blank", "is not a number"]
    end
  end
end
