class Blockchain::RegisterPictureService
  def initialize(fingerprint, key)
    @fingerprint = fingerprint.to_i
    @key = key
  end

  def call
    register_picture
  end

  private

  def register_picture
    signed_contract = Contract::GetSignedService.new.call(@key)
    signed_contract.transact.register_picture(@fingerprint)
  end
end
