#This class is responsible by control of the operation of CRUD in the movie.
class MoviesController < ApplicationController
  before_action :set_movie, only: [:show, :edit, :update, :destroy]

  # INDEX is responsible to show all movies. 
  # == Returns
  # When this method is called, it return a variable @movie with all movies in the database.
  def index
    # The variable @movies receive all movies.
    @movies = Movie.all
  end

  # NEW is responsible by form filling of the movie.
  # == Returns
  # When this method is called, it return a new movie.
  def new
    # The variable @movie receive the object movie.
    @movie = Movie.new
  end

  # CREATE is responsible by creation of the movie.
  # == Parameters:
  # This method receive the method NEW with MOVIE_PARAMS.
  # == Returns
  # It return a object.
  # If the object was successfully created you was receive the message "Movie was successfully created.".
  # If the object wasnt successfully created you was receive a message of error.
  def create
    @movie = Movie.new(params[:movie])
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

  # UPDATE is responsible by update of the movie.
  # == Parameters
  # It receive the parameters the id of the movie with you wnat to modifly and
  # the id MOVIE_PARAM of the new movie with you want to add.
  # == Returns
  # If the movie was successfully updated you was receive the message "Movie was successfully updated.".
  # If the movie wasnt successfully updated you was receive a message of error.
  def update
    respond_to do |format|
      if @movie.update_attributes(params[:movie])
        format.html { redirect_to @movie, notice: 'Movie was successfully updated.' }
        format.json { render :show, status: :ok, location: @movie }
      else
        format.html { render :edit }
        format.json { render json: @movie.errors, status: :unprocessable_entity }
      end
    end
  end

  #DESTROY is responsible by destruction of the movie.
  # == Parameters
  # This method receive the id of the movie with you want to destroy.
  # == Returns
  # If the movie was successfully destroyed you was receive the message "Movie was successfully destroyed.".
  # If the movie wasnt successfully destroyed you was receive a message of error.
  def destroy
    @movie.destroy
    respond_to do |format|
      format.html {redirect_to movies_path, notice: 'Movie was successfully destroyed.'}
      format.json {head :no_content}
    end
  end

  private

  # The MOVIE_PARAMS you create a hash with all values necessary to created a new movie.
  # == Parameters
  # This method receive with params two string, a title and a genre. 
  # == Returns
  # It return a hash with the title and the genre of the movie.
  def movie_params
    params.require(:movie).permit(:title, :genre)
  end

  # The SET_MOVIE is responsible by find a specific movie.
  # == Parameters
  # This method recevei a id.
  # == Returns
  # It return a movie that contains the id specific above.
  def set_movie
    @movie = Movie.find(params[:id])
  end
end