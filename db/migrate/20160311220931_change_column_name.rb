class ChangeColumnName < ActiveRecord::Migration
  def change
  	rename_column :comments, :autor_name, :author_name
  end
end
