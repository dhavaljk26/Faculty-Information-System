class CreatePublications < ActiveRecord::Migration[5.1]
  def change
    create_table :publications do |t|
      t.string :title, :null => false, :unique => true
      t.string :journal, :null => false
      t.string :publisher, :null => false
      t.date :publish_date, :null => false
      t.string :other_contributors

      t.timestamps
    end
  end
end
