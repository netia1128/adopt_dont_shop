require 'rails_helper'

RSpec.describe 'admin_shelters index page', type: :feature do
  before (:each) do
    @shelter1 = Shelter.create(name: 'Fluffy Friends', street_address: '1311 E 27th Ave', city: 'Denver', state: 'CO', zip_code: 80205, foster_program: false, rank: 9)
    @shelter2 = Shelter.create(name: 'Coon City', street_address: '201 W Colfax Ave', city: 'Denver', state: 'CO', zip_code: 80202, foster_program: false, rank: 5)
    @shelter3 = Shelter.create(name: 'Cat Savers', street_address: '1455 High St', city: 'Denver', state: 'CO', zip_code: 80218, foster_program: true, rank: 10)

    @pet_1 = @shelter1.pets.create(name: 'Mr. Pirate', breed: 'tuxedo shorthair', age: 5, adoptable: false)
    @pet_2 = @shelter1.pets.create(name: 'Clawdia', breed: 'shorthair', age: 3, adoptable: true)
    @pet_3 = @shelter3.pets.create(name: 'Lucille Bald', breed: 'sphynx', age: 8, adoptable: true)
    @pet_4 = @shelter1.pets.create(name: 'Ann', breed: 'ragdoll', age: 5, adoptable: true)

    @application1 = Application.create!(name: "Suzie Q", street_address: '1311 E 27th Ave', city: 'Denver', state: 'CO', zip_code: 80205, statement: "TEST", status: 'Pending')
    @application2 = Application.create!(name: "Jane Doe", street_address: '201 W Colfax Ave', city: 'Denver', state: 'CO', zip_code: 80202, statement: "TEST", status: 'Pending')
    @application3 = Application.create!(name: "Barak Obama", street_address: '1600 Pennsylvania Ave', city: 'Washington', state: 'DC', zip_code: 20500, statement: "TEST", status: 'Pending')

    @application_pet1 = ApplicationPet.create!(application: @application1, pet: @pet_1)
    @application_pet2 = ApplicationPet.create!(application: @application2, pet: @pet_3)
    @application_pet3 = ApplicationPet.create!(application: @application3, pet: @pet_2)
  end

  describe 'default page appearance' do
    it 'lists the names all shelters' do
      visit "/admin/shelters/"

      within "#admin-shelters-all" do
        expect(page).to have_content('Fluffy Friends')
        expect(page).to have_content('Coon City')
        expect(page).to have_content('Cat Savers')
      end
    end
    it 'the names of each shelter on the page is a link to its admin show page' do
      visit "/admin/shelters/"

      within "#admin-shelters-all" do
        click_link 'Fluffy Friends'
        expect(current_path).to eq("/admin/shelters/#{@shelter1.id}")
      end

      visit "/admin/shelters/"

      within "#admin-shelters-pending-apps" do
        click_link 'Cat Savers'
        expect(current_path).to eq("/admin/shelters/#{@shelter3.id}")
      end
    end

    it 'lists all shelters with pending apps ordered alphabetically' do
      visit "/admin/shelters"

      within "#admin-shelters-pending-apps > tr:nth-child(2)" do
        expect(page).to have_content('Cat Savers')
      end

      within "#admin-shelters-pending-apps > tr:nth-child(3)" do
        expect(page).to have_content('Fluffy Friends')
      end
    end
  end
end