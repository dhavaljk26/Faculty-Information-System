class CreateAchievements < ActiveRecord::Migration[5.1]
  def change
    create_table :achievements do |t|
      t.references :faculty, foreign_key: true
      t.text :description

      t.timestamps
    end
  end
end
