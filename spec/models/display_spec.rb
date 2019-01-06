require 'rails_helper'

RSpec.describe Display, type: :model do
  let(:user) { FactoryBot.create(:user) }
  let(:display) { FactoryBot.create(:display, user: user) }

  it 'requires a user' do
    display = FactoryBot.build(:display, user: nil)
    expect(display).not_to be_valid
  end

  it 'has many screens' do
    predefined_layout_screen = FactoryBot.build(:predefined_layout_screen)
    display.screens.create!(displayable: predefined_layout_screen)
    expect(display.screens.first.displayable).to eq(predefined_layout_screen)
  end

  it 'has displayable types' do
    expect(Display::DISPLAYABLE_TYPES).to eq([
      PredefinedLayoutScreen,
      FullScreen
    ])
  end
end
