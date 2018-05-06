class AddAuthorToPost < ActiveRecord::Migration[5.2]
  def change
    add_column :posts, :author, :string, :default => "Tori Brenneison"
  end
end
