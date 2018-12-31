class Display < ApplicationRecord
  belongs_to :user
  has_many :predefined_layout_screens
end
