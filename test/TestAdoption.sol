pragma solidity ^0.5.0;

import "truffle/Assert.sol";
import "truffle/DeployedAddresses.sol";
import "../contracts/Adoption.sol";

contract TestAdoption {
  // The address of the adoption contract to be tested
  Adoption adoption = Adoption(DeployedAddresses.Adoption());

  // The id of the pet that will be used for testing
  uint expectedPetId = 8;
  //testing adopt function
  function testUserCanAdoptPet() public {
      uint returnedId = adoption.adopt(expectedPetId);
      Assert.equal(returnedId, expectedPetId, "Adoption of the expected pet should match what is returned.");
  }

  // The expected owner of adopted pet is this contract
  address expectedAdopter = address(this);
  //testing single pet owner retrieval
  function testGetAdopterAddressByPetId() public {
    address returnedAdopter = adoption.adopters(expectedPetId);
    Assert.equal(returnedAdopter, expectedAdopter, "Owner of the expected pet should be this contract ");
  }

  //testing retrieval of all pet owners
  function testGetAdopterAddressByPetIdInArray() public {
    address[16] memory returnedAdopters = adoption.getAdopters();

    Assert.equal(returnedAdopters[expectedPetId], expectedAdopter, "Owner of the expected pet should be this contract" );
  }


}