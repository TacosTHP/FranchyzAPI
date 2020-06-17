class CreateClubs < ActiveRecord::Migration[6.0]
  def change
    create_table :clubs do |t|
      t.string  :name
      t.string  :logo_url
      t.string  :zip_code
      t.string  :address
      t.string  :country
      t.text    :description
      t.string  :city
      t.date    :date_of_creation
      t.string  :league
      t.string  :conference
      t.string  :pool
      t.belongs_to :creator, index: true, foreign_key: {to_table: :coaches}
      t.timestamps
    end
  end
end
