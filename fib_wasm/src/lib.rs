use wasm_bindgen::prelude::*;

#[wasm_bindgen]
pub fn fib(n: u32) -> u32 {
    if n < 2 {
        n
    } else {
        fib(n - 2) + fib(n - 1)
    }
}
