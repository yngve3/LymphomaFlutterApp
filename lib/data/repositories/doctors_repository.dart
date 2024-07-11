import 'dart:io';

import 'package:injectable/injectable.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

import '../../consts/strings.dart';
import '../../domain/models/doctor/doctor.dart';

@injectable
class DoctorsRepository {
  Future<Doctor> getDoctor(String id) async {
    final result = await Supabase.instance.client
        .from(TableNames.doctors)
        .select()
        .eq(TableFieldNames.id, id);

    if (result.isEmpty) return Doctor.empty();

    final imageURL = await getAvatarURL(id);

    return Doctor.fromJson(result[0], imageURL: imageURL);
  }

  Future<String?> getAvatarURL(String id) async {
    final list = await Supabase.instance.client.storage.from('avatars').list(path: id);
    if (list.isEmpty) return null;
    return Supabase.instance.client.storage.from('avatars').getPublicUrl(
      "$id/avatar.png",
    );
  }

  Future<String?> uploadImage(File file, String id) async {
    await Supabase.instance.client.storage.from('avatars').upload(
      "$id/avatar.png",
      file,
      fileOptions: const FileOptions(
        upsert: true
      )
    );

    return getAvatarURL(id);
  }
}