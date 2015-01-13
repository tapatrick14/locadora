## This class controll the operation of CRUD for the dvds.
class DvdsController < ApplicationController

  # The index method print all dvds.
  def index
    @dvds = Dvd.order :id
  end

  # The show method shows particular dvd.
  def show
    @dvd = Dvd.find(params[:id])
  end

  # The destroy method delete a particular dvd.
  # Receive the id of the dvd.
  def destroy
    @dvd = Dvd.find(params[:id])
    @dvd.destroy
    redirect_to(action: "index")
  end

  # The new method is responsible to init the dvd.
  def new
    @dvd = Dvd.new
  end

  # The create method create and add a new dvd.
  # Receive the volume.
  def create
    @dvd = Dvd.new(dvd_params)
    if @dvd.save
      redirect_to(action: "show", id: @dvd)
    else
      render action: "new"
    end
  end

  # The edit method select a particular dvd.
  def edit
    @dvd = Dvd.find(params[:id])
  end

  # The update method changes a dvd selected in the edit method.
  # Receive the id of the dvd
  # Receive the volume
  def update
    @dvd = Dvd.find(params[:id])
    @dvd.update_attributes(dvd_params)
    redirect_to action: "show", id: @dvd
  end

  private

  def dvd_params
    params.require(:dvd).permit(:volume)
  end
end