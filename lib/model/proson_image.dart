import 'package:flutter/cupertino.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

// ignore: camel_case_types, must_be_immutable
class personImage extends StatelessWidget {
  personImage(
      {Key? key,
      required this.height,
      required this.imageUrl,
      required this.width,})
      : super(key: key);
  late String imageUrl;
  late double width;
  late double height;
  
  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      width: width,
      
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(30),
          image: DecorationImage(
              image: NetworkImage(
                imageUrl,
              ),
              fit: BoxFit.cover)
            
              ),
    );
  }
}
