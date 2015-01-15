#This class is responsible by control of the operation of CRUD in the movie.
class MoviesController < ApplicationController
  before_action :set_movie, only: [:show, :edit, :update, :destroy]

  #INDEX is responsible to show all movies. 
  def index
    @movies = Movie.all
  end

  #NEW is responsible by form filling of the movie.
  def new
    @movie = Movie.new
  end

  #CREATE is responsible by creation of the movie.
  def create
    @movie = Movie.new(movie_params)
    respond_to do |format|
      if @movie.save
        format.html {redirect_to @movie, notice: 'Movie was successfully created.'}
        format.json { render :show, status: :created, location: @movie }
      else
        format.html {render :new}
        format.json{render json: @movie.errors, status: :unprocessable_entity}
      end
    end
  end

  #UPDATE is responsible by update of the movie.
  def update
    respond_to do |format|
      if @movie.update(movie_params)
        format.html { redirect_to @movie, notice: 'Movie was successfully updated.' }
        format.json { render :show, status: :ok, location: @movie }
      else
        format.html { render :edit }
        format.json { render json: @movie.errors, status: :unprocessable_entity }
      end
    end
  end

  #DESTROY is responsible by destruction of the movie.
  def destroy
    @movie.destroy
    respond_to do |format|
      format.html {redirect_to movies_path, notice: 'Movie was successfully destroyed'}
      format.json {head :no_content}
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