class ClocksController < ApplicationController
  load_and_authorize_resource

  def edit
    breadcrumb 'Displays', :displays_path, except: :present
    breadcrumb @clock.display.name, display_path(@clock.display)
    breadcrumb @clock.class.label, edit_clock_path(@clock)
  end

  def update
    @clock.update!(clock_params)

    redirect_to [:edit, @clock.display]
  end

  private

  def clock_params
    params.require(:clock).permit(:time_zone)
  end
end
