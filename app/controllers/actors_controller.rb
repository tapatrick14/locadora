#This class is responsible by control of the operation of CRUD in the actor.
class ActorsController < ApplicationController
  before_action :set_actor, only: [:show, :edit, :update, :destroy]

  #INDEX is responsible to show all actor.
  def index
    @actors = Actor.all
  end

  #NEW is responsible by form filling of the actor.
  def new
    @actor = Actor.new
  end

  #CREATE is responsible by creation of the actor.
  def create
    @actor = Actor.new(actor_params)
    respond_to do |format|
      if @actor.save
        format.html {redirect_to @actor, notice: 'Actor was successfully created.'}
        format.json {render :show, status: :created, location: @actor}
      else
        format.html{render :new}
        format.json{render json: @actor.errors, status: unprocessable_entity}
      end
    end
  end

  #UPDATE is responsible by update of the actor.
  def update
    respond_to do |format|
      if @actor.update(actor_params)
        format.html {redirect_to @actor, notice: 'Actor was successfully updated.'}
        format.json {render :show, status: :ok, location: @actor}
      else
        format.html {render :edit}
        format.json {render json: @actor.errors, status: :unprocessable_entity}
      end
    end
  end

  #DESTROY is responsible by destruction of the actor.
  def destroy
    @actor.destroy
    respond_to do |format|
      format.html {redirect_to actors_path, notice: 'Actor was successfully destroyed'}
      format.json {head :no_content}
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