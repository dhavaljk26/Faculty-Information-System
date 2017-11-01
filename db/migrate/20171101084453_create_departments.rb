class CreateDepartments < ActiveRecord::Migration[5.1]
  def change
    create_table :departments do |t|
      t.string :name, :null => false, :unique => true
      t.string :department_type, :null => false
      t.integer :department_head_id, :limit => 8
      t.timestamps
    end
  end
end
