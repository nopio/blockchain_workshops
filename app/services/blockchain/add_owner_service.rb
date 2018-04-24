class Blockchain::AddOwnerService
  def initialize(picture, owner, key)
    @fingerprint = picture.fingerprint.to_i
    @owner = owner
    @key = key
  end

  def call
    add_owner
  end

  private

  def add_owner
    signed_contract = Contract::GetSignedService.new.call(@key)
    signed_contract.transact.add_owner(@fingerprint, @owner)
  end
end
