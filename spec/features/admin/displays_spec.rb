require 'rails_helper'

RSpec.feature 'displays administration' do
  let(:user) { FactoryBot.create(:user) }

  before do
    PublicPage.login_as(user)
  end

  describe 'create', javascript: true do
    it 'allows creation of a new display' do
      click_on 'Displays'

      click_on 'Add New Display'

      display_attributes = FactoryBot.attributes_for(:display)
      fill_in 'Name', with: display_attributes[:name]
      click_on 'Create Display'

      expect(page).to have_content(display_attributes[:name])
      expect(page).to have_select 'Content', with_options: ['Clock']
    end
  end

  describe 'present' do
    let(:display) { FactoryBot.create(:display, user: user, displayable: FactoryBot.build(:clock)) }

    it 'presents the selected display' do
      current_time = Time.current
      allow(Time).to receive(:current).and_return(current_time)
      visit present_display_path(display)
      expect(page).to have_content(current_time.in_time_zone('EST').strftime('%r'))
    end
  end

  describe 'edit', js: true do
    let!(:display) { FactoryBot.create(:display, user: user, displayable: nil) }

    it 'allows editing an existing display' do
      visit displays_path
      DisplaysPage.display_row(display).find('.edit').click
      select 'Clock', from: 'Content'
      expect(page).to have_select 'Time Zone'
      
      select 'Eastern Time (US & Canada)', from: 'Time Zone'
      expect(page).to have_select 'Time Zone', selected: 'Eastern Time (US & Canada)'
    end

    # it 'links to the attached displayables form' do
    #   visit display_path(display)
    #   click_on 'Edit'
    #   select 'Eastern Time (US & Canada)', from: 'Time Zone'
    #   click_on 'Update Clock'
    #   expect(page).to have_content('Time Zone')
    #   expect(page).to have_content('Eastern Time (US & Canada)')
    # end
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
