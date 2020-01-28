class CreateTechnologies < ActiveRecord::Migration[5.2]
  def change
    create_table :technologies do |t|
      t.string :name
      t.boolean :is_active, default: true

      t.timestamps
    end
    add_index :technologies, :name, unique: true
  end
end
