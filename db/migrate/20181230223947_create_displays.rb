class CreateDisplays < ActiveRecord::Migration[5.2]
  def change
    create_table :displays do |t|
      t.string :name
      t.references :user, foreign_key: true
      t.references :displayable, polymorphic: true
      
      t.timestamps
    end
  end
end
