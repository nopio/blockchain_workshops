class Picture::SyncOwnersService

  def call
    sync_owners
  end

  private

  def sync_owners
    Picture.all.each do |picture|
      picture.owners = picture_owners(picture)
    end
  end

  def create_wallet(address)
    Wallet.create(address: address)
  end

  def picture_owners(picture)
    owner_addresses = Blockchain::GetOwnersService.new(picture.fingerprint).call
    owner_addresses.map do |address|
      address = normalized_address(address)
      owner = Wallet.where(address: address).first_or_create(address: address)
    end
  end

  def normalized_address(address)
    Eth::Utils.prefix_hex(address).downcase
  end
end
