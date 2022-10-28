/// В классе [GcdLcm]
/// Со статическими методами для поиска НОК [getLcm] (для начала найдём НОД)
/// и НОД [getGcdN]

class GcdLcm {

  ///вспомогательный НОД для пары значений
  static int getGcd2(int a, int b) => b == 0 ? a : getGcd2(b, a % b);

  static int getGcdN(List<int> nums) =>
      nums.length > 1
      ? getGcd2(nums[nums.length - 1], getGcdN(nums.sublist(0, nums.length - 1)))
          : nums.length == 1
          ? nums.first
            : 0;

  static int getLcm(List<int> nums) => nums.length > 1
      ? nums.reduce((v1, v2) => (v1 * v2) ~/ getGcd2(v1, v2))
        : nums.length == 1
        ? nums.first
          : 0;

}