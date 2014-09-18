class CreateBooks < ActiveRecord::Migration
  def change
    create_table :books do |t|
      t.string :title
      t.string :format
      t.string :length
      t.integer :release_year
      t.integer :rating
      t.string :photo

      t.timestamps
    end
  end
end
