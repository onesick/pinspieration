class CreateBoards < ActiveRecord::Migration
  def change
    create_table :boards do |t|
      t.string :title
      t.timestamps null: false
      t.integer :pin_id
      t.references :user, index: true, foreign_key: true

      # t.references :pins, index: true, foreign_key: true
    end
  end
end
