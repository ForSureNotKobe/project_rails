class CreateClients < ActiveRecord::Migration[6.0]
  def change
    create_table :clients do |t|
      t.string :name
      t.string :addres
      t.integer :nip
      t.references :company, null: false, foreign_key: true

      t.timestamps
    end
  end
end
