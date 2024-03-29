open Core

type 'a seq  = 'a Array.t

let fromList l = Array.of_list l

let length (a: 'a seq) : int = Array.length a
let get a i = Array.get a i 

let fold_left f init a = 
  let n = length a in
  let rec iterate_aux i =
    if i = n then
      init
    else
      let r = iterate_aux i+1 in
        f (get a i, r)  
  in
    iterate_aux 0

let fold_right f init a = 
  let n = length a in
  let rec iterate_aux sum i =
    if i = n then
      sum
    else
      let sum' =  f (sum, get a i) in 
      let r = iterate_aux sum' (i+1) in
        r
  in
    iterate_aux init 0


(* Divide and conquer fold *)
let fold f init a = 
  let n = length a in
    if n = 0 then 
      init 
    else if n = 1 then 
      get a i
    else 
      let (b, c) = splitMid a in
      let (rb, rc) = par (fold f init b, fold f init c) in 
        f (rb, rc)


(* Contraction fold *)
let fold_contract f init a = 
  let g = f (get a (2*i), get a (2*i + 1)) in
  let b = tabulate g ((length a)/2) in 
    fold_contract f init b


iterate (fun (x,y) -> x + y) 0 (fromList [0;1])
