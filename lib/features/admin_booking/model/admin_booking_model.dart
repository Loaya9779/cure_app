
class AdminBookingModel {
  final String id;
  final String uid;
  final String serviceType;
  final String date;
  final String notes;

  final String userName;
  final String phone;
  final String address;
  final String bloodType;
  final String hasChronicDiseases;

  final String status;

  AdminBookingModel({
    required this.id,
    required this.uid,
    required this.serviceType,
    required this.date,
    required this.notes,
    required this.userName,
    required this.phone,
    required this.address,
    required this.bloodType,
    required this.hasChronicDiseases,
    required this.status,
  });

}
