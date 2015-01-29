require 'rails_helper'

RSpec.describe RentsController, :type => :controller do
  before :each do
    sign_in
  end

  describe "GET INDEX." do
    context "Test if the page was created." do
      it "Has a 200 a code." do
        get :index, movie_id: 1
        expect(response.status).to eq(200)
      end
    end
  end

  describe "GET NEW" do
    context "Test if was created a rent." do
      subject(:rent){Rent.new}
      it "Created a new rent." do
        expect(rent).to be_a_new(Rent)
      end
    end
  end

  describe "POST CREATE" do
    context "Passed valid attributes." do
      subject(:hash_rent){{time_begin: '2015-04-01', time_end: '2015-05-01', customer_id: 2}}
      subject(:movie){Movie.create(title: "Title_01", genre: "Genre_01")}
      it "Created a new rent." do
        expect{post :create, movie_id: movie.id, rent: hash_rent}.to change(Rent, :count).by(1)
      end
      it "Redirected to the rent." do
        expect(post :create, movie_id: movie.id, rent: hash_rent).to redirect_to ([movie, Rent.last])
      end
    end
  end

  describe "PUT UPDATE" do
    before(:each) do
      @rent = Rent.create({time_begin: '2015-04-01', time_end: '2015-05-01', movie_id: 1, customer_id: 2})
    end
    context "Passed valid attributes." do
      subject(:hash_rent){{time_begin: '2020-06-01', time_end: '2020-07-01', customer_id: 2}}
      it "Located the requestd movie." do
        put :update, id: @rent, movie_id: @rent.movie.id, rent: hash_rent
        expect(assigns(:rent)).to eq(@rent)
      end
      it "Changed rent's attributes." do
        put :update, id: @rent, movie_id: @rent.movie.id, rent: hash_rent
        @rent.reload
        expect(@rent.time_begin).to eq('2020-06-01')
        expect(@rent.time_end).to eq('2020-07-01')
      end
      it "Redirects to the update movie." do
        expect(put :update, id: @rent, movie_id: @rent.movie.id, rent: hash_rent).to redirect_to movie_rent_path
      end
    end
  end

  describe "DELETE DESTROY" do
    before(:each) do
      @rent = Rent.create({time_begin: '2015-04-01', time_end: '2015-05-01', movie_id: 1, customer_id: 2})
    end
    context "Passed valid attributes." do
      it "Delete the rent." do
        expect{delete :destroy, movie_id: 1, id: @rent}.to change(Rent, :count).by(-1)
      end
      it "Redirected to rent." do
        expect(delete :destroy, movie_id: 1, id: @rent).to redirect_to movie_rents_path
      end
    end
  end
end