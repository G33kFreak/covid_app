class Utils {
  static DateTime getFromDate() {
    final now = DateTime.now();

    return now.subtract(const Duration(days: 7));
  }

  static DateTime getToDate() => DateTime.now();
}
