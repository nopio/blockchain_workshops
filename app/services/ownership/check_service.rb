class Ownership::CheckService
  def initialize(signature, ownership_proof)
    @signature = signature
    @ownership_proof = ownership_proof
  end

  def call
    check_ownership
  end

  private

  def check_ownership
    token = @ownership_proof.token
    fingerprint = @ownership_proof.picture.fingerprint

    proven = Blockchain::VerifySignatureService.new(@signature, token, fingerprint).call
    proven ? @ownership_proof.proven! : @ownership_proof.cheated!
  end
end