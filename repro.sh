cd rustlib
rm src/*.json
forge b
cat ../out/Repro.sol/Repro.json | jq .abi > src/Repro.abi.json
cargo c