class CreatePractices < ActiveRecord::Migration[6.0]
  def change
    create_table :practices do |t|
    	t.datetime 	:starting_date_time
      t.integer		:duration
      t.string 		:address
      t.integer 	:zip_code
      t.string 		:city

      t.timestamps
    end
  end
end
