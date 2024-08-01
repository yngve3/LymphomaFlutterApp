extension Birthdate on DateTime {
  int toAge() => DateTime.now().difference(this).abs().inDays ~/ 365;
}

extension DateHelpers on DateTime {
  bool get isToday {
    final now = DateTime.now();
    return now.day == day && now.month == month && now.year == year;
  }

  bool get isYesterday {
    final yesterday = DateTime.now().subtract(const Duration(days: 1));
    return yesterday.day == day &&
        yesterday.month == month &&
        yesterday.year == year;
  }

  bool get isTomorrow {
    final yesterday = DateTime.now().add(const Duration(days: 1));
    return yesterday.day == day &&
        yesterday.month == month &&
        yesterday.year == year;
  }

  bool get isThisWeek {
    final sevenDaysLater = DateTime.now().add(const Duration(days: 7));
    return isAfter(DateTime.now()) && isBefore(sevenDaysLater);
  }
}