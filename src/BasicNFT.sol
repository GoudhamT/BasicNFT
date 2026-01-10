//SPDX-License-Identifier:MIT

pragma solidity ^0.8.19;
import {ERC721} from "@openzeppelin/contracts/token/ERC721/ERC721.sol";

contract BasicNFT is ERC721 {
    constructor() ERC721("Dogie", "DG") {}

    function mintNFT() public {}

    function tokenURI(
        uint256 _tokenId
    ) public view override returns (string memory) {
        return "";
    }
}
