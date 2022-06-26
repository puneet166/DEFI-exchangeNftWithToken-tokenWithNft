pragma solidity 0.8.4;
import "https://github.com/OpenZeppelin/openzeppelin-contracts/blob/master/contracts/token/ERC20/IERC20.sol";
import "https://github.com/OpenZeppelin/openzeppelin-contracts/blob/master/contracts/token/ERC721/IERC721.sol";

// SPDX-License-Identifier: MIT
// OpenZeppelin Contracts (last updated v4.6.0) (token/ERC20/IERC20.sol)

contract DEFINFTWithTokenExchange {
    IERC20 _token;
    IERC721 _NFT;

    constructor(address smartContractOfToken, address smartContractOfNFT) {
        _token = IERC20(smartContractOfToken);
        _NFT = IERC721(smartContractOfNFT);
    }

    function NFTTradeWithTokenInDeFi(
        uint256 tokenId,
        uint256 tokenAmount,
        address ownerOfNft
    ) external {
        require(
            _token.balanceOf(msg.sender) > tokenAmount,
            "insufficent balance"
        );
        require(_NFT.ownerOf(tokenId) == ownerOfNft, "It's not owner of NFT..");
        require(
            _token.allowance(msg.sender, address(this)) >= tokenAmount,
            "first give allowance in 20 contract to the smart contract for transfering"
        );
        require(
            _NFT.isApprovedForAll(ownerOfNft, address(this)),
            "first you need to setApprovalForAll for this token to the smart contract for transfering"
        );
        _token.transferFrom(msg.sender, ownerOfNft, tokenAmount);
        _NFT.safeTransferFrom(ownerOfNft, msg.sender, tokenId);
    }
}
