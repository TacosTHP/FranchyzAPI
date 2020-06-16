class AddColumnToCoach < ActiveRecord::Migration[6.0]
  def change
    add_column :coaches, :first_name, :string
    add_column :coaches, :last_name, :string
    add_column :coaches, :phone, :string
    add_column :coaches, :birthdate, :date
    add_column :coaches, :arrival, :date
    add_column :coaches, :admin?, :boolean
  end
end
