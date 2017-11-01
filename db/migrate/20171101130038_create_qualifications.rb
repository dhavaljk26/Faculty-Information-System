class CreateQualifications < ActiveRecord::Migration[5.1]
  def change
    create_table :qualifications do |t|
      t.references :faculty, foreign_key: true
      t.string :degree_name
      t.string :degree_major
      t.string :institution
      t.integer :year

      t.timestamps
    end
  end
end
