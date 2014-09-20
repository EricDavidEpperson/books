class RemoveLengthFromBooks < ActiveRecord::Migration
  def change
    remove_column :books, :length, :string
  end
end
