class AdminSheltersController < ApplicationController

  def index
    @shelters = Shelter.order_by_alphabetical
  end
end