import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:scheduler_pro/data/models/tasks.dart';

class TasksRepository {
  final User? _user = FirebaseAuth.instance.currentUser;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Future<void> addTask(
    title,
    location,
    date,
    startTime,
    endTime,
    priority,
    description,
  ) async {
    if (_user != null) {
      await _firestore.collection(_user.email!).add({
        'title': title,
        'location': location,
        'date': date,
        'starttime': startTime,
        'endtime': endTime,
        'priority': priority,
        'description': description,
      });
    }
  }

  Future<void> deleteTask(docId) async {
    if (_user != null) {
      await _firestore.collection(_user.email!).doc(docId).delete();
    }
  }

  Stream<List<Tasks>> getTasks() {
    return _firestore
        .collection(_user!.email!)
        .snapshots()
        .map((snapshot) => snapshot.docs.map((doc) => Tasks.fromMap(doc.data(), doc.id)).toList());
  }
}
