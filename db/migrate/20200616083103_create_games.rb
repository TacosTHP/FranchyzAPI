class CreateGames < ActiveRecord::Migration[6.0]
  def change
    create_table :games do |t|
      t.string :title
      t.text :long_description
      t.string :street
      t.string :street_number
      t.string :country
      t.string :zip_code    
      t.datetime :starting_date_time
      t.integer :duration
      t.integer :home_team_score
      t.integer :away_team_score
      t.boolean :canceled

      t.timestamps
    end
  end
end
