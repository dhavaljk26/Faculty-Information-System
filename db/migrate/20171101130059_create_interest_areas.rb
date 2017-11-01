class CreateInterestAreas < ActiveRecord::Migration[5.1]
  def change
    create_table :interest_areas do |t|
      t.references :faculty, foreign_key: true
      t.string :name

      t.timestamps
    end
  end
end
