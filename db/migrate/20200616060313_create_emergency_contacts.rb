class CreateEmergencyContacts < ActiveRecord::Migration[6.0]
  def change
    create_table :emergency_contacts do |t|
      t.string :first_name
      t.string :last_name
      t.string :phone_number

      t.timestamps
    end
  end
end
