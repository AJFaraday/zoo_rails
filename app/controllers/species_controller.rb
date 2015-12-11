class SpeciesController < ApplicationController

  def index
    @species = Species.order('name asc').all
  end
 
  def show
    @species = Species.find(params[:id])
  end  

  def new
    @species = Species.new
  end 
 
  def create
    @species = Species.new(params[:species])
    if @species.save
      redirect_to species_url(@species) 
    else
      flash[:error] = "You did something dumb, silly!"
      render :new
    end
  end
 
  def edit
    @species = Species.find(params[:id])
  end 
  
  def update
    @species = Species.find(params[:id])
    if @species.update_attributes(params[:species])
      redirect_to species_url(@species)
    else
      flash[:error] = "You did something dumb, silly!"
      render :new
    end
  end

  def destroy
    @species = Species.find(params[:id])
    @species.destroy
    redirect_to species_index_path
  end

end


