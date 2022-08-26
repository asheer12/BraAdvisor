import 'package:flutter/material.dart';



class Customcard extends StatelessWidget {
  final Color cardcolor;
  final Widget cardchild;
  final double? width;
  final double? height;
  Customcard({required this.cardchild,required this.cardcolor,required this.height,required this.width});
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height,
      width: width,
      child:Container(
        margin: const EdgeInsets.all(10),
        decoration: BoxDecoration(
            color: cardcolor,
            borderRadius: BorderRadius.circular(10),
            boxShadow: [
              BoxShadow(
                color: Colors.black87.withOpacity(0.5),
                spreadRadius: 3,
                blurRadius: 8,
              ),
            ]
        ),
        child: cardchild,
      ),
    );
  }
}
