import 'dart:math';
import 'point_3D.dart';

///Реализуем класс [Triangle] с возможностью инициализации как по трем
///точкам определнным классом [Point3D], так и по трем сторонам
class Triangle {
  Point3D _a = Point3D(0, 0, 0);
  Point3D _b = Point3D(0, 0, 0);
  Point3D _c = Point3D(0, 0, 0);

  double _ab = 0;
  double _bc = 0;
  double _ca = 0;

  ///Конструктор по точкам
  Triangle(this._a, this._b, this._c);

  ///Конструктор по соронам с проверкой на инициализации треугольника
  Triangle.bySide(this._ab, this._bc, this._ca) {
    if (!isTriangle(_ab,_bc,_ca)){
      throw ArgumentError("Isn`t triangle");
    }
  }

  ///Проверка условия инициализации треугольника
  static bool isTriangle(double ab, double bc, double ca)
    => (ab + bc) > ca && (ab + ca) > bc && (bc + ca) > ab;

  ///Метод, принимающий три точки в трёхмерном пространстве и
  ///возвращающий площадь треугольника, который образуют данные точки.
  double squareByCoordinates() {
    var ab = _a.distanceTo(_b);
    var bc = _b.distanceTo(_c);
    var ca = _c.distanceTo(_a);

    if (!isTriangle(ab,bc,ca)) return 0;

    var p = (ab + bc + ca) / 2;

    return sqrt((p-ab)*(p-bc)*(p-ca)*p);
  }

}