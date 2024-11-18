class CreateBooks < ActiveRecord::Migration[6.1]
  def change
    create_table :books do |t|
      t.string :title, null: false
      t.string :author, null: false
      t.date :publication_date, null: false
      t.integer :rating, null: false, default: 0
      t.string :status, null: false, default: 'available'

      t.timestamps
    end
  end
end
