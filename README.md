# DEFI-exchangeNftWithToken-tokenWithNft
It's all about DEFI , trading of NFT with token , token with NFT


Important NOTE --

1. When you use interface for calling interface's smart contract functions. in this case msg.sender is always smart contract address.

ex-
* You have 2 smart contracts 
A,B
* A is erc20 contract.
* B is main contract- we will use erc20(A) contract's method in this B (main) contract by using IERC20.
### Note - You know you cannot call internal function of A's contract.
* you only can call those function of ERC20(A)'s smartcontract from B's(main) contract, who is public or availble in IERC20 interface.

* When you call transfer public function of ERC20's in B's main contract.
transfer(to,amount) - transfer erc20 tokens to's account , amount is how much you want to send .
### IMPORTANT - if you call this method (transfer(to,amount)) in A's(ERC20) smart contract by default msg.sender is caller of this function.

### But when we you use this transfer(to,amount) method of A's (ERC20) contract in B's contract by interface, by default msg.sender is smart contract(address(this)). that mean you are sending token from smart contract's account to to's account.

** This is same for ERC721 case.

* for transfering token of A's(ERC20) smart contract in B (main) contract. first,you need to approve amount of token for B smart contract in A's contract by calling approve method.
* first call approve method of A's (ERC20) contract passing B's smart contract address.
then in B's(Main) contract use transferFrom method to transfer token in to's address. in our DEFI.sol case B's smart contract transfering token to to's account.


## CONCLUSION IS - When you import interface in anycontract in this case by default call interface's method msg.sender or caller is smart contract.
When you inherit another contract in main contract in this case msg.sender/caller is who is calling these function.





--------------------------------------------------------------------

* Same concept implememing this repo

We have 3 contracts-
1 - ERC20.
2 - ERC721.
3 - DEFI.

* Any method of ERC20 or ERC721 which we are using in DEFI.sol using interfaces. by default caller/owner for those interface's methods is smart contract address(this).
* for transfering token or nft. first we need to give approval to the smart contract(address(this)) then token, NFT will transfer by smartcontract.

* for give approval to the smart contract.
 go in erc20.sol call approval method. pass DEFI smartcontract address in "to" field of approval method.
 go in erc721 call setApprovalForAll method. pass DEFI smartcontract address in "operator" field of setApprovalForAll method.
 then DEFI smart contract will trade , exchange token with NFT, NFT with token.
