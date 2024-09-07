// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;

library L1 {
    struct Thing {
        uint256 a;
    }

  struct Nested {
        Thing thing;
    }
}

library L2 {
     struct CantBeAParam {
        L1.Nested thing;
    }
}


contract Repro {
    // unresolved custom type: Thing
    function binding_error(L2.CantBeAParam memory) public pure {
        return;
    }

    // using as a return type is fine
    function binding_ok() public pure returns (L2.CantBeAParam memory) {
        return L2.CantBeAParam(L1.Nested(L1.Thing(3)));
    }


}