class CreateTeams < ActiveRecord::Migration[6.0]
  def change
    create_table :teams do |t|
      t.string      :title
      t.belongs_to  :coach
      t.belongs_to  :creator, index: true, foreign_key: {to_table: :coaches}
      # t.belongs_to  :club
      t.timestamps
    end
  end
end
