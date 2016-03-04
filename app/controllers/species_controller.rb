class SpeciesController < ApplicationController

  before_filter :get_species, 
                :only => [:show, :edit, :update, :destroy]

  def index
    @species = Species.order('name asc').all
  end
 
  def show
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
  end 
  
  def update
    if @species.update_attributes(params[:species])
      redirect_to species_url(@species)
    else
      flash[:error] = "You did something dumb, silly!"
      render :new
    end
  end

  def destroy
    @species.destroy
    redirect_to species_index_path
  end


  def get_species
    @species = Species.find(params[:id])
  end

end


