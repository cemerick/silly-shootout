module Float = struct
  let min (x : float) (y : float) =
    if x < y then x else y

  let max (x : float) (y : float) =
    if x > y then x else y
end

module Rectangle = struct
  type t = {
    lx: float;
    by: float;
    rx: float;
    ty: float
  }

  let r lx by rx ty = {lx; by; rx; ty}

  let union {lx; by; rx; ty} {lx = lx'; by = by'; rx = rx'; ty = ty'} =
    r (Float.min lx lx') (Float.min by by') (Float.max rx rx') (Float.max ty ty')

  let print {lx; by; rx; ty} =
    Printf.printf "{lx=%f; by=%f; rx=%f; ty=%f}\n" lx by rx ty
end

let () =
  let rec loop rect = function
    | 0 -> Rectangle.print rect
    | i -> loop (Rectangle.union rect (Rectangle.r 20. 0. 100. (float_of_int i))) (i - 1) in
  loop (Rectangle.r 25. 25. 200. 200.) 1000000000
