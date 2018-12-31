class CreatePredefinedLayoutScreens < ActiveRecord::Migration[6.0]
  def change
    create_table :predefined_layout_screens do |t|
      t.references :display, foreign_key: true

      t.timestamps
    end
  end
end
