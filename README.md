Run ./repro.sh

sol macro now cannot resolve doubly-nested structs when 2 layers are in a sub-dep contract. This previously worked in 0.7.7. The error message is:

```
unresolved custom type: Thing
 --> src/lib.rs:1:1
  |
1 | / alloy_sol_types::sol! {
2 | |     Repro,
3 | |     "./src/Repro.abi.json",
4 | | }
  | |_^
```
