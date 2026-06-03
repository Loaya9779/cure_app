class BookingModel {
  final String? id;
  final String userId;
  final String service;
  final DateTime date;
  final String? notes;
  final String status; // 👈 مهم جدًا

  BookingModel({
    this.id,
    required this.userId,
    required this.service,
    required this.date,
    this.notes,
    required this.status,
  });

  Map<String, dynamic> toJson() {
    return {
      "userId": userId,
      "service": service,
      "date": date.toIso8601String(),
      "notes": notes,
      "status": status, // 👈 مهم
    };
  }

  factory BookingModel.fromJson(Map<String, dynamic> json, String id) {
    return BookingModel(
      id: id,
      userId: json["userId"],
      service: json["service"],
      date: DateTime.parse(json["date"]),
      notes: json["notes"],
      status: json["status"] ?? "active",
    );
  }
}
