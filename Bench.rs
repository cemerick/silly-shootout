
#[derive(Debug)]
struct Rectangle {
      lx: f64
    , by: f64
    , rx: f64
    , ty: f64
}

fn r (lx: f64, by: f64, rx: f64, ty: f64) -> Rectangle {
    Rectangle{lx, by, rx, ty}
}

fn union (a : Rectangle, b: Rectangle) -> Rectangle {
    Rectangle{lx: a.lx.min(b.lx),
              by: a.by.max(b.by),
              rx: a.rx.max(b.rx),
              ty: a.ty.max(b.ty)}
}

fn main() {
    println!("{:?}", (0..1000000000)
                     .map(|i| r(20.0, 0.0, 100.0, i as f64))
                     .fold(r(25.0, 25.0, 200.0, 200.0), &union));
}