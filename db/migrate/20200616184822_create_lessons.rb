class CreateLessons < ActiveRecord::Migration[6.0]
  def change
    create_table :lessons do |t|
      t.string :name
      t.string :note
      t.datetime :date
      t.integer :price
      t.references :company, null: false, foreign_key: true

      t.timestamps
    end
  end
end
