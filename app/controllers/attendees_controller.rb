class AttendeesController < ApplicationController
  before_action :set_attendee, only: [:show, :edit, :update, :destroy]
  respond_to :html, :json, :js

  def index
    @attendees = Attendee.all.order_by_alphabetical
  end

  def show
  end

  def edit
  end

  def new
    @attendee = Attendee.new
  end

  def create
    @attendee = Attendee.new(attendee_params)
    if @attendee.save
      redirect_to attendees_path
      flash[:notice] = "Attendee successfully created"
    else
      respond_with(@attendee)
    end
  end

  def update
    if @attendee.update(attendee_params)
      redirect_to attendees_path
      flash[:notice] = "Attendee successfully updated"
    else
      respond_with(@attendee)
    end
  end

  def destroy
    if @attendee.destroy
      redirect_to attendees_path
      flash[:notice] = "Attendee successfully destroyed"
    else
      respond_with(@attendee)
    end
  end

  private
    def set_attendee
      @attendee = Attendee.find(params[:id])
    end

    def attendee_params
      params.require(:attendee).permit(:first_name, :last_name, :contact_no, :email, :age, :photo_url, :category, :group, :gender, :remark, :image)
    end
end
