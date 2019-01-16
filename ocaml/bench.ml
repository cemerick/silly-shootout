module Rectangle = struct
  type t = {
    lx: float;
    by: float;
    rx: float;
    ty: float
  }

  let r lx by rx ty = {lx = lx; by = by; rx = rx; ty = ty}

  let union {lx = alx; by = aby; rx = arx; ty = aty}
            {lx = blx; by = bby; rx = brx; ty = bty} =
    r (min alx blx)
      (min aby bby)
      (max arx brx)
      (max aty bty)
end;;

open Rectangle

let lim = 1000000000
let _ = let rect = ref @@ r 25. 25. 200. 200. in
        for i = 0 to lim do
          rect := union !rect @@ r 20. 0. 100. (float_of_int i)
        done;
        print_endline @@ string_of_float @@ !rect.ty