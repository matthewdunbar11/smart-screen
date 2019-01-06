class CreateScreens < ActiveRecord::Migration[5.2]
  def change
    create_table :screens do |t|
      t.references :display
      t.references :displayable, polymorphic: true

      t.timestamps
    end
  end
end
