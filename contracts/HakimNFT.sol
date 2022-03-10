//SPDX-License-Identifier:UNLICENSED

pragma solidity >= 0.5.0 < 0.9.0;

import "@openzeppelin/contracts/token/ERC721/ERC721.sol";
import "@openzeppelin/contracts/token/ERC721/extensions/ERC721URIStorage.sol";
import "@openzeppelin/contracts/utils/Counters.sol";
import "@openzeppelin/contracts/access/Ownable.sol";

contract HakimNFT is ERC721URIStorage ,Ownable{
    using Counters for Counters.Counter;

    Counters.Counter private _tokenIds;

    constructor() ERC721("HakimNFT","HKM"){

    }

    function mintNFT(address receipient,string memory tokenURI) public onlyOwner returns(uint256){
        _tokenIds.increment();

        uint256 newItemId=_tokenIds.current();
        _mint(receipient,newItemId);
        _setTokenURI(newItemId,tokenURI);


        return newItemId;
    }
}