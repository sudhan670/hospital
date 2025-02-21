class Appointment < ApplicationRecord
  belongs_to :patient
  belongs_to :doctor

  validates :appointment_date, presence: true
  validates :status, inclusion: { in: ['Scheduled', 'Completed', 'Canceled'] }

  # Ensure appointment can't be deleted past the deadline
  def can_be_deleted?
    appointment_date > Time.current
  end
end
