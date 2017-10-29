class PhotosController < ApplicationController
    
   def destroy
       @photo = Photo.find(params[:id])
       lesson = @photo.lesson
       
       @photo.destroy
       
       @photos = Photo.where(room_id: room.id)
       respond_to :js
   end
    
end