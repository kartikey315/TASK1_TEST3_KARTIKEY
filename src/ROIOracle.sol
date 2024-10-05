// SPDX-License-Identifier: MIT

pragma solidity 0.8.26;

contract ROIOracle {
    function latestRoundData()
        external
        pure
        returns (
            uint80 roundId,
            int256 answer,
            uint256 startedAt,
            uint256 updatedAt,
            uint80 answeredInRound
        )
    {
        return (1, 100005124, 1725033291, 1725033299, 1231);
    }

    function decimals() external pure returns (uint256) {
        return 8;
    }
}
