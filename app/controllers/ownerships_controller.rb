class OwnershipsController < BaseController
  skip_before_action :authenticate_user!, only: [:prove_ownership, :send_prove, :proof_added]

  def index
    @ownership_proofs = OwnershipProof.includes(picture: :author).where(wallets: { user_id: current_user.id })
  end

  def create
    new_ownership_proof = OwnershipProof.create(ownership_params.merge(status: OwnershipProof.statuses[:requested]))

    if new_ownership_proof
      Ownership::SendProofRequestService.new(ownership_params[:receiver_email], new_ownership_proof).call
      flash[:notice] = 'Ownership request was sent!'
      redirect_to user_pictures_url(current_user)
    else
      @pictures = Picture.where(user_id: current_user.id)
      flash[:alert] = 'Ownership request was not sent!'
      render :new
    end
  end

  def send_prove
    signature = ownership_params[:signature]
    ownership_proof = OwnershipProof.find_by(token: params[:token])
    Ownership::CheckService.new(signature, ownership_proof).call

    redirect_to :proof_added_ownerships
  end

  private

  def ownership_params
    params.require(:ownership_proof).permit(:picture_id, :status, :receiver_email, :signature)
  end
end
