
function r (lx, by, rx, ty) {
  return {lx: lx, by: by, rx: rx, ty: ty};
}

function union (r1, r2) {
  return r(Math.min(r1.lx, r2.lx)
          ,Math.min(r1.by, r2.by)
          ,Math.max(r1.rx, r2.rx)
          ,Math.max(r1.ty, r2.ty));
}

var k = r(25, 25, 200, 200);
for (var i = 0; i < 1e9; i++) {
  k = union(k, r(20, 0, 100, i));
}
console.log(k);