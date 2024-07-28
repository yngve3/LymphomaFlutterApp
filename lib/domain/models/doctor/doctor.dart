class Doctor {
  const Doctor({
    required this.id,
    required this.fullName,
    required this.phone,
    required this.room,
    required this.type,
    this.imageURL
  });

  bool get isEmpty => id == "";

  factory Doctor.empty() {
    return const Doctor(
      id: "",
      fullName: "",
      phone: "",
      room: "",
      type: "",
    );
  }

  factory Doctor.fromJson(Map<String, dynamic> json, {String? imageURL}) {
    if (json.isEmpty) return Doctor.empty();
    return Doctor(
      id: json['id'],
      fullName: json['full_name'],
      phone: json['phone'],
      room: json['room'],
      type: json['type'],
      imageURL: json['image_url'] ?? imageURL
    );
  }

  final String id;
  final String fullName;
  final String phone;
  final String room;
  final String type;
  final String? imageURL;
}