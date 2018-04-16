# Blockchain Workshops

## Prerequiste

* Install parity: https://www.parity.io/
  For mac:
  ```
    $ brew tap ethcore/ethcore
    $ brew install parity --beta
  ```

* Install solidity compiler: http://solidity.readthedocs.io/en/latest/installing-solidity.html
  For mac:
  ```
    $ brew install solidity --beta
  ```

* Install Secp256k1: https://github.com/cryptape/ruby-bitcoin-secp256k1#prerequiste (Prerequiste section)

* Install testrpc: ```npm install -g ethereumjs-testrpc```

## Run

* Run parity
  ```
    parity --chain=dev
  ```

* Run application
  ```
  bundle exec bin/setup
  ```

### Run Test
  Run test blockchain ```testrpc --port 8123``` and then you can run ```rspec```

## Tasks

There are rake tasks to deploy contract
```rails blockchain:deploy_contract[key]```
and to synchronize your database with blockchain
```rails blockchain:sync_owners```
