$(() => {
  $('#sign').click(() => {
    const signature = sign_token($('#private_key').val());
    $('#ownership_proof_signature').val(signature);
  });
});


const EthCrypto = require('eth-crypto');

const sign_token = private_key => {
  const tokenValue = token();
  debugger;
  messageHash = EthCrypto.hash.keccak256(tokenValue);
  return EthCrypto.sign(private_key, messageHash);
}

const token = () => {
  url_string = window.location.href;
  url = new URL(url_string);
  return url.searchParams.get('token');
}
