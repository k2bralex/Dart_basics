import 'dart:math';

import 'package:dart_base/module_two.dart';

///Создадим класс [Point3D]
///Часть задания реализована в классе [Triangle]
class Point3D {
  final int x;
  final int y;
  final int z;

  static Point3D origin = Point3D(0, 0, 0);

  ///Конструктор по координатам
  Point3D(this.x, this.y, this.z);

  ///Конструктор начала координат.
  factory Point3D.base(int x, int y, int z) {
    if (origin.x != x && origin.y != y && origin.z != z) {
      origin = Point3D(x, y, z);
    }
    return origin;
  }

  //Конструктор определеяющий точку с учетом начала координат
  factory Point3D.unit(int x, int y, int z) {
    return Point3D(origin.x + x, origin.y + y, origin.z + z);
  }

  ///Рассчет расстояния между точками
  double distanceTo(Point3D another) {
    return sqrt(pow(x-another.x, 2) + pow(y-another.y, 2) + pow(z-another.z, 2));
  }

  ///Переоределнный метод toString() для вывода координат
  @override
  String toString() {
    return  "[$x, $y, $z]";
  }

}