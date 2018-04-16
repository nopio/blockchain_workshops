class Contract::SignService
  def initialize(contract, private_key)
    @contract = contract
    @private_key = private_key
  end

  def call
    sign
  end

  private

  def sign
  end
end
