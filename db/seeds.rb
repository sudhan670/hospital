# Create specialties
specialties = [
  { name: 'Cardiology', description: 'Deals with disorders of the heart and the cardiovascular system.' },
  { name: 'Dermatology', description: 'Focused on the diagnosis and treatment of conditions related to skin, hair, and nails.' },
  { name: 'Neurology', description: 'Deals with disorders of the nervous system, including the brain and spinal cord.' },
  { name: 'Orthopedics', description: 'Focuses on the musculoskeletal system including bones, joints, ligaments, tendons, and muscles.' },
  { name: 'Pediatrics', description: 'Dedicated to the care of infants, children, and adolescents.' },
  { name: 'Psychiatry', description: 'Focuses on the diagnosis, prevention, and treatment of mental disorders.' },
  { name: 'Gynecology', description: 'Deals with health of the female reproductive system.' }
]

specialties.each do |specialty_attrs|
    Specialty.find_or_create_by(name: specialty_attrs[:name]) do |s|
        s.description = specialty_attrs[:description]
    end
end

puts "Created #{Specialty.count} specialties"

# Create doctors
doctors = [
  { first_name: 'James', last_name: 'Wilson', specialty: Specialty.find_by(name: 'Cardiology'), 
    email: 'james.wilson@hospital.com', phone: '555-1234', joining_date: 5.years.ago },
  { first_name: 'Sarah', last_name: 'Johnson', specialty: Specialty.find_by(name: 'Dermatology'), 
    email: 'sarah.johnson@hospital.com', phone: '555-2345', joining_date: 3.years.ago },
  { first_name: 'Robert', last_name: 'Smith', specialty: Specialty.find_by(name: 'Neurology'), 
    email: 'robert.smith@hospital.com', phone: '555-3456', joining_date: 7.years.ago },
  { first_name: 'Emma', last_name: 'Davis', specialty: Specialty.find_by(name: 'Pediatrics'), 
    email: 'emma.davis@hospital.com', phone: '555-4567', joining_date: 2.years.ago },
  { first_name: 'Michael', last_name: 'Brown', specialty: Specialty.find_by(name: 'Orthopedics'), 
    email: 'michael.brown@hospital.com', phone: '555-5678', joining_date: 6.years.ago },
  { first_name: 'Jennifer', last_name: 'Lee', specialty: Specialty.find_by(name: 'Psychiatry'), 
    email: 'jennifer.lee@hospital.com', phone: '555-6789', joining_date: 4.years.ago },
  { first_name: 'Lisa', last_name: 'Wang', specialty: Specialty.find_by(name: 'Gynecology'), 
    email: 'lisa.wang@hospital.com', phone: '555-7890', joining_date: 5.years.ago }
]

doctors.each do |doctor_attrs|
    Doctor.find_or_create_by!(email: doctor_attrs[:email]) do |doctor|
      doctor.first_name = doctor_attrs[:first_name]
      doctor.last_name = doctor_attrs[:last_name]
      doctor.specialty = doctor_attrs[:specialty]
      doctor.phone = doctor_attrs[:phone]
      doctor.joining_date = doctor_attrs[:joining_date]
    end
  end
  

puts "Created #{Doctor.count} doctors"

# Create patients
patients = [
  { first_name: 'John', last_name: 'Doe', date_of_birth: 45.years.ago, gender: 'Male', 
    email: 'john.doe@example.com', phone: '555-1111' },
  { first_name: 'Jane', last_name: 'Smith', date_of_birth: 30.years.ago, gender: 'Female', 
    email: 'jane.smith@example.com', phone: '555-2222' },
  { first_name: 'David', last_name: 'Johnson', date_of_birth: 60.years.ago, gender: 'Male', 
    email: 'david.johnson@example.com', phone: '555-3333' },
  { first_name: 'Emily', last_name: 'Williams', date_of_birth: 25.years.ago, gender: 'Female', 
    email: 'emily.williams@example.com', phone: '555-4444' },
  { first_name: 'Michael', last_name: 'Jones', date_of_birth: 50.years.ago, gender: 'Male', 
    email: 'michael.jones@example.com', phone: '555-5555' },
  { first_name: 'Sarah', last_name: 'Brown', date_of_birth: 35.years.ago, gender: 'Female', 
    email: 'sarah.brown@example.com', phone: '555-6666' },
  { first_name: 'William', last_name: 'Taylor', date_of_birth: 65.years.ago, gender: 'Male', 
    email: 'william.taylor@example.com', phone: '555-7777' },
  { first_name: 'Olivia', last_name: 'Davis', date_of_birth: 28.years.ago, gender: 'Female', 
    email: 'olivia.davis@example.com', phone: '555-8888' },
  { first_name: 'James', last_name: 'Martinez', date_of_birth: 40.years.ago, gender: 'Male', 
    email: 'james.martinez@example.com', phone: '555-9999' },
  { first_name: 'Sophie', last_name: 'Anderson', date_of_birth: 32.years.ago, gender: 'Female', 
    email: 'sophie.anderson@example.com', phone: '555-0000' }
]

patients.each do |patient_attrs|
    Patient.find_or_create_by!(email: patient_attrs[:email]) do |patient|
      patient.name = patient_attrs[:name]
      patient.phone = patient_attrs[:phone]
    end
  end
  

puts "Created #{Patient.count} patients"

# Create some appointments
def random_future_date
  rand(1..30).days.from_now.at_midday + rand(0..7).hours
end

def random_past_date
  rand(1..30).days.ago.at_midday + rand(0..7).hours
end

# Create future appointments
30.times do
  doctor = Doctor.order('RANDOM()').first
  patient = Patient.order('RANDOM()').first
  
  Appointment.create(
    doctor: doctor,
    patient: patient,
    appointment_date: random_future_date,
    status: 'scheduled',
    notes: ['Routine check-up', 'Follow-up appointment', 'Consultation', 'Initial visit'].sample
  )
end

# Create past appointments (some completed, some cancelled)
40.times do
  doctor = Doctor.order('RANDOM()').first
  patient = Patient.order('RANDOM()').first
  status = ['completed', 'completed', 'completed', 'cancelled'].sample # More likely to be completed
  
  Appointment.create(
    doctor: doctor,
    patient: patient,
    appointment_date: random_past_date,
    status: status,
    notes: ['Routine check-up', 'Follow-up appointment', 'Consultation', 'Initial visit'].sample
  )
end

puts "Created #{Appointment.count} appointments"
puts "- #{Appointment.where(status: 'scheduled').count} scheduled"
puts "- #{Appointment.where(status: 'completed').count} completed"
puts "- #{Appointment.where(status: 'cancelled').count} cancelled"

puts "Database seeded successfully!"
