/**
* @type import('hardhat/config').HardhatUserConfig
*/
require('dotenv').config();
require("@nomiclabs/hardhat-ethers");

module.exports = {
   solidity: "0.8.4",
   defaultNetwork: "mumbai",
   networks: {
      mumbai: {
         url: "https://rpc.ankr.com/polygon_mumbai",
         accounts: [`0x${process.env.PRIVATE_KEY}`]
      },
   },
}

