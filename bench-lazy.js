
/* these are bad, minimal fns, don't copy */

function* map (f, gen) {
  for (let x of gen) {
    yield f(x);
  }
}

function fold (f, acc, gen) {
  for (let x of gen) {
    acc = f(acc, x);
  }
  return acc;
}

function* range (x, y) {
  while (x < y) yield x++;
}

function r (lx, by, rx, ty) {
  return {lx: lx, by: by, rx: rx, ty: ty};
}

function union (r1, r2) {
  return r(Math.min(r1.lx, r2.lx)
          ,Math.min(r1.by, r2.by)
          ,Math.max(r1.rx, r2.rx)
          ,Math.max(r1.ty, r2.ty));
}

console.log(fold(union
                , r(25, 25, 200, 200)
                , map(i => r(20, 0, 100, i)
                     , range(0, 1e9))))