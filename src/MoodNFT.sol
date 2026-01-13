//SPDX-License-Identifier:MIT

pragma solidity ^0.8.19;

import {ERC721} from "@openzeppelin/contracts/token/ERC721/ERC721.sol";
import {Base64} from "@openzeppelin/contracts/utils/Base64.sol";

contract MoodNFT is ERC721 {
    uint256 private s_tokenCounter;
    string private s_happySVGImageURI;
    string private s_sadSVGImageURI;
    enum Mood{
        HAPPY,
        SAD
    }
    mapping(uint256 => Mood) private s_tokenIdToMood;
    constructor(
        string memory _happySVGImageURI,
        string memory _sadSVGImageURI
    ) ERC721("Mood NFT", "MFT") {
        s_tokenCounter = 0;
        s_happySVGImageURI = _happySVGImageURI;
        s_sadSVGImageURI = _sadSVGImageURI;
    }

    function mintNFT() public {
        _safeMint(msg.sender, s_tokenCounter);
        s_tokenIdToMood[s_tokenCounter] = Mood.HAPPY;
        s_tokenCounter++;
    }

    function tokenURI(
        uint256 _tokenId
    ) public view override returns (string memory) {
        string memory imageURI;
        if(s_tokenIdToMood[_tokenId] == Mood.HAPPY){
            imageURI = s_happySVGImageURI;
        }
        else{
            imageURI = s_sadSVGImageURI;
        }
         bytes memory json = abi.encodePacked(
            '{',
                '"name":"', name(), '",',
                '"description":"Mood NFT",',
                '"image":"', imageURI, '",',
                '"attributes":[{',
                    '"trait_type":"Moodiness",',
                    '"value":100',
                '}]',
            '}'
        );
        abi.encodePacked()

}
