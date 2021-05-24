class Pet < ApplicationRecord
  validates :name, presence: true
  validates :age, presence: true, numericality: true
  has_many :application_pets
  has_many :applications, through: :application_pets
  belongs_to :shelter

  def shelter_name
    shelter.name
  end

  def self.adoptable
    where(adoptable: true)
  end

  def self.search_by_name(search)
    pets = Pet.arel_table
    where(pets[:name].matches("%#{search}%"))
  end

  def self.filter_by_pending_apps
    where(:id => ApplicationPet.filter_by_pending_apps).pluck(:shelter_id)
  end

  def application_status(application_id)
    #does this belong in application pet? If so, do i "link" to a method there from here?
    ApplicationPet.where(application_id: application_id, pet_id: self.id).pluck(:status).first
  end
end
