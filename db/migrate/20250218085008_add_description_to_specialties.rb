class AddDescriptionToSpecialties < ActiveRecord::Migration[8.0]
  def change
    add_column :specialties, :description, :string
  end
end
