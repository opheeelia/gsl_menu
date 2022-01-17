import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:gsl_menu/models/message.dart';

class FirestoreDb {
  // makes this a singleton class
  FirestoreDb._privateConstructor();

  static final FirestoreDb instance = FirestoreDb._privateConstructor();

  // TODO: Step 2 - Use Firestore

  Future<void> sendMessage(Message msg) async {
    // TODO: Step 9 - Send message
  }

  Stream<List<Message>> getEventMessages(String eid) {
    // TODO: Step 3 - Get messages from firestore
    throw Exception("Not implemented");
  }
}