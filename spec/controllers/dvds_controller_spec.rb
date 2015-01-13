require 'rails_helper'

RSpec.describe DvdsController, :type => :controller do

  subject (:dvd){Dvd.create}
  subject (:new_dvd){{volume: 3}}
  subject (:new_dvd_invalid){{volume: "" }}

  describe "GET #index" do
    context "Test if the page was created " do
      it "Has a 200 a code" do
        get :index
        expect(response.status).to eq(200)
      end
    end
      it "renders the :index view" do
        get :index
        expect(response.should render_template :index)
      end
  end

  describe "GET #show" do
    before :each do
      @dvd = Dvd.create({volume: 1})
    end
    it "assisgns the request dvd to @dvd" do
      get :show, id: @dvd
      expect(assigns(:dvd)).to eq (@dvd)
    end
    it "renders the #show view" do
      get :show, id: @dvd
      expect(response.should render_template :show)
    end
  end

  describe "GET #new" do
    it "assigns a new dvd to @dvd" do
      get :new
      expect(assigns(:dvd)).to be_a_new(Dvd)
    end
  end

  describe "POST create" do
    it "creates a new dvd" do
      expect{ post :create, dvd: new_dvd}.to change(Dvd, :count).by(1)
    end

    it "redirects to the new contact" do
      expect( post :create, dvd: new_dvd).should redirect_to Dvd.last
    end

    context "with invalid atrributes" do
      it "does not save the new dvd" do
        expect{ post :create, dvd: new_dvd_invalid}.to_not change(Dvd, :count)
      end
    end
  end

  describe 'PUT update' do
    subject (:new_dvd2){{volume: 4}}

    before :each do
      @new_dvd = Dvd.create({volume: 1})
    end

    context "valid attributes" do
      it "located the requested @dvd" do
        put :update, id: @new_dvd, dvd: new_dvd2
        assigns(:dvd).should eq(@new_dvd)
      end

      it "changes @dvds attributes" do
        put :update, id: @new_dvd, dvd: new_dvd2
        @new_dvd.reload
        @new_dvd.volume.should eq(4)
      end

      it "redirects to the updated dvd" do
        put :update, id: @new_dvd, dvd: new_dvd2
        response.should redirect_to(action: "show", id: @new_dvd)
      end
    end
  end

  describe "DELETE destroy" do

      before :each do
        @new_dvd = Dvd.create(volume: 2)
      end

      it "delete costumer" do
        expect{
          delete :destroy, id: @new_dvd}.to change(Dvd, :count).by(-1)
      end

      it "redirects to dvd#index" do
        delete :destroy, id: @new_dvd
        response.should redirect_to(action: "index")
      end
  end
end
