import 'package:cloud_firestore/cloud_firestore.dart';

class RoleManagementRepo {
  Stream<List<String>> fetchRoleList() {
    final FirebaseFirestore firestore = FirebaseFirestore.instance;
    return firestore
        .collection('WorkPlace')
        .doc('workeydockey')
        .snapshots()
        .map((snapshot) {
      if (snapshot.exists && snapshot.data()!.containsKey('roleList')) {
        var roles = snapshot.data()!['roleList'] as List<dynamic>;

        return roles.cast<String>();
      } else {
        return <String>[];
      }
    });
  }
}
