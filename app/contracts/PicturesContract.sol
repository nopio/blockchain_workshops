pragma solidity ^0.4.18;

contract PicturesContract {
  struct pictureInfo {
    address author;
    address[] owners;
  }

  mapping (uint256 => pictureInfo) private pictures;
  uint256[] public picturesList;

  modifier onlyCreator(uint256 _hash) {
    require(pictures[_hash].author == msg.sender);
    _;
  }

  modifier onlyNewPicture(uint256 _hash) {
    require(pictures[_hash].author == 0);
    _;
  }

  function registerPicture(uint256 _hash) public onlyNewPicture(_hash) returns (bool success) {
    picturesList.push(_hash);
    pictureInfo memory info = pictureInfo(msg.sender, new address[](0));
    pictures[_hash] = info;
    return true;
  }

  function addOwner(uint256 _hash, address _newOwner) public onlyCreator(_hash) returns (bool success) {
    pictures[_hash].owners.push(_newOwner);
    return true;
  }

  function getOwners(uint256 _hash) public view returns (address[] owners) {
    return pictures[_hash].owners;
  }

  function getPicturesList() public view returns (uint256[] p) {
    return picturesList;
  }
}