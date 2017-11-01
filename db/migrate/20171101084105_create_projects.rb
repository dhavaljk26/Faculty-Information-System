class CreateProjects < ActiveRecord::Migration[5.1]
  def change
    create_table :projects do |t|
      t.string :title, :null => false, :unique => true
      t.text :description, :null => false
      t.string :funding_agency
      t.integer :fund_amount
      t.date :due_date, :null => false
      t.string :other_contributors

      t.timestamps
    end
  end
end
