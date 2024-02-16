import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/material.dart';
import 'package:flutter_advanced_avatar/flutter_advanced_avatar.dart';

class profilescreen extends StatelessWidget {
  const profilescreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("profile")),
      body: Column(children: [
       const Padding(
          padding:  EdgeInsets.all(8.0),
          child: Center(
            child: AdvancedAvatar(
              size: 160,
              image:NetworkImage("https://img.kuaiicai.com/agent_avatar/avatar-204.png")),
          ),
        ),
        ListTile(title:const Text("Name"),
        subtitle:const Text("Dheya"),
        leading:const Icon(Icons.person) ,
        trailing: IconButton(onPressed: (){},
        icon:const Icon(Icons.edit),
        ),
        ),
        ListTile(title:const Text("About"),
        subtitle:const Text("one eday,i will did it"),
        leading:const Icon(Icons.info) ,
        trailing: IconButton(onPressed: (){},
        icon:const Icon(Icons.edit),
        ),
        ),
        ListTile(title:const Text("phone"),
        subtitle:const Text("+967 715923011"),
        leading:const Icon(Icons.phone) ,
        trailing: IconButton(onPressed: (){},
        icon:const Icon(Icons.edit),
        ),
        ),
      ]),
    );
  }
}
