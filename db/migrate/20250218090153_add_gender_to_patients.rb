class AddGenderToPatients < ActiveRecord::Migration[8.0]
  def change
    add_column :patients, :gender, :string
  end
end
