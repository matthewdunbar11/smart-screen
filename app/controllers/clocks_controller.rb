class ClocksController < ApplicationController
  load_and_authorize_resource

  def edit
    breadcrumb 'Displays', :displays_path, except: :present
    breadcrumb @clock.display.name, display_path(@clock.display)
    breadcrumb @clock.class.label, edit_clock_path(@clock)

    @time_zones = ActiveSupport::TimeZone.all.sort_by(&:utc_offset).map { |tz| [tz.name, tz.name] }
  end

  def update
    @clock.update!(clock_params)

    redirect_to @clock.display
  end

  private

  def clock_params
    params.require(:clock).permit(:time_zone)
  end
end
