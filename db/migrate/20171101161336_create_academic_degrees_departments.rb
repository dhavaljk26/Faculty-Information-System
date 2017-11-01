class CreateAcademicDegreesDepartments < ActiveRecord::Migration[5.1]
  def change
    create_table :academic_degrees_departments, :id => false do |t|
      t.references :academic_degree, index:true, foreign_key: true
      t.references :department, index:true, foreign_key: true
    end
  end
end
