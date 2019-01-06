class DisplaysController < ApplicationController
  load_and_authorize_resource

  def create
    @display.save!

    redirect_to @display
  end

  def update
    @display.update!(display_params)

    redirect_to @display
  end

  def destroy
    @display.destroy!

    redirect_to displays_url
  end

  private

  def display_params
    params.require(:display).permit(:name)
  end
end
