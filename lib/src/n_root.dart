///Корень a степени n = a в степени -1/n
extension Root on num {
  num nthRoot(int n) {

    num powIt(num base, int p) {
      if (p == 0) return 1;
      return base * powIt(base, p - 1);
    }

    num absIt(num a)=> a > 0 ? a : -a;

    const e = 0.00001;
    var a = this;
    var n1 = n.toDouble();
    var lst = [a, a / n1];
    while (absIt(lst[0] - lst[1]) > e) {
      lst[1] = lst[0];
      lst[0] = (1 / n1) * (((n1 - 1) * lst[1]) +
          a/powIt(lst[1], (n1 - 1).toInt()));
    }
    return lst[0];
  }
}

