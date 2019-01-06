class Display < ApplicationRecord
  DISPLAYABLE_TYPES = [PredefinedLayoutScreen, FullScreen]

  belongs_to :user
  has_many :screens
end
