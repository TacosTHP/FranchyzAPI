class CreateEvents < ActiveRecord::Migration[6.0]
  def change
    create_table :events do |t|
      t.belongs_to  :player
      t.belongs_to  :game
      t.belongs_to  :practice
      t.boolean :confirmed?
      t.timestamps
    end
  end
end
