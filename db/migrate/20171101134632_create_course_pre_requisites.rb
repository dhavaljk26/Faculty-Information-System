class CreateCoursePreRequisites < ActiveRecord::Migration[5.1]
  def change
    create_table :course_pre_requisites do |t|
      t.references :course, foreign_key: true
      t.integer :course_pre_requisite_id, :limit => 8

      t.timestamps
    end
  end
end
