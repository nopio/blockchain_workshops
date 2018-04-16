class Ownership::SendProofRequestService
  def initialize(email, ownership_proof)
    @email = email
    @token = ownership_proof.token
    @picture = ownership_proof.picture
  end

  def call
    send_request
  end

  private

  def send_request
    OwnershipMailer.proof_request(@email, @token, @picture).deliver_later
  end
end