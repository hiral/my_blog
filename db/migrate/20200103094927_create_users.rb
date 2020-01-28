class CreateUsers < ActiveRecord::Migration[5.2]
  def change
    create_table :users do |t|
      t.string :name
      t.boolean :terms_condition
      t.string :contact_number
      t.string :email
      t.text :parmenent_address
      t.date :birth_date
      t.string :aadhar_number
      t.text :local_address

      t.timestamps
    end
    add_index :users, :email, unique: true
    add_index :users, :aadhar_number, unique: true
  end
end
