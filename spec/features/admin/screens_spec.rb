require 'rails_helper'

RSpec.feature 'screens administration' do
  let(:user) { FactoryBot.create(:user) }
  let(:display) { FactoryBot.create(:display, user: user) }

  before do
    PublicPage.login_as(user)
  end

  describe 'create' do
    it 'creates a new screen for a display' do
      visit display_path(display)
      click_on 'Add Screen'

      select 'Full Screen', from: 'Layout'
      click_on 'Next'

      expect(page).to have_content('Full Screen')
    end
  end

  describe 'destroy' do
    let(:full_screen) { FactoryBot.create(:full_screen) }
    let!(:screen) { FactoryBot.create(:screen, display: display, displayable: full_screen)}

    it 'deletes a screen from a display' do
      visit display_path(display)
      find("[data-screen-id='#{screen.id}']").click_on 'Delete'
      expect(page).not_to have_selector("[data-screen-id='#{screen.id}']")
    end
  end
end