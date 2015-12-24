class ReportsController < ApplicationController
  before_action :set_event
  before_action :set_report, only: [:show, :edit, :update, :destroy]
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
end
