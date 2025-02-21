class CreateSpecialties < ActiveRecord::Migration[8.0]
  def change
    create_table :specialties do |t|
      t.string :name
      t.description :text
      t.timestamps
    end
    add_index :specialties, :name, unique: true
  end
end
