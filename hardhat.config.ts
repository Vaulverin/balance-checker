import { HardhatUserConfig, vars } from "hardhat/config";
import "@nomicfoundation/hardhat-toolbox-viem";


const config: HardhatUserConfig = {
  solidity: {
    version: "0.8.28",
    settings: {
      optimizer: {
        enabled: true,
        runs: 200,
      },
    },
  },
  networks: {
    ethereum: {
      url: vars.get("ETHEREUM_RPC"),
      accounts: [vars.get("MAIN_TEST_PK")]
    }
  },
  ignition: {}
};

export default config;
