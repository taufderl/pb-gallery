class GalleryPermissionController < ApplicationController
  def new
  end

  def create
    if params[:gallery_permission]
      key = params[:gallery_permission][:key]
      
      if key != ''
        if gallery = Gallery.find_by(key: key) # use find instead of find by when index is defined
          if current_user.permitted_galleries.include? gallery
            flash[:notice] = t('gallery_permission.gallery_already_permitted')
            redirect_to gallery_path(gallery)
          else
            current_user.permitted_galleries << gallery
            current_user.save
            flash[:notice] = t('gallery_permission.added_permission')
            #sleep(2.0) # sleep to make sure user rights are updated!!
            redirect_to gallery_path(gallery)
          end
        else
          flash[:alert] = t('gallery_permission.gallery_not_found')
          render 'new'
        end
      else  
          flash[:alert] = t('gallery_permission.empty_key_not_allowed')
          render 'new' 
      end
    else
      render 'new'
    end
  end
end
