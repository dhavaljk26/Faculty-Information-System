class CreateFacultiesPublications < ActiveRecord::Migration[5.1]
  def change
    create_table :faculties_publications, :id => false do |t|
      t.references :faculty, index: true, foreign_key: true
      t.references :publication, index: true, foreign_key: true
    end
  end
end
