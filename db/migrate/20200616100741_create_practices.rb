class CreatePractices < ActiveRecord::Migration[6.0]
  def change
    create_table :practices do |t|
      t.string   :title
      t.text     :long_description
      t.string   :street
      t.string   :street_number
      t.string   :city
      t.string   :country
      t.string   :zip_code
    	t.datetime :starting_date_time
      t.integer	 :duration
      t.boolean  :canceled
      t.timestamps
    end
  end
end
