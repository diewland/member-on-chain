// SPDX-License-Identifier: MIT
pragma solidity ^0.8.4;

import "@openzeppelin/contracts/access/Ownable.sol";
import "erc721a/contracts/ERC721A.sol";

contract MemberV1 is ERC721A, Ownable {

    string private _baseURIExtended;

    //
    // On-Chain Properties
    //
    // Define the token struct
    struct Token {
        string name;
        int points;
    }

    // Map token IDs to token structs
    mapping(uint256 => Token) public tokens;

    // Property #1 Name
    function setName(uint256 _tokenId, string memory _name) public onlyOwner {
        tokens[_tokenId].name = _name;
    }
    function getName(uint256 _tokenId) public view returns (string memory) {
        return tokens[_tokenId].name;
    }

    // Property #2 Points
    function setPoints(uint256 _tokenId, int _points) public onlyOwner {
        tokens[_tokenId].points = _points;
    }
    function getPoints(uint256 _tokenId) public view returns (int) {
        return tokens[_tokenId].points;
    }

    //
    // SYMBOL
    //
    constructor() ERC721A("MemberV1", "MBV1") {}

    //
    // BASE_URI
    //
    function _baseURI() internal view virtual override returns (string memory) {
        return _baseURIExtended;
    }
    function setBaseURI(string memory baseURI) external onlyOwner {
        _baseURIExtended = baseURI;
    }

    //
    // MINT <3
    //
    function mint(uint256 quantity) external payable onlyOwner {
        // `_mint`'s second argument now takes in a `quantity`, not a `tokenId`.
        _mint(msg.sender, quantity);
    }

    //
    // WITHDRAW
    //
    function withdraw() public onlyOwner {
        uint256 balance = address(this).balance;
        payable(msg.sender).transfer(balance);
    }

}

