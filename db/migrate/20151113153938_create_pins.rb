class CreatePins < ActiveRecord::Migration
  def change
    create_table :pins do |t|
      t.string :title
      t.string :pin_url
      t.timestamps null: false
      t.references :board, index: true, foreign_key: true
    end
  end
end
