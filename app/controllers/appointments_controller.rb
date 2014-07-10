class AppointmentsController < ApplicationController

  def index
    @appointments = Appointment.all
    date_from_ajax = params[:matched_date]
    reduce = Appointment.where(:date => date_from_ajax)
    @new_dates = reduce.collect {|x| x.hour.gsub(/\D/, '').rjust(4, "0")}
    render json: @new_dates
  end

  def new
    @appointment = Appointment.new
    @service_names = Service.all.each_with_index.map { |service, i| [service.name, i] }
    respond_to do |format|
      format.html
      format.js
    end
  end

  def create
    puts "PARAMS HERE\n\n\n\n\n"
    p appointment_params
    @appointment = Appointment.create(appointment_params)
    if @appointment.save
      redirect_to new_appointment_path
    else
      err = ''
      @appointment.errors.full_messages.each do |m|
        err << m
      end

      redirect_to new_appointment_path, :flash => { :alert => "#{err}, please try again" }
    end
  end

private

  def appointment_params
    params.require(:appointment).permit!
  end
end
