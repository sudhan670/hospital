class AddPhoneToDoctors < ActiveRecord::Migration[8.0]
  def change
    add_column :doctors, :phone, :string
  end
end
