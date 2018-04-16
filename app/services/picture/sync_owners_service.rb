class Picture::SyncOwnersService

  def call
    sync_owners
  end

  private

  def sync_owners
  end

  def create_wallet(address)
  end

  def picture_owners(picture)
  end

  def normalized_address(address)
    Eth::Utils.prefix_hex(address).downcase
  end
end