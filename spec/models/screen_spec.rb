require 'rails_helper'

RSpec.describe Screen, type: :model do
  describe '.displayable' do
    it 'can be assigned any displayable type' do
      predefined_layout_screen = FactoryBot.build(:predefined_layout_screen)
      screen = FactoryBot.create(:screen, displayable: predefined_layout_screen)
      expect(screen.displayable).to eq(predefined_layout_screen)
    end
  end
end
