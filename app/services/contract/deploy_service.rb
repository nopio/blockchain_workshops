class Contract::DeployService
  def initialize(key)
    @key = key
  end

  def call
    deploy_contract
  end

  private

  def deploy_contract
  end
end