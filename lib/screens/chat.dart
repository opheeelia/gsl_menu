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
  // TODO: Step 6 - use database

  final bottomBarHeight = 60.0;

  @override
  Widget build(BuildContext context) {

    // TODO: Step 6 - Wrap with stream of messages
    return Flexible(
      child: Container(
        constraints: BoxConstraints(
            maxHeight:
                MediaQuery.of(context).size.height / 2 - bottomBarHeight),
        child: Stack(
          children: <Widget>[
            const Align(
              alignment: Alignment.topCenter,
              child: Text("Chat"),
            ),
            SizedBox(
              height:
                  MediaQuery.of(context).size.height / 2 - bottomBarHeight * 2,
              child: ListView.builder(
                itemCount: 0, // TODO: Step 7 - Length
                shrinkWrap: true,
                padding: const EdgeInsets.only(top: 10, bottom: 10),
                // TODO: Step 7 - Display messages in itemBuilder
                itemBuilder: (context, index) {
                  throw Exception("Not implemented");
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
                      // TODO: Step 8 - Fill callback to send message and clear text
                      onPressed: () {},
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
}
