require 'rails_helper'

RSpec.describe MoviesController, :type => :controller do
  before :each do
    sign_in
  end
  
  describe "GET INDEX." do
    context "Test if the page was created." do
      it "Has a 200 a code." do
        get :index
        expect(response.status).to eq(200)
      end
    end
  end

  describe "GET NEW" do
    context "Test if was created a movie." do
      subject(:movie){Movie.new}
      it "Created a new movie." do
        expect(movie).to be_a_new(Movie)
      end
    end
  end

  describe "POST CREATE" do
    context "Passed valid attributes." do
      subject(:hash_movie){{title: "Title", genre: "Genre"}}
      it "Created a new movie." do
        expect{post :create, movie: hash_movie}.to change(Movie, :count).by(1)
      end
      it "Redirected to the movie." do
        expect(post :create, movie: hash_movie).to redirect_to Movie.last
      end
    end
  end

  describe "PUT UPDATE" do
    before(:each) do
      @movie = Movie.create({title: "Title_01", genre: "Genre_01"})
    end
    context "Passed valid attributes." do
      subject(:hash_movie){{title: "Title_02", genre: "Genre_02"}}
      it "Located the requestd movie." do
        put :update, id: @movie, movie: hash_movie
        expect(assigns(:movie)).to eq(@movie)
      end
      it "Changed movie's attributes." do
        put :update, id: @movie, movie: hash_movie
        @movie.reload
        expect(@movie.title).to eq("Title_02")
        expect(@movie.genre).to eq("Genre_02")
      end
      it "Redirects to the update movie." do
        expect(put :update, id: @movie, movie: hash_movie).to redirect_to @movie
      end
    end
  end

  describe "DELETE DESTROY" do
    before(:each) do
      @movie = Movie.create({title: "Title_01", genre: "Genre_01"})
    end
    context "Passed valid attributes." do
      it "Delete the movie." do
        expect{delete :destroy, id: @movie}.to change(Movie, :count).by(-1)
      end
      it "Redirected to movie." do
        expect(delete :destroy, id: @movie).to redirect_to movies_path
      end
    end
  end
end