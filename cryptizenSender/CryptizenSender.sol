//SPDX-License-Identifier: MIT

pragma solidity 0.8.9;

import "./interfaces/IERC20.sol";
import "./interfaces/ICryptizenNFT.sol";
import "./utils/ReentrancyGuard.sol";
import "./utils/Runnable.sol";

contract CryptizenSender is Runnable, ReentrancyGuard{
    function distribute(address tokenAddress, address[] memory addresses, uint256[] memory amounts) public whenRunning nonReentrant{
        IERC20 token = IERC20(tokenAddress);
        for(uint256 index = 0; index < addresses.length; index++){
            token.transferFrom(_msgSender(), addresses[index], amounts[index]);
        }
    }

    function airdrop(address tokenAddress, address[] memory addresses, uint256[] memory amounts) public whenRunning nonReentrant{
        IERC20 token = IERC20(tokenAddress);
        for(uint256 index = 0; index < addresses.length; index++){
            token.transferFrom(_msgSender(), addresses[index], amounts[index]);
        }
    }

    function sell(address tokenAddress, address[] memory addresses, uint256[] memory amounts) public whenRunning nonReentrant{
        IERC20 token = IERC20(tokenAddress);
        for(uint256 index = 0; index < addresses.length; index++){
            token.transferFrom(_msgSender(), addresses[index], amounts[index]);
        }
    }

    function buy(address tokenAddress, address[] memory addresses, uint256[] memory amounts) public whenRunning nonReentrant{
        IERC20 token = IERC20(tokenAddress);
        for(uint256 index = 0; index < addresses.length; index++){
            token.transferFrom(_msgSender(), addresses[index], amounts[index]);
        }
    }

    function donate(address tokenAddress, address[] memory addresses, uint256[] memory amounts) public whenRunning nonReentrant{
        IERC20 token = IERC20(tokenAddress);
        for(uint256 index = 0; index < addresses.length; index++){
            token.transferFrom(_msgSender(), addresses[index], amounts[index]);
        }
    }

    function reward(address tokenAddress, address[] memory addresses, uint256[] memory amounts) public whenRunning nonReentrant{
        IERC20 token = IERC20(tokenAddress);
        for(uint256 index = 0; index < addresses.length; index++){
            token.transferFrom(_msgSender(), addresses[index], amounts[index]);
        }
    }

    function stake(address tokenAddress, address[] memory addresses, uint256[] memory amounts) public whenRunning nonReentrant{
        IERC20 token = IERC20(tokenAddress);
        for(uint256 index = 0; index < addresses.length; index++){
            token.transferFrom(_msgSender(), addresses[index], amounts[index]);
        }
    }

    function claim(address tokenAddress, address[] memory addresses, uint256[] memory amounts) public whenRunning nonReentrant{
        IERC20 token = IERC20(tokenAddress);
        for(uint256 index = 0; index < addresses.length; index++){
            token.transferFrom(_msgSender(), addresses[index], amounts[index]);
        }
    }

    function withdraw(address tokenAddress, address[] memory addresses, uint256[] memory amounts) public whenRunning nonReentrant{
        IERC20 token = IERC20(tokenAddress);
        for(uint256 index = 0; index < addresses.length; index++){
            token.transferFrom(_msgSender(), addresses[index], amounts[index]);
        }
    }

    function ads(address tokenAddress, address[] memory addresses, uint256[] memory amounts) public whenRunning nonReentrant{
        IERC20 token = IERC20(tokenAddress);
        for(uint256 index = 0; index < addresses.length; index++){
            token.transferFrom(_msgSender(), addresses[index], amounts[index]);
        }
    }

    function distributeWithSameQuantity(address tokenAddress, address[] memory addresses, uint256 amount) public whenRunning nonReentrant{
        IERC20 token = IERC20(tokenAddress);
        for(uint256 index = 0; index < addresses.length; index++){
            token.transferFrom(_msgSender(), addresses[index], amount);
        }
    }

    function withdrawToken(address tokenAddress, address recepient) public onlyOwner{
        IERC20 token = IERC20(tokenAddress);
        token.transfer(recepient, token.balanceOf(address(this)));
    }

    function withdrawNative(address recepient) public onlyOwner{
        payable(recepient).transfer(address(this).balance);
    }

    function distributeNative(address[] memory addresses, uint256 amount) payable public whenRunning nonReentrant{
        for(uint256 index = 0; index < addresses.length; index++){
            payable(addresses[index]).transfer(amount);
        }
    }

    function mintMultiple(address nftAddress, address[] memory recepients) public onlyOwner{
        ICryptizenNFT nft = ICryptizenNFT(nftAddress);
        for(uint256 index = 0; index < recepients.length; index++){
            nft.mint(recepients[index]);
        }
    }

    function transferNftMultiple(address nftAddress, address[] memory recepients, uint256[] memory tokenIds) public onlyOwner{
        require(recepients.length == tokenIds.length, "Invalid parameter length");
        ICryptizenNFT nft = ICryptizenNFT(nftAddress);
        for(uint256 index = 0; index < recepients.length; index++){
            nft.safeTransferFrom(_msgSender(), recepients[index], tokenIds[index]);
        }
    }
}