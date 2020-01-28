class CreateSubjects < ActiveRecord::Migration[5.2]
  def change
    create_table :subjects do |t|
      t.string :name, default: true
      t.boolean :is_active

      t.timestamps
    end
    add_index :subjects, :name, unique: true
  end
end
