class AddDepartmentHeadIdToDepartments < ActiveRecord::Migration[5.1]
  def change
    add_foreign_key :departments, :faculties ,:column => :department_head_id
  end
end
