open Core
module Seq = Sequence
let main () = 
  let a = Seq.fromList [1; 2; 3; 4; 5] in
  let i = Seq.get a 0 in
  let _ = printf "Element at 0: %d" i in
    ()

let _ = main ()

