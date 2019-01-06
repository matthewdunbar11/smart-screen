class CreateFullScreens < ActiveRecord::Migration[5.2]
  def change
    create_table :full_screens do |t|

      t.timestamps
    end
  end
end
