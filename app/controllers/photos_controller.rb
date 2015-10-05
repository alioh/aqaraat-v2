class PhotosController < ApplicationController
  def destroy
    @photo = Photo.find(params[:id])
    photo = @photo.property

    @photo.destroy
    @photos = Photo.where(property_id: property.id)

    respond_to :js
  end
end
