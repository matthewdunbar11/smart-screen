class Clock < ApplicationRecord
  has_one :display, as: :displayable

  def self.label
    'Clock'
  end
end
