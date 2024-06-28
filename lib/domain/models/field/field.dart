import 'package:freezed_annotation/freezed_annotation.dart';

part 'field.freezed.dart';

@freezed
class Field with _$Field {
  const Field._();
  const factory Field({
    String? text,
    String? error
  }) = _Field;

  static empty() => const Field();

  @override
  bool operator ==(Object other) {
    if (other is! Field) return false;
    if (text == null || text!.isEmpty) return false;
    return text == other.text;
  }

  bool get isValid => error == null;
  bool get isNotValid => error != null;
  bool get isEmpty => text?.isEmpty ?? true;
  bool get isNotEmpty => text?.isNotEmpty ?? false;
}
