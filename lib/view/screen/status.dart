// ignore_for_file: unused_import, dead_code

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_advanced_avatar/flutter_advanced_avatar.dart';
import 'package:get/get.dart';
import 'package:whatsapp/listes/listchats.dart';
import 'package:whatsapp/view/screen/widget/popbutwidget.dart';
import 'package:whatsapp/listes/liststatus.dart';

import 'widget/storywidget.dart';

class status extends StatelessWidget {
  const status({Key? key}) : super(key: key);

  @override
  // ignore: dead_code
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    return Column(children: [
      ListTile(
        title: const Text(
          "My Status",
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        subtitle:const Text("Tap to add"),
        leading:const Icon(
          Icons.person_pin,
          color: Colors.grey,
          size: 50,
        ),
        trailing: popbutwidget(
          firsttext:const Text("add staute"),
          sectext:const Text("Delete status"),
          thtext:const Text("show my status"),
          fourtext:const Text("Hide"),
        
          ),
        ),
      
    
    
    Container(
      padding: EdgeInsets.all(5),
      height: 30,
      color: Color(0xffeBeae9),
      width: double.infinity,
      child:const Text(
        "Recent Updates",
        style: TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.bold,
            color: Color(0xff075e54)),
      ),
    ),
    Container(
      height: height * 0.72,
      child: ListView.builder(
          itemCount: liststatus.length,
          itemBuilder: (context, i) {
            return ListTile(
              onTap: () {
                Get.to(storywidget(
                  url: liststatus[i].image,
                  username: liststatus[i].name,
                ));
              },
              title: Text(
                liststatus[i].name,
                style:const TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
              subtitle: Text(liststatus[i].time),
              leading: AdvancedAvatar(
                foregroundDecoration: BoxDecoration(
                    shape: BoxShape.circle,
                    border: Border.all(color: Colors.blue.shade400, width: 3)),
                size: 55,
                image: NetworkImage(liststatus[i].image),
              ),
            );
          }),
    ),
    ]
    );
  }
}
