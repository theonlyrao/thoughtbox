class LinksController < ApplicationController

  def index
    if current_user
      @link = Link.new
      @links = current_user.links
    else
      flash[:error] = "Please sign in to see your links."
      redirect_to root_path
    end
  end

  def show
    @link = Link.find(params[:id])
  end

  def update
    @link = Link.find(params[:id])
    @link.update(link_params)
    if @link.save
      flash[:success] = "Link updated!"
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
