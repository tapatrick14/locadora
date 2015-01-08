#This class controll the operation of CRUD in the actor.
class ActorsController < ApplicationController
  before_action :set_actor, only: [:show, :edit, :update, :destroy]

  #The INDEX is responsible to link the url.
  def index
    @actors = Actor.all
  end

  #The NEW is responsible to init of actor.
  def new
    @actor = Actor.new
  end

  #The CREATE is responsible to add a new actor.
  #Receive the true_name, artistic_name and date_birth.
  #If don't save the actor is show a message of error.
  def create
    @actor = Actor.new(actor_params)
    respond_to do |format|
      if @actor.save
        format.html{redirect_to @actor, notice: 'Actor was successfully created.'}
        format.json{render :show, status: :created, location: @actor}
      else
        format.html{render :new}
    format.json{render json: @actor.errors, status: unprocessable_entity}
      end
    end
  end

  #The UPDATE is responsable to modify a actor.
  #Receive the id of the actor that go to modified.
  #Receive a new true_name, artistic_name and a new date_birth.
  def update
    respond_to do |format|
      if @actor.update(actor_params)
        format.html{redirect_to @actor, notice: 'Actor was successfully updated.'}
        format.json{render :show, status: :ok, location: @actor}
      else
        format.html{render :edit}
        format.json{render json: @actor.errors, status: :unprocessable_entity}
      end
    end
  end

  #The DESTROY is responsable to delete a actor.
  #Receive the id of the actor that go to deleted.
  def destroy
    @actor.destroy
    respond_to do |format|
      format.html{redirect_to actors_path, notice: 'Actor was successfully destroyed'}
      format.json{head :no_content}
    end
  end

  private

  def actor_params
    params.require(:actor).permit(:true_name, :artistic_name, :date_birth)
  end

  def set_actor
    @actor = Actor.find(params[:id])
  end
end
