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
  end

  def recover_public_key
  end
end