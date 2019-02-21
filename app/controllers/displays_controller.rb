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
    @display.save!

    redirect_to [:edit, @display]
  end

  def edit
    breadcrumb @display.name, display_path(@display)
    breadcrumb 'Edit', edit_display_path(@display)
  end

  def update
    if params[:display][:content].present?
      @display.displayable = params[:display][:content].constantize.new
    else
      @display.displayable = nil
    end

    @display.update!(display_params)

    redirect_to [:edit, @display]
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
