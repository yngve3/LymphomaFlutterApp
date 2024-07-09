extension Birthdate on DateTime {
  int toAge() => DateTime.now().difference(this).abs().inDays ~/ 365;
}