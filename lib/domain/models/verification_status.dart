import '../../consts/strings.dart';

enum VerificationStatus {
  accepted("accepted"),
  waiting("waiting"),
  rejected("rejected");

  final String tableName;

  const VerificationStatus(this.tableName);

  static VerificationStatus fromJson(Map<String, dynamic> json) {
    for (final value in VerificationStatus.values) {
      if (value.tableName == json[TableFieldNames.verificationStatus]) {
        return value;
      }
    }

    return VerificationStatus.waiting;
  }
}