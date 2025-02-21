class Doctor < ApplicationRecord
  belongs_to :specialty
  has_many :appointments
  has_many :patients, through: :appointments

  validates :first_name, :last_name, :email, :joining_date, presence: true
  validates :email, uniqueness: true

  def full_name
    "#{first_name} #{last_name}"
  end
end