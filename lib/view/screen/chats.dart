// ignore:
// ignore_for_file: unused_import
import 'package:firebase_core/firebase_core.dart';
// ignore: implementation_imports, unnecessary_import
import 'package:flutter/src/foundation/key.dart';
// ignore: implementation_imports, unnecessary_import
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/material.dart';
// ignore:
import 'package:flutter_advanced_avatar/flutter_advanced_avatar.dart';
import 'package:get/get.dart';
import 'package:whatsapp/listes/listchats.dart';
import 'package:whatsapp/view/screen/mobile_chat.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

// ignore: camel_case_types
class chats extends StatefulWidget {
  const chats({Key? key}) : super(key: key);

  @override
  State<chats> createState() => _chatsState();
}

// ignore: camel_case_types
class _chatsState extends State<chats> {
  final TextEditingController _nameController = TextEditingController();
  List<Map<String, dynamic>> usersList = [];

  @override
  void initState() {
    super.initState();
    fechDataUsers();
  }

  Future<void> fechDataUsers() async {
    CollectionReference<Map<String, dynamic>> collection =
        FirebaseFirestore.instance.collection('users');
    QuerySnapshot<Map<String, dynamic>> snapshot = await collection.get();
    for (var element in snapshot.docs) {
      usersList.add(element.data());
    }
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
          onPressed: () {
            showDialog(
              context: context,
              builder: (BuildContext context) {
                return Directionality(
                  textDirection: TextDirection.rtl,
                  child: SingleChildScrollView(
                    child: AlertDialog(
                      title: const Text('إضافة مستخدم'),
                      content: TextField(
                        controller: _nameController,
                        decoration:
                            const InputDecoration(hintText: 'اسم المستخدم'),
                      ),
                      actions: <Widget>[
                        ElevatedButton(
                          child: const Text('إلغاء'),
                          onPressed: () {
                            Navigator.of(context).pop();
                          },
                        ),
                        ElevatedButton(
                          child: const Text('حفظ'),
                          onPressed: () async {
                            Map<String, dynamic> data = {
                              'name': _nameController.text,
                            };
                            CollectionReference<Map<String, dynamic>>
                                collection =
                                FirebaseFirestore.instance.collection('users');
                            DocumentReference<Map<String, dynamic>>
                                documentReference = await collection.add(data);
                            String documentId = documentReference.id;
                            data['userID'] = documentId;

                            await documentReference.update(data);

                            Navigator.of(context).pop();
                            setState(() {});
                          },
                        ),
                      ],
                    ),
                  ),
                );
              },
            );
          },
          child: const Icon(Icons.add)),
      body: ListView.builder(
          itemCount: usersList.length,
          shrinkWrap: true,
          itemBuilder: (context, i) {
            return ListTile(
              onTap: () {
                // Get.to(Mobilechatscreen(
                //   imageur:listchats[i].image,prersonName: listchats[i].name,),

                // );
                Navigator.of(context)
                    .push(MaterialPageRoute(builder: (context) {
                  return Mobilechatscreen(
                    prersonName: usersList[i]['name'] ?? ' ',
                    resiverId: usersList[i]['userID'] ?? ' ',
                  );
                }));
              },
              title: Text(usersList[i]['name']),
              // subtitle: Text(listchats[i].msg),
              // trailing: Text(listchats[i].time),
              leading: const CircleAvatar(
                backgroundColor: Colors.white,
                child: Icon(
                  Icons.person,
                  color: Colors.blueAccent,
                ),
              ),
            );
          }),
    );
  }
}
