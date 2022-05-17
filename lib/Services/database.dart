import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:vacxpass_front/Models/vaccine.dart';
import 'package:vacxpass_front/Utilities/snackBarUtil.dart';

class DatabaseService {
  final String? uid;
  String? name;
  String? nic;
  String? dob;
  String? vacStatus;
  var vaccines = <VaccineModel>[];

  DatabaseService({this.uid});

  //collection reference
  final CollectionReference userCollection =
      FirebaseFirestore.instance.collection('users');

  Future updateUserData(
      {String? name,
      String? nic,
      String? dob,
      String? vacStatus,
      List<VaccineModel> vaccines = const []}) async {
    try {
      return await userCollection.doc(uid).set({
        'name': name,
        'nic': nic,
        'dob': dob,
        'vacStatus': vacStatus,
        'vaccines': vaccines.map((i) => i.toMap()).toList()
      });
    } catch (e) {
      SnackBarUtil.showSnackBar(e.toString());
      print(e.toString());
      return null;
    }
  }

  Future getUserData() async {
    try {
      var userDoc = await userCollection.doc(uid).get();
      if (userDoc.exists) {
        name = userDoc.get('name');
        nic = userDoc.get('nic');
        dob = userDoc.get('dob');
        vacStatus = userDoc.get('vacStatus');
        List<dynamic> vacArr = userDoc.get('vaccines');
        for (var i in vacArr) {
          vaccines.add(i);
        }
      }
      return userDoc;
    } catch (e) {
      print(e.toString());
      return null;
    }
  }

  // Iterable<AppUser> _userListFromSnapshot(String uid, QuerySnapshot snapshot) {
  //   return snapshot.docs.map((doc) {
  //     return AppUser(
  //       uid: uid,
  //       name: doc.get('name'),
  //     );
  //   });
  // }

  //get users stream
  Stream<QuerySnapshot> get users {
    return userCollection.snapshots();
  }
}
