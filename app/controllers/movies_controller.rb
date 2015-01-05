#This class controll the operation of CRUD in the movie.
class MoviesController < ApplicationController
  before_action :set_movie, only: [:show, :edit, :update, :destroy]

  #The INDEX is responsible to link the url.
  def index
    @movies = Movie.all
  end

  #The NEW is responsible to init of movie.
  def new
    @movie = Movie.new
  end

  #The CREATE is responsible to add a new movie.
  #Receive the title and genre.
  #If don't save the movie is show a message of error.
  def create
    @movie = Movie.new(movie_params)
    respond_to do |format|
      if @movie.save
        format.html{redirect_to @movie, notice: 'Movie was successfully created.'}
    format.json{render :show, status: :created, location: @movie}
      else
        format.html{render :new}
    format.json{render json: @movie.errors, status: unprocessable_entity}
      end
    end
  end

  #The UPDATE is responsable to modify a movie.
  #Receive the id of the movie that go to modified.
  #Receive a new title and a new genre.
  def update
    respond_to do |format|
      if @movie.update(movie_params)
        format.html{redirect_to @movie, notice: 'Movie was successfully updated.'}
        format.json{render :show, status: :ok, location: @movie}
      else
        format.html{render :edit}
        format.json{render json: @movie.errors, status: :unprocessable_entity}
      end
    end
  end

  #The DESTROY is responsable to delete a movie.
  #Receive the id of the movie that go to deleted.
  def destroy
    @movie.destroy
    respond_to do |format|
      format.html{redirect_to movies_path, notice: 'Movie was successfully destroyed'}
      format.json{head :no_content}
    end
  end

  private

  def movie_params
    params.require(:movie).permit(:title, :genre)
  end

  def set_movie
    @movie = Movie.find(params[:id])
  end
end
