class CreateFacultiesProjects < ActiveRecord::Migration[5.1]
  def change
    create_table :faculties_projects, :id => false do |t|
      t.references :faculty, index: true, foreign_key: true
      t.references :project, index:true, foreign_key: true
    end
  end
end
