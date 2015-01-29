#This class is responsible by control of the operation of CRUD in the rent.
class RentsController < ApplicationController
  before_action :set_rent, only: [:show, :edit, :update, :destroy]

  # INDEX is responsible to show all rents. 
  # == Returns
  # When this method is called, it return a variable @rent with all rents in the database.
  def index
    # The variable @rents receive all rents.
    @rents = Rent.all
  end

  # NEW is responsible by form filling of the rent.
  # == Returns
  # When this method is called, it return a new rent.
  def new
    # Find the id of movie rented.
    movie = Movie.find(params[:movie_id])
    # The variable @rent receive the object rent.
    @rent = movie.rents.new
  end

  # CREATE is responsible by creation of the rent.
  # == Parameters:
  # This method receive the method NEW with RENT_PARAMS.
  # == Returns
  # It return a object.
  # If the object was successfully created you was receive the message "Rent was successfully created.".
  # If the object wasnt successfully created you was receive a message 
  def create
    movie = Movie.find(params[:movie_id])
    @rent = movie.rents.new(rent_params)
    respond_to do |format|
      if @rent.save
        format.html {redirect_to [@rent.movie, @rent], notice: 'Rent was successfully created.'}
        format.json { render :show, status: :created, location: @rent }
      else
        format.html {render :new}
        format.json{render json: @rent.errors, status: :unprocessable_entity}
      end
    end
  end

  # UPDATE is responsible by update of the rent.
  # == Parameters
  # It receive the parameters the id of the rent with you wnat to modifly and
  # the id RENT_PARAM of the new rent with you want to add.
  # == Returns
  # If the rent was successfully updated you was receive the message "Rent was successfully updated.".
  # If the rent wasnt successfully updated you was receive a message of error.
  def update
    respond_to do |format|
      if @rent.update(rent_params)
        format.html { redirect_to [@rent.movie, @rent], notice: 'Rent was successfully updated.' }
        format.json { render :show, status: :ok, location: @rent }
      else
        format.html { render :edit }
        format.json { render json: @rent.errors, status: :unprocessable_entity }
      end
    end
  end

  #DESTROY is responsible by destruction of the rent.
  # == Parameters
  # This method receive the id of the rent with you want to destroy.
  # == Returns
  # If the rent was successfully destroyed you was receive the message "Rent was successfully destroyed.".
  # If the rent wasnt successfully destroyed you was receive a message of error.
  def destroy
    @rent.destroy
    respond_to do |format|
      format.html {redirect_to movie_rents_path, notice: 'Rent was successfully destroyed.'}
      format.json {head :no_content}
    end
  end

  private

  # The RENT_PARAMS you create a hash with all values necessary to created a new rent.
  # == Parameters
  # This method receive with params two date, date_end e date begin_and the id of the movie and customer. 
  # == Returns
  # It return a hash with the dates and the ids.
  def rent_params
    params.require(:rent).permit(:time_begin, :time_end, :movie_id, :customer_id)
  end

  # The SET_RENT is responsible by find a specific rent.
  # == Parameters
  # This method recevei a id.
  # == Returns
  # It return a rent that contains the id specific above.
  def set_rent
    @rent = Rent.find(params[:id])
  end
end