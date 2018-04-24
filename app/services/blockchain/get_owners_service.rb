class Blockchain::GetOwnersService
  def initialize(fingerprint)
    @fingerprint = fingerprint.to_i
  end

  def call
    get_owners
  end

  private

  def get_owners
    contract = Contract::GetService.new(Contract.last.address).call
    contract.call.get_owners(@fingerprint)
  end
end
