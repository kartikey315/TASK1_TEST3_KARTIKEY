//SPDX-License-Identifier:MIT

pragma solidity 0.8.26;

import {Script} from "forge-std/Script.sol";
import {DOLA} from "../src/DOLA.sol";
import {DOLAEngine} from "../src/DOLAEngine.sol";
import {BDOLA} from "../src/BDOLA.sol";
import {ROIOracle} from "../src/ROIOracle.sol";

contract DeployDolaEngine is Script {
    address[] public tokenAddresses;
    address[] public oracleAddresses;
    function run() external {
        vm.startBroadcast();
        BDOLA blToken = new BDOLA();
        DOLA dlToken = new DOLA();
        ROIOracle oracle = new ROIOracle();

        tokenAddresses = [address(blToken)];
        oracleAddresses = [address(oracle)];

        DOLAEngine dlEngine = new DOLAEngine(
            tokenAddresses,
            oracleAddresses,
            address(dlToken)
        );

        dlToken.transferOwnership(address(dlEngine));

        vm.stopBroadcast();
    }
}
