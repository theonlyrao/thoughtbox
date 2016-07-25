class LinksController < ApplicationController

  def index
    @link = Link.new
    @links = Link.all
  end

  def show
    @link = Link.find(params[:id])
  end

  def update
    @link = Link.find(params[:id])
    @link.update(link_params)
    if @link.save
      redirect_to link_path(@link)
    else
      flash[:error] = @link.errors.full_messages.join(", ")
      redirect_to link_path(@link)
    end
  end

  private

  def link_params
    params.require(:link).permit(:title, :address)
  end

end
