class CreateUsers < ActiveRecord::Migration[6.0]
  def change
    create_table :users do |t|
      t.references :company, null: true, foreign_key: true

      t.timestamps
    end
  end
end
