class Contract::GetService
  def initialize(address)
    @address = address
  end

  def call
    get_contract
  end

  private

  def get_contract
  end
end
