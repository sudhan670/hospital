class CreateDoctors < ActiveRecord::Migration[8.0]
  def change
    create_table :doctors do |t|
      t.string :first_name
      t.string :last_name
      t.string :email
      t.date :joining_date
      t.references :specialty, null: false, foreign_key: true

      t.timestamps
    end
    add_index :doctors, :email, unique: true
  end
end
