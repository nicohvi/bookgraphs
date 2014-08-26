class CreateBooks < ActiveRecord::Migration
  def change
    create_table :books do |t|
      t.string :title
      t.integer :published
      t.integer :length

      t.timestamps
    end
  end
end
