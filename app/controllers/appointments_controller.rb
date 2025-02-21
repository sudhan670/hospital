class AppointmentsController < ApplicationController
  before_action :set_appointment, only: [:show, :edit, :update, :destroy]
  before_action :check_deadline, only: [:destroy]

  def index
    @appointments = Appointment.all
  end

  def show
  end

  def new
    @appointment = Appointment.new
  end

  def create
    @appointment = Appointment.new(appointment_params)
    if @appointment.save
      redirect_to @appointment, notice: 'Appointment was successfully scheduled.'
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @appointment.update(appointment_params)
      redirect_to @appointment, notice: 'Appointment was successfully updated.'
    else
      render :edit
    end
  end

  def destroy
    @appointment.destroy
    redirect_to appointments_path, notice: 'Appointment was successfully canceled.'
  end

  def upcoming
    @appointments = Appointment.where('appointment_date >= ?', Date.today)
  end

  def past
    @appointments = Appointment.where('appointment_date < ?', Date.today)
  end

  private

  def set_appointment
    @appointment = Appointment.find(params[:id])
  end

  def appointment_params
    params.require(:appointment).permit(:patient_id, :doctor_id, :appointment_date, :status, :notes)
  end

  def check_deadline
    if @appointment.appointment_date < Time.current
      redirect_to @appointment, alert: "You cannot delete past appointments."
    end
  end
end
