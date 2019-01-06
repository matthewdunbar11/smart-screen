require 'rails_helper'

RSpec.feature 'displays administration' do
  let(:user) { FactoryBot.create(:user) }

  before do
    PublicPage.login_as(user)
  end

  describe 'create' do
    it 'allows creation of a new display' do
      click_on 'Displays'

      click_on 'Add New Display'

      display_attributes = FactoryBot.attributes_for(:display)

      fill_in 'Name', with: display_attributes[:name]

      click_on 'Create Display'

      expect(page).to have_content(display_attributes[:name])
    end
  end

  describe 'edit' do
    let(:display) { FactoryBot.create(:display, user: user) }

    it 'allows editing an existing display' do
      visit display_path(display)
      click_on 'Edit'
      fill_in 'Name', with: 'New Name'
      click_on 'Update Display'

      expect(page).to have_content('New Name')
    end
  end

  describe 'delete' do
    let(:display) { FactoryBot.create(:display, user: user) }

    it 'allows deleting an existing display' do
      visit display_path(display)
      click_on 'Delete'
      
      expect(page).not_to have_content(display.name)
    end
  end
end
