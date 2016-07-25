class Api::V1::LinksController < ApiController

  def create
    respond_with Link.create!(link_params)
  end

  private

  def link_params
    params.require(:link).permit(:title, :address)
  end
  
end
