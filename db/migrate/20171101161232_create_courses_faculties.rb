class CreateCoursesFaculties < ActiveRecord::Migration[5.1]
  def change
    create_table :courses_faculties, :id => false do |t|
      t.references :course, index:true, foreign_key: true
      t.references :faculty, index:true, foreign_key: true
    end
  end
end
