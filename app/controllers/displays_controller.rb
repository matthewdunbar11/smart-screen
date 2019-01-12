class DisplaysController < ApplicationController
  load_and_authorize_resource

  layout 'fullscreen', only: :present
  breadcrumb 'Displays', :displays_path, except: :present

  def show
    breadcrumb @display.name, display_path(@display)
  end

  def new
    breadcrumb 'New Display', new_display_path
  end

  def create
    @display.displayable = params[:display][:content].constantize.new
    @display.save!

    redirect_to @display
  end

  def edit
    breadcrumb @display.name, display_path(@display)
    breadcrumb 'Edit', edit_display_path(@display)
  end

  def update
    @display.displayable = params[:display][:content].constantize.new
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
