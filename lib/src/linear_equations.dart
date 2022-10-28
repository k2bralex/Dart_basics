import 'dart:math';

///Для решения системы линеных уравнений применим метод Гаусса,
///с частиным поворотом матрицы. Реализуем вв классе [Linear]
class Linear {

  ///Проверка количества коэффициентов в [List] для создания матрицы
  static isGood(List<num> factors) {
    var t = sqrt(factors.length).toInt();
    return ((factors.length - t * t) == t) && factors.isNotEmpty;
  }

  ///Инициализаця матрицы. Если во входящем массиве не достаточное
  ///кол-во элементов, выбрасываем ошибку и выходим из функции выводя на консоль
  ///сообщение об ошибке и возвращаем null
  ///В успешном случае возвращаем матрицу коэффициентов в виде [rows]х[cols]
  static List<List<num>>? getMatrix(List<num> fact) {

    try {
      if (!isGood(fact)) throw ArgumentError(e);

      int rows = sqrt(fact.length).toInt();
      int cols = rows + 1;
      List<List<num>> matrix = List<List<num>>
          .generate(rows, (i) => List<num>.filled(cols, 0));

      for(int i = 0; i < rows; i++) {
        matrix[i] = fact.skip(i * rows + i).take(cols).toList();
      }

      return matrix;
    }
    on ArgumentError {
      print("Incorrect coefficients quantity");
      return null;
    }
    catch(e) {
      print("Something goes wrong!");
      return null;
    }
  }

  ///Приведение матрицы к ступенчатому виду методом частичного поворота
  static List<List<num>>? triangle(List<List<num>>? matrix) {
    if (matrix == null || matrix.isEmpty) return null;

    int len = matrix.length;
    ///Поиск оси
    for (int k = 0; k < len; k++) {
      int p = k;
      num maxPivot = 0;
      for (int i = k; i < len; i++) {
        if (matrix[i][k].abs() > maxPivot) {
          maxPivot = matrix[i][k].abs();
          p = i;
        }
      }
      ///swap
      if (p != k) {
        for (int i = k; i < len + 1; i++) {
          var temp = matrix[p][i];
          matrix[p][i] = matrix[k][i];
          matrix[k][i] = temp;
        }
      }

      ///Вырождение переменных
      for (int i = k + 1; i < len; i++) {
        double m = matrix[i][k] / matrix[k][k];
        for (int j = k; j < len + 1; j++) {
          matrix[i][j] -= m * matrix[k][j];
        }
      }
    }

    return matrix;
  }

  ///Обратный обход
  static List<num> solve(List<num> fact) {
    var matrix = triangle(getMatrix(fact));

    if (matrix == null || matrix.isEmpty) return [];

    int len = matrix.length;
    var solution = List<num>.filled(len, 0);

    for (int i = len - 1; i >= 0; i--) {
      num sum = matrix[i][len];
      for (int j = i + 1; j < len; j++) {
        sum -= matrix[i][j] * solution[j];
      }
      solution[i] = sum / matrix[i][i];
    }

    return solution;
  }

  ///Вывод матрицы на консоль
  static String toStrng(List<List<num>> matrix) {
    return matrix.map((i) => i.join(" ")).join("\n");
  }
}