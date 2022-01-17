import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:gsl_menu/models/message.dart';

class FirestoreDb {
  // makes this a singleton class
  FirestoreDb._privateConstructor();

  static final FirestoreDb instance = FirestoreDb._privateConstructor();

  final FirebaseFirestore firestore = FirebaseFirestore.instance;

  Future<void> sendMessage(Message msg) async {
    await firestore.collection('messages').add(msg.toMap());
  }

  Stream<List<Message>> getEventMessages(String eid) {
    Stream<List<Message>> messages = firestore
        .collection('messages')
        .where('eid', isEqualTo: eid)
        .orderBy('timestamp')
        .snapshots()
        .map((query) => query.docs.map((doc) => Message.fromMap(doc.data())).toList());
    return messages;
  }
}