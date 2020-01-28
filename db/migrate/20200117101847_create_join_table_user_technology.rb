class CreateJoinTableUserTechnology < ActiveRecord::Migration[5.2]
  def change
    create_join_table :users, :technologies do |t|
    	t.references :user, foreign_key: true
    	t.references :technology, foreign_key: true
      t.index [:user_id, :technology_id], unique: true
      # t.index [:technology_id, :user_id]
    end
  end
end
