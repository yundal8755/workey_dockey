import 'package:cloud_firestore/cloud_firestore.dart';

class EmployeeSelectionRepo {
  // Firestore에서 정보 불러오기
  Future<List<Map<String, dynamic>>> fetchEmployeeInfos() async {
    final FirebaseFirestore firestore = FirebaseFirestore.instance;
    try {
      var employeeInfos = await firestore
          .collection('WorkPlace')
          .doc('workeydockey')
          .collection('Employee')
          .get();

      List<Map<String, dynamic>> employeeList = [];
      for (var doc in employeeInfos.docs) {
        employeeList.add(doc.data());
      }
      return employeeList;
    } catch (e) {
      rethrow; 
    }
  }
}
