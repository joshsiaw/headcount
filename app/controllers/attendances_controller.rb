class AttendancesController < ApplicationController
  before_action :set_event, only: [:create, :update, :destroy]
  before_action :set_attendee, only: [:create, :update]
  before_action :set_attendance, only: [:show, :edit, :update, :destroy]
  respond_to :html, :json, :js

  def index
    @attendances = Attendance.all
  end

  def show
  end

  def edit
  end

  def new
    @attendance = Attendance.new
  end

  def create
    @attendance = Attendance.new(create_attendance_params)
    #if @attendance.save
    #  redirect_to event_path(@event)
    #  flash[:notice] = "Attendance successfully created"
    #else
    #  respond_with(@attendance)
    #end
    @attendance.save
  end

  def update
    if @attendance.update(attendance_params)
      redirect_to attendances_path
      flash[:notice] = "Attendance successfully updated"
    else
      respond_with(@attendance)
    end
  end

  def destroy
    @attendance.destroy
    #if @attendance.destroy
    #  redirect_to event_path(@event)
    #  flash[:notice] = "Attendance successfully removed"
    #else
    #  respond_with(@attendance)
    #end
  end

  private
    def set_attendance
      @attendance = Attendance.find(params[:id])
    end

    def set_event
      @event = Event.find(params[:event_id])
    end

    def set_attendee
      @attendee = Attendee.find(params[:attendee_id])
    end

    def create_attendance_params
      params.permit(:event_id, :attendee_id, :remark)
    end

    def attendance_params
      params.require(:attendance).permit(:event_id, :attendee_id, :remark)
    end
end
