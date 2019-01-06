class CreatePredefinedLayoutScreens < ActiveRecord::Migration[5.2]
  def change
    create_table :predefined_layout_screens do |t|
      t.timestamps
    end
  end
end
