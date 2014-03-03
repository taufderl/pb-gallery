class GalleriesController < ApplicationController
  load_and_authorize_resource
  before_action :set_gallery, only: [:show, :edit, :update, :destroy]

  # GET /galleries
  # GET /galleries.json
  def index
    if admin?
      # load all galleries for manage overview
      @q = Gallery.search(params[:q])
      @galleries = @q.result(distinct: true).paginate(page: params[:page], per_page: 10).order(date: :desc)
      @owners = User.includes(:role).where('roles.name' => 'admin')
      render 'manage'
    else
      # allow user only to see permitted galleries
      @galleries = current_user.permitted_galleries
    end
  end
  
  # GET /galleries/1
  # GET /galleries/1.json
  def show
  end

  # GET /galleries/new
  def new
    @gallery = Gallery.new
  end

  # GET /galleries/1/edit
  def edit
    case params[:tab]
    when 'images'
      case @gallery.type
      when 'PicasaGallery'
        repo = PicasaWebAlbums.get_repository(ENV['PICASA_GOOGLE_USER'], ENV['PICASA_GOOGLE_PASSWORD'])
        @albums = repo.get_all_albums
        render 'edit_picasa'
      when 'SelfHostedGallery'
        @image = Image.new
        render 'edit_images'
      end
    when 'permissions'
      render 'edit_permissions'
    when 'preview'
      render 'preview'
    when 'general'
      render 'edit' #this action
    else
      redirect_to edit_gallery_path(@gallery, tab: 'general')
    end
  end

  # POST /galleries
  # POST /galleries.json
  def create
    @gallery = Gallery.new(gallery_params)
    @gallery.owner = current_user

    respond_to do |format|
      if @gallery.save
        format.html { redirect_to edit_gallery_path(@gallery, tab: :images), notice: t('gallery.created') }
        format.json { render action: 'show', status: :created, location: @gallery }
      else
        format.html { render action: 'new' }
        format.json { render json: @gallery.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /galleries/1
  # PATCH/PUT /galleries/1.json
  def update
    respond_to do |format|
      if @gallery.update(gallery_params)
        format.html { redirect_to edit_gallery_path(@gallery), notice: t('gallery.updated') }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @gallery.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /galleries/1
  # DELETE /galleries/1.json
  def destroy
    @gallery.destroy
    respond_to do |format|
      format.html { redirect_to galleries_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_gallery
      @gallery = Gallery.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def gallery_params
      params.require(:gallery).permit(:name, :date, :photographer, :key, :type, :published, :picasa_webalbum_id)
    end
end
