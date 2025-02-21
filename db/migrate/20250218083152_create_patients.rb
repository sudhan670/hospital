class CreatePatients < ActiveRecord::Migration[8.0]
  def change
    create_table :patients do |t|
      t.string :first_name
      t.string :last_name
      t.date :date_of_birth
      t.string :email

      t.timestamps
    end
    add_index :patients, :email, unique: true
  end
end
