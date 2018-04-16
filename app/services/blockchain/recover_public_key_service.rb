class Blockchain::RecoverPublicKeyService
  def initialize(signature, message)
    @signature = signature
    @message = message
  end

  def call
    recover_public_key
  end

  private

  def recover_public_key
    public_key = Crypto::Secp256k1.recover_pubkey(message_hash, vrs)
    public_key_to_address(public_key)
  end

  def bin_signature
    Eth::Utils.hex_to_bin(@signature)
  end

  def vrs
    sig = bin_signature

    v = 0
    r = sig[0,32]
    s = sig[32,32]

    [v, r, s]
  end

  def message_hash
    Eth::Utils.keccak256(@message)
  end

  def public_key_to_address(public_key)
    hex_pubkey = Eth::Utils.bin_to_hex(public_key)
    pk = Eth::Utils.public_key_to_address(hex_pubkey)
    Eth::Utils.remove_hex_prefix(pk).downcase
  end
end