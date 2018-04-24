class Contract::GetService
  def initialize(address)
    @address = address
  end

  def call
    get_contract
  end

  private

  def get_contract
    Ethereum::Contract.create(file: "#{Dir.pwd}/app/contracts/PicturesContract.sol", address: @address)
  end
end
