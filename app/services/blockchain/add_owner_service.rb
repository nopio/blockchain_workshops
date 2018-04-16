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
  end
end