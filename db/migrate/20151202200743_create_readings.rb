class CreateReadings < ActiveRecord::Migration
  def change
    create_table :readings do |t|
      t.integer :duration_in_min
      t.date :reading_date
      t.references :user, index: true, foreign_key: true
      t.string :title
      t.string :author
      t.text :note

      t.timestamps null: false
    end
  end
end
