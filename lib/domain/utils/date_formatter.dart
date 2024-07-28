import 'package:intl/intl.dart';
import 'package:lymphoma/ext/date_time_ext.dart';

abstract class DateFormatter {
  static getWordIfDateTomorrowTodayOrDate(DateTime dateTime) {
    if (dateTime.isToday) return "Сегодня";
    if (dateTime.isTomorrow) return "Завтра";
    return DateFormat("dd.MM.y", 'ru_RU').format(dateTime);
  }

  static getTime(DateTime dateTime) {
    return DateFormat.Hm('ru_RU').format(dateTime);
  }

  static getDateInWordAndTime(DateTime dateTime) {
    return "${getWordIfDateTomorrowTodayOrDate(dateTime.toLocal())}, ${getTime(dateTime.toLocal())}";
  }
}