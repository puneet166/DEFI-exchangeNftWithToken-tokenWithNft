# DEFI-exchangeNftWithToken-tokenWithNft
It's all about DEFI , trading of NFT with token , token with NFT


Important NOTE --

1. When you use interface for calling smart contract function. in this case msg.sender is always smart contract.

ex-
You have 2 smart contract 
A,B
A is erc20 contract.
B is main contract- we will use erc20 method in this B contract by using IERC20.
Note - You know you cannot call internal function of A's contract.
you only can call those function who is public or availble in IERC20 interface.

When you call transfer public method of ERC20's in B's main contract.
transfer(to,amount) - transfer erc20 token to's account , amount is how much you want to send .
IMPORTANT - if you call this method in A smart contract by default msg.sender is caller and transfer token from msg.sender (caller's account) to's account.

But when we will use this transfer(to,amount) method of A's contract in B's contract by default msg.sender is smart contract. that mean you are sending token from smart contract's account to to's account.

This is same for ERC721 case.
for transfering token of A's in B contract. you need to approve amount of token.
first call approve method of A's contact passing B's smart contract address.
then in B's contract use transferFrom method to transfer token in to's address. in this case B's smart contract transfering token to to's account.


CONCLUSION IS - When you import interface in anycontract in this case by default call interface's method msg.sender or caller is smart contract.
When you inherit another contract in main contract in this case msg.sender/caller is who is calling these function.





--------------------------------------------------------------------

Same concept implememing this repo

We have 3 contracts-
1 - ERC20.
2 - ERC721.
3 - DEFI.

any method of ERC20 or ERC721 which we are using in DEFI using interfaces. by default caller/owner for those interface's methods is smart contract address(this).
for transfering token or nft. first we need to give approval to the smart contract(address(this)) then token, NFT will transfer by smartcontract.

for give approval to the smart contract.
 go in erc20 method's call approval method for DEFI smartcontract.
 go in erc721 call setApprovalForAll method for DEFI smart contract.
 then DEFI smart contract will trade , exchange token with NFT, NFT with token.
