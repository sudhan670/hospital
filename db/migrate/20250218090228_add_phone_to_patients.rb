class AddPhoneToPatients < ActiveRecord::Migration[8.0]
  def change
    add_column :patients, :phone, :string
  end
end
