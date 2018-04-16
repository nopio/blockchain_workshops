class Picture::AddOwnerService
  def initialize(picture, new_owner_address)
    @picture = picture
    @new_owner_address = new_owner_address.downcase
  end

  def call
    add_owner
  end

  private

  def add_owner
    new_owner = Wallet.where(address: @new_owner_address).first_or_create(address: @new_owner_address)
    return if new_owner.nil?
    @picture.owners << new_owner
  end
end