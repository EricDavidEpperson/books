class ChangeAuthorToAuthorFirstName < ActiveRecord::Migration
  def change
    rename_column :books, :author, :author_first_name
  end
end
