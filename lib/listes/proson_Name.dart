import 'package:flutter/material.dart';

class personName extends StatelessWidget {
   personName({Key? key,required this.personNam}) : super(key: key);
late String personNam;
  @override
  Widget build(BuildContext context) {
    return Text(personNam,overflow: TextOverflow.ellipsis,);
  }
}
