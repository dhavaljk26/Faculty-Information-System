class CreateExperiences < ActiveRecord::Migration[5.1]
  def change
    create_table :experiences do |t|
      t.references :faculty, foreign_key: true
      t.text :description
      t.string :institute
      t.integer :duration

      t.timestamps
    end
  end
end
