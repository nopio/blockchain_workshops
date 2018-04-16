class Picture::SaveService
  def initialize(params)
    @params = params
  end

  def call
    save_picture
  end

  private

  def save_picture
    picture_file = @params[:file]
    author = User.find(@params[:user_id]).wallet
    picture_hash = hash_file(picture_file.tempfile)
    Picture.create(fingerprint: picture_hash, author: author, attachment: picture_file)
  end

  def hash_file(file)
    Digest::SHA3.hexdigest(File.binread(file), 256).to_i(16)
  end
end