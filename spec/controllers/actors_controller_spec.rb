require 'rails_helper'

RSpec.describe ActorsController, :type => :controller do
  describe "GET INDEX." do
    context "Test if the page was created." do
      it "Has a 200 a code." do
        get :index
        expect(response.status).to eq(200)
      end
    end
  end

  describe "GET NEW" do
    context "Test if was created a actor." do
      subject(:actor){Actor.new}
      it "Created a new actor." do
        expect(actor).to be_a_new(Actor)
      end
    end
  end

  describe "POST CREATE" do
    context "Passed valid attributes." do
      subject(:hash_actor){{true_name: "True_name", artistic_name: "Artistic_name", date_birth: "Date_birth"}}
      it "Created a new actor." do
        expect{post :create, actor: hash_actor}.to change(Actor, :count).by(1)
      end
      it "Redirected to the actor." do
        expect(post :create, actor: hash_actor).to redirect_to Actor.last
      end
    end
  end

  describe "PUT UPDATE" do
    before(:each) do
      @actor = Actor.create({true_name: "True_name_01", artistic_name: "Artistic_name_01", date_birth: "Date_birth_01"})
    end
    context "Passed valid attributes." do
      subject(:hash_actor){{true_name: "True_name_02", artistic_name: "Artistic_name_02", date_birth: "Date_birth_02"}}
      it "Located the requestd actor." do
        put :update, id: @actor, actor: hash_actor
        expect(assigns(:actor)).to eq(@actor)
      end
      it "Changed actor's attributes." do
        put :update, id: @actor, actor: hash_actor
        @actor.reload
        expect(@actor.true_name).to eq("True_name_02")
        expect(@actor.artistic_name).to eq("Artistic_name_02")
        expect(@actor.date_birth).to eq("Date_birth_02")
      end
      it "Redirects to the update actor." do
        expect(put :update, id: @actor, actor: hash_actor).to redirect_to @actor
      end
    end
  end

  describe "DELETE DESTROY" do
    before(:each) do
      @actor = Actor.create({true_name: "True_name_01", artistic_name: "Artistic_name_01", date_birth: "Date_birth_01"})
    end
    context "Passed valid attributes." do
      it "Delete the actor." do
        expect{delete :destroy, id: @actor}.to change(Actor, :count).by(-1)
      end
      it "Redirected to actor." do
        expect(delete :destroy, id: @actor).to redirect_to actors_path
      end
    end
  end
end