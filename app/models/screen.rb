class Screen < ApplicationRecord
  belongs_to :display
  belongs_to :displayable, polymorphic: true
end
