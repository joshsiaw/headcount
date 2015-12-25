class ReportsController < ApplicationController
  before_action :set_event
  before_action :set_report, only: [:show, :edit, :update, :destroy, :generate_pdf]
  respond_to :html, :json, :js

  def index
    @reports = @event.reports
  end

  def show
  end

  def edit
  end

  def new
    @report = @event.reports.new
  end

  def create
    @report = @event.reports.new(report_params)
    if @report.save
      redirect_to event_reports_path(@event)
      flash[:notice] = "Report successfully created"
    else
      respond_with(@report)
    end
  end

  def update
    if @report.update(report_params)
      redirect_to event_reports_path(@event)
      flash[:notice] = "Report successfully updated"
    else
      respond_with(@report)
    end
  end

  def destroy
    if @report.destroy
      redirect_to event_reports_path(@event)
      flash[:notice] = "Report successfully destroyed"
    else
      respond_with(@report)
    end
  end

  def generate_pdf
    respond_to do |format|
      format.pdf { generate_report(@event, @report) }
    end
  end

  private
    def set_report
      @report = Report.find(params[:id])
    end

    def set_event
      @event = Event.find(params[:event_id])
    end

    def report_params
      params.require(:report).permit(:event_id, :author, :group, :remark)
    end

    def generate_report(event, report)
      pdf = ThinReports::Report.new layout: File.join(Rails.root, 'app', 'reports', 'egroup_report.tlf')
      pdf.start_new_page do
        item(:author).value(report.author)
        item(:created_at).value(report.created_at)
        item(:remark).value(report.remark)
        item(:total).value(event.attendees.group_by(report.group).count)
        item(:group).value(report.group)

        event.attendees.group_by(report.group).each do |attendee|
          pdf.list(:attendees).add_row do |row|
            row.values name: attendee.name
            row.values category: attendee.category
          end
        end
      end

      send_data pdf.generate, filename: 'egroup_report.pdf', 
                                 type: 'application/pdf', 
                                 disposition: 'attachment'
    end
end
