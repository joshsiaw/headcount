class EventsController < ApplicationController
  before_action :set_event, only: [:show, :edit, :update, :destroy, :generate_summary]
  respond_to :html, :json, :js, :pdf

  def index
    @events = Event.all
  end

  def show
  end

  def edit
  end

  def new
    @event = Event.new
  end

  def create
    @event = Event.new(event_params)
    if @event.save
      redirect_to events_path
      flash[:notice] = "Event successfully created"
    else
      respond_with(@event)
    end
  end

  def update
    if @event.update(event_params)
      redirect_to events_path
      flash[:notice] = "Event successfully updated"
    else
      respond_with(@event)
    end
  end

  def destroy
    if @event.destroy
      redirect_to events_path
      flash[:notice] = "Event successfully destroyed"
    else
      respond_with(@event)
    end
  end

  def generate_summary
    respond_to do |format|
      format.pdf { generate_event_summary(@event) }
    end
  end

  private
    def set_event
      @event = Event.find(params[:id])
    end

    def event_params
      params.require(:event).permit(:date, :venue, :category)
    end

    def generate_event_summary(event)
      report = ThinReports::Report.new layout: File.join(Rails.root, 'app', 'reports', 'event_summary.tlf')
      report.start_new_page do
        item(:date).value(event.date)
        item(:venue).value(event.venue)
        item(:type).value(event.category)
        item(:total_attendance).value(event.attendances.count)
        item(:total_reports).value(event.reports.count)
      end

      send_data report.generate, filename: 'event_summary.pdf', 
                                 type: 'application/pdf', 
                                 disposition: 'attachment'
    end
end
