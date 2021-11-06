// SPDX-License-Identifier: MIT
pragma solidity ^0.8.2;

import "@openzeppelin/contracts/token/ERC721/ERC721.sol";
import "@openzeppelin/contracts/token/ERC721/extensions/ERC721Enumerable.sol";
import "@openzeppelin/contracts/access/Ownable.sol";
import "@openzeppelin/contracts/utils/Counters.sol";

contract MintTheGram is ERC721, ERC721Enumerable, Ownable {
    using Counters for Counters.Counter;
      // Optional mapping for token URIs
    mapping(uint256 => string) internal tokenURIs;
    Counters.Counter private _tokenIdCounter;

    constructor() ERC721("Instamint", "INSTA") {}

    function _baseURI() internal pure override returns (string memory) {
        return "https://ipfs.io/ipfs/";
    }

    function _setTokenURI(uint256 _tokenId, string memory _uri) internal {
        require(_exists(_tokenId));
        tokenURIs[_tokenId] = _uri;
    }


    function safeMint(address to, string memory uri) public onlyOwner {
        uint256 tokenId = _tokenIdCounter.current();
        _safeMint(to, tokenId);
        _setTokenURI(tokenId,uri);
        _tokenIdCounter.increment();
    }

    // The following functions are overrides required by Solidity.

    function _beforeTokenTransfer(address from, address to, uint256 tokenId)
        internal
        override(ERC721, ERC721Enumerable)
    {
        super._beforeTokenTransfer(from, to, tokenId);
    }

    function instaURI(uint256 _tokenId) public view returns (string memory) {
        require(_exists(_tokenId));
        return tokenURIs[_tokenId];
    }

    function supportsInterface(bytes4 interfaceId)
        public
        view
        override(ERC721, ERC721Enumerable)
        returns (bool)
    {
        return super.supportsInterface(interfaceId);
    }
}
