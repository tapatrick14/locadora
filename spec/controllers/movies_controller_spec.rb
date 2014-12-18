require 'rails_helper'

RSpec.describe MoviesController, :type => :controller do

  describe "Get index" do	
  	context "Test if the page was created." do
  	  it "Has a 200 a code" do
  	    get :index
  	    expect(response.status).to eq(200)
  	  end
  	end

  	context "Test if the movie was created." do
  	  subject(:movie){Movie.create}
  	  it "Created an array of contacts." do
  	  	get :index		
  	  	expect(assigns(:movies)).to eq([movie])
  	  end
  	end

  	context "Test if the movie wasn't created." do
  	  it "Didn't create an array of contacts." do
  	  	get :index		
  	  	expect(assigns(:movies)).to eq([])
  	  end
  	end
  end

  describe "Get new" do
  	context "Test if was created a movie." do
  	  subject(:movie){Movie.new}
  	  it "Created a new movie." do
  	  	expect(movie).to be_a_new(Movie)
  	  end
  	end
  end

  describe "Post create" do
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

  describe "Put update" do
  	before(:each) do
  		@movie = Movie.create({title: "Title_01", genre: "Genre_01"})
  	end
  	context "Passed valid attributes." do
  	  subject(:hash_movie){{title: "Title_02", genre: "Genre_02"}}
  	  it "Located the requestd movie." do
  	  	put :update, id: @movie, movie: hash_movie
  	  	assigns(:movie).should eq(@movie)
      end
  	  it "Changed movie's attributes." do
  	  	put :update, id: @movie, movie: hash_movie
  	  	@movie.reload
  	  	@movie.title.should eq("Title_02")
  	  	@movie.genre.should eq("Genre_02")
  	  end
  	  it "Redirects to the update movie." do
  	  	put :update, id: @movie, movie: hash_movie
  	  	response.should redirect_to @movie
  	  end
  	end
  end

  describe "Delete destroy" do
  	before(:each) do
  		@movie = Movie.create({title: "Title_01", genre: "Genre_01"})
  	end
  	context "Passed valid attributes." do
  	  it "Delete the movie." do
  	  	expect{delete :destroy, id: @movie}.to change(Movie, :count).by(-1)
  	  end
  	  it "Redirected to movie." do
  	  	delete :destroy, id: @movie
  	  	response.should redirect_to movies_path
  	  end
  	end
  end

end


