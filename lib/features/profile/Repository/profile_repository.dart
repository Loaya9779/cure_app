import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:cuer_app/features/profile/model/profile_model.dart';

class ProfileRepository {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Future<ProfileModel> getProfile(String uid) async {
    final doc = await _firestore.collection("users").doc(uid).get();

    if (!doc.exists) {
      throw Exception("Profile not found");
    }

    return ProfileModel.fromJson(doc.data()!);
  }

  Future<void> saveProfile(ProfileModel profile) async {
    await _firestore
        .collection("users")
        .doc(profile.uid)
        .set(profile.toJson());
  }

  Future<void> updateProfile(ProfileModel profile) async {
    await _firestore
        .collection("users")
        .doc(profile.uid)
        .update(profile.toJson());
  }
  
}