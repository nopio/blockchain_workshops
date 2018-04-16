class Blockchain::RegisterPictureService
  def initialize(fingerprint, key)
    @fingerprint = fingerprint.to_i
    @key = key
  end

  def call
    register_picture
  end

  private

  def register_picture
  end
end