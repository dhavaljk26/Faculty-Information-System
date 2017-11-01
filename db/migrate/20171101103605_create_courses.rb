class CreateCourses < ActiveRecord::Migration[5.1]
  def change
    create_table :courses do |t|
      t.string :name, :null => false
      t.string :credits, :null => false
      t.string :ltp, :null => false
      t.string :course_type, :null => false
      t.references :academic_degree, foreign_key: true, :null => false
      t.references :department, foreign_key: true, :null => false

      t.timestamps
    end
  end
end
