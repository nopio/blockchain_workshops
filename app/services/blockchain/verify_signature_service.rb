class Blockchain::VerifySignatureService
  def initialize(signature, token, fingerprint)
    @token = token
    @signature = signature
    @fingerprint = fingerprint
  end

  def call
    verify_signature
  end

  private

  def verify_signature
    public_key = recover_public_key
    public_keys = Blockchain::GetOwnersService.new(@fingerprint).call
    public_keys.include? public_key
  end

  def recover_public_key
    Blockchain::RecoverPublicKeyService.new(@signature, @token).call
  end
end