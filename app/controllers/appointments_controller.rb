class AppointmentsController < ApplicationController
    def index
      @appointments = Appointment.all
    end

    def show
      @appointment = Appointment.find(params[:id])
    end

    def new
      @appointment = Appointment.new
    end

    def create
      @appointment = Appointment.new(appointment_params)
      if @appointment.save
        flash[:notice] = "Appointment successfully created."
        redirect_to @appointment
      else
        flash[:alert] = "Failed to create appointment. Please try again."
        render :new
      end
    end

  private

    def appointment_params
      params.require(:appointment).permit!
    end
end
