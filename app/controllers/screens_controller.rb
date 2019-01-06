class ScreensController < ApplicationController
  load_and_authorize_resource :display
  load_and_authorize_resource through: :display

  def create
    @screen.displayable = screen_params[:displayable_type].delete(' ').constantize.new
    @screen.save!

    redirect_to [:edit, @display, @screen]
  end

  def destroy
    @screen.destroy!

    redirect_to @display
  end

  private

  def screen_params
    params.require(:screen).permit(:displayable_type)
  end
end