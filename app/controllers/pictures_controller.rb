class PicturesController < BaseController
  expose(:pictures, -> { Picture.by_author_user_id(params[:user_id]) })
  expose(:picture)

  def create
    created_picture = Picture::SaveService.new(picture_params.merge(user_id: params[:user_id])).call
    if created_picture.id.present?
      # Blockchain::RegisterPictureService.new(created_picture.fingerprint, current_user.private_key).call
      flash[:notice] = 'Picture registered'
      redirect_to :user_pictures
    else
      flash[:alert] = 'Picture can not be registered'
      render :new
    end
  end

  def show
    @owners = picture.owners.map { |owner| owner.user ? owner.email : owner.address }
  end

  def transfer
    if Picture::AddOwnerService.new(picture, picture_params[:owner]).call
      # Blockchain::AddOwnerService.new(picture, picture_params[:owner], current_user.private_key).call
      flash[:notice] = 'Owner added'
      redirect_to :user_pictures
    else
      flash[:alert] = 'Owner can not be added'
      render :add_owner
    end
  end

  protected

  def picture_params
    params.require(:picture).permit(:file, :owner)
  end
end
