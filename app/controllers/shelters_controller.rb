class SheltersController < ApplicationController
  def index
    if params[:sort].present? && params[:sort] == "pet_count"
      @records = Shelter.order_by_number_of_pets
    elsif params[:search].present?
      @records = Shelter.search(params[:search])
    else
      @records = Shelter.order_by_recently_created
    end

    @formatted_attributes = Shelter.formatted_attributes
    @record_path = '/shelters/'
  end

  def pets
    @shelter = Shelter.find(params[:shelter_id])

    if params[:sort] == 'alphabetical'
      @shelter_pets = @shelter.alphabetical_pets
    elsif params[:age]
      @shelter_pets = @shelter.shelter_pets_filtered_by_age(params[:age])
    else
      @shelter_pets = @shelter.adoptable_pets
    end
  end

  def show
    @formatted_attributes = Shelter.formatted_attributes
    @record = Shelter.find(params[:id])
  end

  def new
  end

  def create
    shelter = Shelter.new(shelter_params)

    if shelter.save
      redirect_to '/shelters'
    else
      redirect_to '/shelters/new'
      flash[:alert] = "Error: #{error_message(shelter.errors)}"
    end
  end

  def edit
    @shelter = Shelter.find(params[:id])
  end

  def update
    shelter = Shelter.find(shelter_params[:id])
    if shelter.update(shelter_params)
      redirect_to '/shelters'
    else
      redirect_to "/shelters/#{shelter.id}/edit"
      flash[:alert] = "Error: #{error_message(shelter.errors)}"
    end
  end

  def destroy
    shelter = Shelter.find(params[:id])
    shelter.destroy
    redirect_to '/shelters'
  end

  private

  def shelter_params
    params.permit(:id, :name, :street_address, :city, :state, :zip_code, :foster_program, :rank)
  end
end
