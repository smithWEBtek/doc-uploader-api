class PicturesController < ApplicationController
  def index
    render json: Picture.all.with_attached_attachment.order(id: :desc)
    # render json: Picture.all
  end

  def show
    @picture = Picture.find(params[:id])
    # respond_to do |format|
      # format.html { render :show }
      # format.json { render json: @picture }
    # end
    render json: @picture
  end

  def create
    picture = Picture.new(picture_params)

    if picture.save
      render json: picture, status: :created
    else
      render json: picture.errors, status: :unprocessable_entity
    end
  end

  private

  def picture_params
    params.require(:picture).permit(:attachment)
  end
end