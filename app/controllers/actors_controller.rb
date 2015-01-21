#This class is responsible by control of the operation of CRUD in the actor.
class ActorsController < ApplicationController
  before_action :set_actor, only: [:show, :edit, :update, :destroy]

  # INDEX is responsible to show all actors. 
  # == Returns
  # When this method is called, it return a variable @actor with all actors in the database.
  def index
    # The variable @actors receive all actors.
    @actors = Actor.all
  end

  # NEW is responsible by form filling of the actor.
  # == Returns
  # When this method is called, it return a new actor.
  def new
    # The variable @actor receive the object actor.
    @actor = Actor.new
  end

  # CREATE is responsible by creation of the actor.
  # == Parameters:
  # This method receive the method NEW with ACTOR_PARAMS.
  # == Returns
  # It return a object.
  # If the object was successfully created you was receive the message "actor was successfully created.".
  # If the object wasnt successfully created you was receive a message of error.
  def create
    @actor = Actor.new(actor_params)
    respond_to do |format|
      if @actor.save
        format.html {redirect_to @actor, notice: 'Actor was successfully created.'}
        format.json { render :show, status: :created, location: @actor }
      else
        format.html {render :new}
        format.json{render json: @actor.errors, status: :unprocessable_entity}
      end
    end
  end

  # UPDATE is responsible by update of the actor.
  # == Parameters
  # It receive the parameters the id of the actor with you wnat to modifly and
  # the id ACTOR_PARAM of the new actor with you want to add.
  # == Returns
  # If the actor was successfully updated you was receive the message "Actor was successfully updated.".
  # If the actor wasnt successfully updated you was receive a message of error.
  def update
    respond_to do |format|
      if @actor.update(actor_params)
        format.html { redirect_to @actor, notice: 'Actor was successfully updated.' }
        format.json { render :show, status: :ok, location: @actor }
      else
        format.html { render :edit }
        format.json { render json: @actor.errors, status: :unprocessable_entity }
      end
    end
  end

  #DESTROY is responsible by destruction of the actor.
  # == Parameters
  # This method receive the id of the actor with you want to destroy.
  # == Returns
  # If the actor was successfully destroyed you was receive the message "Actor was successfully destroyed.".
  # If the actor wasnt successfully destroyed you was receive a message of error.
  def destroy
    @actor.destroy
    respond_to do |format|
      format.html {redirect_to actors_path, notice: 'Actor was successfully destroyed.'}
      format.json {head :no_content}
    end
  end

  private

  # The ACTOR_PARAMS you create a hash with all values necessary to created a new actor.
  # == Parameters
  # This method receive with params two string, a true_name, artistic_name and a brith. 
  # == Returns
  # It return a hash with the true_name, the artistic_name and the birth of the actor.
  def actor_params
    params.require(:actor).permit(:true_name, :artistic_name, :birth)
  end

  # The SET_ACTOR is responsible by find a specific actor.
  # == Parameters
  # This method recevei a id.
  # == Returns
  # It return a actor that contains the id specific above.
  def set_actor
    @actor = Actor.find(params[:id])
  end
end