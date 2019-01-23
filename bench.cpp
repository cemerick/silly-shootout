#include <algorithm>
#include <cstdio>

struct Rectangle {
    double lx, by, rx, ty;
};

Rectangle Union(const Rectangle& r1, const Rectangle& r2) {
    return Rectangle{ std::min(r1.lx, r2.lx)
                    , std::min(r1.by, r2.by)
                    , std::max(r1.rx, r2.rx)
                    , std::max(r1.ty, r2.ty) };
}

int main() {
    Rectangle k{ 25, 25, 200, 200 };
    for (int i = 0; i < 1000000000; ++i)
      k = Union(k, Rectangle{ 20, 0, 100, (double)i });

    printf("Rectangle lx:%f by:%f rx:%f ty:%f\n", k.lx, k.by, k.rx, k.ty);
    return 0;
}

