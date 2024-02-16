//import 'dart:html';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get_navigation/src/routes/circular_reveal_clipper.dart';
import 'package:whatsapp/listes/proson_Name.dart';

final _firestore = FirebaseFirestore.instance;

class Mobilechatscreen extends StatefulWidget {
  Mobilechatscreen(
      {Key? key, required this.prersonName, required this.resiverId})
      : super(key: key);
  String prersonName;
  final String resiverId;
  @override
  State<Mobilechatscreen> createState() => _MobilechatscreenState();
}

class _MobilechatscreenState extends State<Mobilechatscreen> {
  // ignore: unused_field
  final _auth = FirebaseAuth.instance;
  final messageTextcontroller = TextEditingController();
  String? resiverid;
  String? senderid;
  String? messageid;
  String? messageText;

  //----------mohammed--------------
  // TextEditingController messageController = TextEditingController();
  // List<Map<String, dynamic>> usersList = [];
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    fechDataUsers();
  }
  //---------------------mohammed-----------------------------
  // void initState() {
  //   super.initState();
  //   fechDataUsers();

  // }
  //-------------------------------------------------------
  // void getmeages() async {
  //   // ignore: unused_local_variable
  //   final messages = await _firestore.collection('messages').get(
  //     for (var message in messages.docs)
  //   );
  void messagesStream() async {
    await for (var snapshot in _firestore.collection('messages').snapshots()) {
      for (var message in snapshot.docs) {
        print(message.data());
      }
    }
  }

  Future<void> fechDataUsers() async {
    CollectionReference<Map<String, dynamic>> collection =
        FirebaseFirestore.instance.collection('messags');
    QuerySnapshot<Map<String, dynamic>> snapshot = await collection.get();

    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        title: Row(
          children: [
            personName(personNam: widget.prersonName),
          ],
        ),
      ),
      body: SafeArea(
        child: Column(
            //listview
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              const MessageStremBuilder(),

              Container(
                margin: EdgeInsets.only(bottom: 10),
                child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Expanded(
                        child: TextFormField(
                          controller: messageTextcontroller,
                          onChanged: (value) {
                            messageText = value;
                          },
                          decoration: InputDecoration(
                            contentPadding: EdgeInsets.symmetric(
                              vertical: 10,
                              horizontal: 20,
                            ),
                            hintText: 'message',
                            hintStyle: const TextStyle(
                                color: Color.fromARGB(255, 7, 56, 81)),
                            filled: true,
                            fillColor: Color.fromARGB(255, 192, 193, 196),
                            isDense: true,
                            border: OutlineInputBorder(
                              borderSide: const BorderSide(
                                style: BorderStyle.none,
                                width: 0,
                              ),
                              borderRadius: BorderRadius.circular(30),
                            ),
                          ),
                        ),
                      ),
                      TextButton(
                        onPressed: () {
                          messageTextcontroller.clear();
                          _firestore.collection('messages').add({
                            'message': messageText,
                            'senderId': 'lvMOG24syZrXCTx9yyMi',
                            'resiverId': widget.resiverId,
                            'time':FieldValue.serverTimestamp(),
                          });
                        },
                        child: Icon(Icons.send_outlined, size: 35),
                      )
                    ]),
              ),

              // Container(
              //   child: ListView.builder(
              //       itemCount: usersList.length,
              //       shrinkWrap: true,
              //       itemBuilder: (context, i) {
              //         return ListTile(
              //           title: Text(usersList[i]['message']),
              //         );
              //       }),
              // ),
              //     Row(
              //         children: [
              //           Expanded(child: TextFormField(
              //              controller: messageController,
              //         onChanged: (value) {},
              //         decoration:  InputDecoration(
              //           contentPadding: EdgeInsets.symmetric(
              //             vertical: 10,
              //             horizontal: 20,
              //           ),
              //             hintText: 'message',
              //             hintStyle:const TextStyle(color:Colors.blueGrey),
              //             filled: true,
              //             fillColor: Colors.blueAccent,
              //             isDense: true,
              //             border: OutlineInputBorder(borderSide:const BorderSide(
              //               style: BorderStyle.none,
              //               width: 0,
              //             ),
              //             borderRadius: BorderRadius.circular(30),
              //             ),
              //           ),
              //           ),
              //           ),
              //       TextButton(
              //           onPressed: () async {
              //             // ignore: unnecessary_null_comparison
              //             if (messageController.text != '' &&
              //                 messageController.text != null) {
              //               Map<String, dynamic> data = {
              //                 'message': messageController.text,
              //                 'senderId': 'lvMOG24syZrXCTx9yyMi',
              //                 'resiverId': widget.resiverId,
              //                 'time': DateTime.now()
              //               };
              //               CollectionReference<Map<String, dynamic>> collection =
              //                   FirebaseFirestore.instance.collection('messags');
              //               DocumentReference<Map<String, dynamic>>
              //                   documentReference = await collection.add(data);
              //               String documentId = documentReference.id;
              //               data['messageID'] = documentId;
              //               await documentReference.update(data);
              //               setState(() {
              //                 messageController.clear();
              //               });
              //             } else {
              //               ScaffoldMessenger.of(context).showSnackBar(
              //                   const SnackBar(
              //                       content: Text("لايمكن ارسال رسالة فارغة")));
              //             }
              //           },
              //           child:
              //           Icon(Icons.send_outlined,size: 35),
              //        ),
              //         ],
              //     ),
            ]),
      ),
    );
  }
}

class MessageLine extends StatelessWidget {
  const MessageLine({Key? key, this.text}) : super(key: key);
  // final String? sender;
  final String? text;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          Material(
            elevation: 5, //  ظل
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(30),
              bottomLeft: Radius.circular(30),
              bottomRight: Radius.circular(30),
            ),
            color: Colors.blue[800],
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
              child: Text(
                '$text',
                style: const TextStyle(
                  fontSize: 15,
                  color: Colors.white,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class MessageStremBuilder extends StatelessWidget {
  const MessageStremBuilder({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<QuerySnapshot>(
      stream: _firestore.collection('messages').orderBy('time').snapshots(),
      builder: (context, snapshot) {
        List<MessageLine> messageWidgets = [];
        if (!snapshot.hasData) {
          return Center(
            child: CircularProgressIndicator(
              backgroundColor: Colors.blue,
            ),
          );
        }
        final messages = snapshot.data!.docs.reversed;
        for (var message in messages) {
          final messageText = message.get('message');
          final senderid = message.get('senderId');
          final resiverid = message.get('resiverId');
          final messageWidget = MessageLine(
            text: messageText,
          );
          messageWidgets.add(messageWidget);
        }
        return Expanded(
          child: ListView(
            reverse: true,
            padding: EdgeInsets.symmetric(horizontal: 10, vertical: 20),
            children: messageWidgets,
          ),
        );
      },
    );
  }
}
