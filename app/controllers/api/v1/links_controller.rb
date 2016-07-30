class Api::V1::LinksController < ApiController

  def create
    new_link = Link.create!(link_params)
    current_user.links << new_link
    respond_with new_link
  end

  def index
    links = current_user.links
    respond_with links
  end

  def update
    link = Link.find(params[:id])
    link.read = params[:link][:read]
    link.save
    respond_with link
  end

  private

  def link_params
    params.require(:link).permit(:title, :address, :read)
  end
  
end
