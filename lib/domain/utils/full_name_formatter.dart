import 'package:lymphoma/ext/string_ext.dart';

class FullNameFormatter {
  static String toAbbr(String fullName) {
    final fullNameSplit = fullName.split(" ");
    if (fullNameSplit.length != 3) {
      return fullName;
    }

    return "${fullNameSplit[0]} ${fullNameSplit[1].firstSym}. ${fullNameSplit[2].firstSym}.";
  }
}