abstract class YearFormatter {
  static getYearWord(int countYears) {
    if (countYears % 10 == 1) {
      return "год";
    } else if (countYears % 10 >= 2 && countYears % 10 <= 4) {
      return "года";
    } else if ((countYears >= 5 && countYears <= 20) || countYears % 10 >= 5 && countYears % 10 <= 9 || countYears % 10 == 0) {
      return "лет";
    }
  }
}