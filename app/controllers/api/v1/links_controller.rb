class Api::V1::LinksController < ApiController

  def create
    respond_with Link.create!(link_params)
  end

  def index
    respond_with Link.all
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
