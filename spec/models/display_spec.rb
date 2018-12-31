require 'rails_helper'

RSpec.describe Display, type: :model do
  let(:user) { FactoryBot.create(:user) }
  let(:display) { FactoryBot.create(:display, user: user) }

  it 'belongs to a user' do
    expect(display.user).to eq(user)
  end

  it 'has many predefined_layout_screens' do
    expect(display.predefined_layout_screens).to match_array([])
  end
end
