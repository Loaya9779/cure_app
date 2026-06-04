class ProfileModel {
  final String uid;
  final String name;
  final String phoneNumber;
  final String address;
  final String bloodType;
  final String chronicDiseases;
  final String notes;
  final String rule;

  ProfileModel({
    required this.uid,
    required this.name,
    required this.phoneNumber,
    required this.address,
    required this.bloodType,
    required this.chronicDiseases,
    required this.notes,
    required this.rule,
  });

  Map<String, dynamic> toJson() {
    return {
      "uid": uid,
      "name": name,
      "phoneNumber": phoneNumber,
      "address": address,
      "bloodType": bloodType,
      "chronicDiseases": chronicDiseases,
      "notes": notes,
      "rule": rule,
    };
  }

  factory ProfileModel.fromJson(Map<String, dynamic> json) {
    return ProfileModel(
      uid: json["uid"] ?? "",
      name: json["name"] ?? "",
      phoneNumber: json["phoneNumber"] ?? "",
      address: json["address"] ?? "",
      bloodType: json["bloodType"] ?? "",
      chronicDiseases: json["chronicDiseases"] ?? "",
      notes: json["notes"] ?? "",
      rule: json["rule"] ?? "user",
    );
  }

  ProfileModel copyWith({
    String? name,
    String? phoneNumber,
    String? address,
    String? bloodType,
    String? chronicDiseases,
    String? notes,
    String? rule,
  }) {
    return ProfileModel(
      uid: uid,
      name: name ?? this.name,
      phoneNumber: phoneNumber ?? this.phoneNumber,
      address: address ?? this.address,
      bloodType: bloodType ?? this.bloodType,
      chronicDiseases: chronicDiseases ?? this.chronicDiseases,
      notes: notes ?? this.notes,
      rule: rule ?? this.rule,
    );
  }
}
