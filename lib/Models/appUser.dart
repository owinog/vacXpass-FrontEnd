import 'package:vacxpass_front/Models/vaccine.dart';

class AppUser {
  final String? uid;
  String? name;
  String? nic;
  String? dob;
  String? vacStatus = 'Fully Vaccinated';
  bool emailVerified;
  String? vacAuthCode;
  bool fullyVaccinated = false;
  List<VaccineModel> vaccinesGiven = [];
  AppUser(
      {required this.uid,
      this.name,
      this.nic,
      this.dob,
      this.emailVerified = false});

  void addVaccine(VaccineModel vaccine) {
    vaccinesGiven.add(vaccine);
    if (vaccinesGiven.length >= 3) {
      fullyVaccinated = true;
    }
  }
}
