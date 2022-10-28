class Riemann{

  ///Используя материалы
  ///https://www.sfu.ca/math-coursenotes/Math%20158%20Course%20Notes/sec_riemann.html
  ///т.к. функция задана по условию, применим формулу средних прямоугольников
  ///с шагом 0.01
  static double findIntegral(double a, double b, Function func) =>
      a < b ? [for(int i = 0; i < (b - a) ~/ 0.01; i++)
                func(a + ((i.toDouble() + 0.5) * 0.01))
              ].reduce((x, y) => x + y) * 0.01
            : 0;
}


///реализация как расширение к классу Function
extension RiemannSum on Function{
  double findIntegral(double a, double b) =>
      a < b ? [for(int i = 0; i < (b - a) ~/ 0.01; i++)
                this(a + ((i.toDouble() + 0.5) * 0.01))
              ].reduce((x, y) => x + y) * 0.01
            : 0;
}