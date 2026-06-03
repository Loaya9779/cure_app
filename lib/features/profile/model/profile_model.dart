class ProfileModel {
  final String uid;
  final String name;
  final String phoneNumber;
  final String address;
  final String bloodType;
  final String chronicDiseases;
  final String notes;

  ProfileModel({
    required this.uid,
    required this.name,
    required this.phoneNumber,
    required this.address,
    required this.bloodType,
    required this.chronicDiseases,
    required this.notes,
  });

  /// 🔥 تحويل لـ Firebase
  Map<String, dynamic> toJson() {
    return {
      "uid": uid,
      "name": name,
      "phoneNumber": phoneNumber,
      "address": address,
      "bloodType": bloodType,
      "chronicDiseases": chronicDiseases,
      "notes": notes,
    };
  }

  /// 🔥 تحويل من Firebase
  factory ProfileModel.fromJson(Map<String, dynamic> json) {
    return ProfileModel(
      uid: json["uid"] ?? "",
      name: json["name"] ?? "",
      phoneNumber: json["phoneNumber"] ?? "",
      address: json["address"] ?? "",
      bloodType: json["bloodType"] ?? "",
      chronicDiseases: json["chronicDiseases"] ?? "",
      notes: json["notes"] ?? "",
    );
  }

  /// 🔥 مهم جدًا للتعديل (edit profile)
  ProfileModel copyWith({
    String? name,
    String? phoneNumber,
    String? address,
    String? bloodType,
    String? chronicDiseases,
    String? notes,
  }) {
    return ProfileModel(
      uid: uid,
      name: name ?? this.name,
      phoneNumber: phoneNumber ?? this.phoneNumber,
      address: address ?? this.address,
      bloodType: bloodType ?? this.bloodType,
      chronicDiseases: chronicDiseases ?? this.chronicDiseases,
      notes: notes ?? this.notes,
    );
  }
}