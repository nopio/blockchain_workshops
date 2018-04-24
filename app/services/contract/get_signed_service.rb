class Contract::GetSignedService
  def call(key)
    get_signed_contract(key)
  end

  private

  def get_signed_contract(key)
    contract = Contract::GetService.new(Contract.last.address).call
    Contract::SignService.new(contract, key).call
  end
end
