extension StringUtils on String {
  String get firstSym => isNotEmpty ? this[0] : "";
  String get firstSymToUpperCase => isNotEmpty ? "${this[0]}${substring(1)}" : "";
}