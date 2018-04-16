require 'rails_helper'

describe 'PicturesContract' do
  let(:picture_hash) { 123456789 }

  before do
    @client = Ethereum::HttpClient.new('http://localhost:8123')
    @deployed_contract = Ethereum::Contract.create(file: "#{Dir.pwd}/app/contracts/PicturesContract.sol", client: @client)
    @address = @deployed_contract.deploy_and_wait
    @accounts = @client.eth_accounts['result']
    @formatter = Ethereum::Formatter.new
  end

  describe '#register_picture' do
    context 'new image' do
      it 'register new picture' do
        @deployed_contract.transact_and_wait.register_picture(picture_hash)
        pictures_list = @deployed_contract.call.get_pictures_list
        expect(pictures_list).to include(picture_hash)
      end
    end

    context 'image already exists' do
      it 'does not register new picture' do
        @deployed_contract.transact_and_wait.register_picture(picture_hash)
        expect { @deployed_contract.transact_and_wait.register_picture(picture_hash) }.to raise_error(IOError, /revert/)
      end
    end
  end

  describe '#add_owner' do
    context 'as creator' do
      it 'adds owner of picture' do
        @deployed_contract.transact_and_wait.register_picture(picture_hash)

        @deployed_contract.transact_and_wait.add_owner(picture_hash, @accounts[1])
        owners = @deployed_contract.call.get_owners(picture_hash)
        expect(owners.map { |owner| @formatter.to_address(owner) }).to include(@accounts[1])
      end
    end

    context 'not as creator' do
      it 'does not add address to owners' do
        @deployed_contract.transact_and_wait.register_picture(picture_hash)

        @deployed_contract.sender = @accounts[2]
        expect { @deployed_contract.transact_and_wait.add_owner(picture_hash, @accounts[1]) }.to raise_error(IOError, /revert/)
      end
    end
  end

  describe '#get_owners' do
    it 'returns list of owners for picture' do
      @deployed_contract.transact_and_wait.register_picture(picture_hash)
      @deployed_contract.transact_and_wait.add_owner(picture_hash, @accounts[1])
      @deployed_contract.transact_and_wait.add_owner(picture_hash, @accounts[2])

      owners = @deployed_contract.call.get_owners(picture_hash)
      expect(owners).not_to eq([@accounts[1], @accounts[2]])
    end
  end
end