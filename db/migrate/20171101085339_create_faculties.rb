class CreateFaculties < ActiveRecord::Migration[5.1]
  def change
    create_table :faculties do |t|
      t.string :first_name, :null => false
      t.string :middle_name
      t.string :last_name
      t.string :designation, :null => false
      t.date :joining_date, :null => false
      t.string :office_phone_no, :null => false
      t.string :mobile_no, :null => false
      t.date :birth_date, :null => false
      t.string :gender, :null => false
      t.string :office_address_locality, :null => false
      t.string :office_address_city, :null => false
      t.string :office_address_state, :null => false
      t.string :office_address_country, :null => false
      t.integer :office_address_pin_code, :null => false
      t.string :home_address_locality, :null => false
      t.string :home_address_city, :null => false
      t.string :home_address_state, :null => false
      t.string :home_address_country, :null => false
      t.integer :home_address_pin_code, :null => false
      t.string :email, :null => false, :unique => true
      t.string :password_digest, :null => false
      t.references :department, foreign_key: true
      t.boolean :admin, :default => false

      t.timestamps
    end
  end
end
