require 'rails_helper'

RSpec.describe HomeController, :type => :controller do
  before :each do
    sign_in
  end
  
  describe "GET #index" do
    context "Test if the page was created " do
      it "Has a 200 a code" do
        get :index
        expect(response.status).to eq(200)
      end
    end
  end
end
