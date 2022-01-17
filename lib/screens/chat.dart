import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:gsl_menu/models/message.dart';
import 'package:gsl_menu/services/database.dart';
import 'package:provider/provider.dart';

class Chat extends StatefulWidget {
  final String eid;

  const Chat({Key? key, required this.eid}) : super(key: key);

  @override
  _ChatState createState() => _ChatState();
}

class _ChatState extends State<Chat> {
  final messageController = TextEditingController();
  final FirestoreDb _db = FirestoreDb.instance;

  final bottomBarHeight = 60.0;

  @override
  Widget build(BuildContext context) {
    print(Provider.of<User>(context).uid);
    Stream<List<Message>> messagesStream = _db.getEventMessages(widget.eid);

    return StreamBuilder<List<Message>>(
        stream: messagesStream,
        builder: (context, snapshot) {
          List<Message>? messages = snapshot.data;
          if (snapshot.hasError) {
            return Text('Something went wrong');
          }

          if (snapshot.connectionState == ConnectionState.waiting) {
            return Text("Loading");
          }

          return Flexible(
            child: Container(
              constraints: BoxConstraints(maxHeight: MediaQuery.of(context).size.height/2 - bottomBarHeight),
              child: Stack(
                children: <Widget>[
                  const Align(alignment: Alignment.topCenter, child: Text("Chat"),),
                  SizedBox(
                    height: MediaQuery.of(context).size.height/2 - bottomBarHeight * 2,
                    child: ListView.builder(
                      itemCount: messages?.length ?? 0,
                      shrinkWrap: true,
                      padding: const EdgeInsets.only(top: 10, bottom: 10),
                      // physics: NeverScrollableScrollPhysics(),
                      itemBuilder: (context, index) {
                        return Container(
                          padding:
                          const EdgeInsets.only(
                              left: 14, right: 14, top: 10, bottom: 10),
                          child: Align(
                            alignment: (messages![index].senderId != Provider.of<User>(context).uid
                                ? Alignment.topLeft
                                : Alignment.topRight),
                            child: Container(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(20),
                                color: (messages[index].senderId != Provider.of<User>(context).uid
                                    ? Colors.grey.shade200
                                    : Colors.blue[200]),
                              ),
                              padding: const EdgeInsets.all(16),
                              child: Text(
                                messages[index].message,
                                style: const TextStyle(fontSize: 15),
                              ),
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                  Positioned(
                    bottom: MediaQuery.of(context).viewInsets.bottom,
                    child: Container(
                      padding: const EdgeInsets.only(left: 10, bottom: 10, top: 10),
                      height: bottomBarHeight,
                      width: MediaQuery.of(context).size.width,
                      color: Colors.white,
                      child: Row(
                        children: <Widget>[
                          const SizedBox(
                            width: 15,
                          ),
                          Expanded(
                            child: TextField(
                              controller: messageController,
                              decoration: const InputDecoration(
                                  hintText: "Write message...",
                                  hintStyle: TextStyle(color: Colors.black54),
                                  border: InputBorder.none),
                            ),
                          ),
                          const SizedBox(
                            width: 15,
                          ),
                          FloatingActionButton(
                            onPressed: () {
                              Message msg = Message(eid: widget.eid,
                                  senderId: Provider.of<User>(context, listen: false).uid,
                                  message: messageController.text,
                                  timestamp: DateTime.now());
                              _db.sendMessage(msg);
                              // messageController.text = "";
                              messageController.clear();
                            },
                            child: const Icon(
                              Icons.send,
                              color: Colors.white,
                              size: 18,
                            ),
                            backgroundColor: Colors.blue,
                            elevation: 0,
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          );
        }
    );
  }
}