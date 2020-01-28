class RenameMessageToTextMessages < ActiveRecord::Migration[5.2]
  def change
  	    rename_column :comments, :message, :text_comments 
  end
end
