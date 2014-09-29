class AddReverseFontToBooks < ActiveRecord::Migration
  def change
    add_column :books, :reverse_font, :boolean
  end
end
