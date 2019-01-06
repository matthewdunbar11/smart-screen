class Display < ApplicationRecord
  DISPLAYABLE_TYPES = [Clock]

  belongs_to :user
  belongs_to :displayable, polymorphic: true, optional: true
end
