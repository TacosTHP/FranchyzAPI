class CreateAttendances < ActiveRecord::Migration[6.0]
  def change
    create_table :attendances do |t|
      t.belongs_to  :player
      t.belongs_to  :game
      t.belongs_to  :practice
      t.boolean :confirmed?, default: false
      t.timestamps
    end
  end
end
