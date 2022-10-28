///Для конвертации воспользуемся сдигом на разряд вправо
extension Binary on int {
  String toBinary() {
    var binaryString = "";
    var intValue = this;
    while (intValue != 0) {
      binaryString += (intValue & 1) == 1 ? "1" : "0";
      intValue >>= 1;
    }
    return binaryString.split("").reversed.join("");
  }
}