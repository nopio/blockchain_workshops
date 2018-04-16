namespace :blockchain do
  desc 'deploy contract on blockchain'
  task :deploy_contract, [:key] => :environment do |task, args|
    key = args.key
    address = Contract::DeployService.new(key).call
    Contract.create(address: address)
  end

  desc 'sync pictures owners with blockchain'
  task sync_owners: :environment do
    Picture::SyncOwnersService.new.call
  end
end