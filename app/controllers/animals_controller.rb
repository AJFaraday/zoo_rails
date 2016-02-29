class AnimalsController < ApplicationController

  def index
    @species = Species.order('name asc').all
  end
  
  def show
    @animal = Animal.find(params[:id])
  end
  
  def new
    @animal = Animal.new
  end

  def feed
    @animal = Animal.find(params[:id])
    @animal.feed
    flash[:notice] = "You've fed #{@animal.name}, thanks!"
    redirect_to animal_url(@animal)
  end

  def create
    @animal = Animal.new(params[:animal])
    if @animal.save
      flash[:notice] = "We've saved the details for #{@animal.name}"
      redirect_to animal_url(@animal)
    else
      flash[:error] = "You did something dumb, silly!"
      render :new
    end
  end
  
  def edit
    @animal = Animal.find(params[:id])
  end
  
  def update
    @animal = Animal.find(params[:id])
    if @animal.update_attributes(params[:animal])
      flash[:notice] = "We've saved the details for #{@animal.name}"
      redirect_to animal_url(@animal)
    else
      flash[:error] = "You did something dumb, silly!"
      render :new
    end 
  end

  def destroy
    @animal = Animal.find(params[:id])
    @animal.destroy
    redirect_to animals_url
  end
  
end
