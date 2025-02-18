// This setup uses Hardhat Ignition to manage smart contract deployments.
// Learn more about it at https://hardhat.org/ignition

import { buildModule } from "@nomicfoundation/hardhat-ignition/modules";
import { parseEther } from "viem";

const BalanceCheckerModule = buildModule("BalanceCheckerModule", (m) => {
  const checker = m.contract("BalanceChecker", []);
  return { checker };
});

export default BalanceCheckerModule;
