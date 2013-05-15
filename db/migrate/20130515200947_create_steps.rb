class CreateSteps < ActiveRecord::Migration
  def change
    create_table :steps do |t|
      t.integer :number
      t.string :description
      t.integer :tutorial_id

      t.timestamps
    end
    add_index :steps, :tutorial_id
  end
end
