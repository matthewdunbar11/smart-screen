require 'rails_helper'

RSpec.describe Display, type: :model do
  let(:user) { FactoryBot.create(:user) }
  let(:display) { FactoryBot.create(:display, user: user) }

  it 'requires a user' do
    display = FactoryBot.build(:display, user: nil)
    expect(display).not_to be_valid
  end

  it 'has one displayable' do
    expect(display.displayable).to be_nil
  end

  it 'has displayable types' do
    expect(Display::DISPLAYABLE_TYPES).to eq([Clock])
  end
end
