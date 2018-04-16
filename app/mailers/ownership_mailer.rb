class OwnershipMailer < ApplicationMailer
  def proof_request(email, token, picture)
    @token = token
    attachments.inline['picture.jpg'] = File.read("#{Rails.root}/public#{picture.attachment.url(:email, timestamp: false)}")

    mail(to: email, subject: 'Prove picture ownership!')
  end
end