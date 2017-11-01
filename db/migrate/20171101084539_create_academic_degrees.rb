class CreateAcademicDegrees < ActiveRecord::Migration[5.1]
  def change
    create_table :academic_degrees do |t|
      t.string :name, :null => false, :unique => true
      t.string :programme, :null => false
      t.integer :min_duration, :null => false

      t.timestamps
    end
  end
end
