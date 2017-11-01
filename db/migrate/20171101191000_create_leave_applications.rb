class CreateLeaveApplications < ActiveRecord::Migration[5.1]
  def change
    create_table :leave_applications do |t|
      t.references :faculty, foreign_key: true
      t.date :leaving_date
      t.integer :no_of_days
      t.text :reason
      t.boolean :approved

      t.timestamps
    end
  end
end
