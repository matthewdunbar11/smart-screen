require 'rails_helper'

RSpec.feature 'displays administration' do
  describe 'create' do
    it 'allows creation of a new display' do
      visit root_url
    end
  end
end
