// ignore_for_file: prefer_const_constructors, deprecated_member_use, sort_child_properties_last, use_super_parameters

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:whatsap/Model/ChatModel.dart';

class Contactscard extends StatelessWidget {
  const Contactscard({super.key, required this.contact});
  final ChatModel contact;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: SizedBox(
        height: 50,
        width: 50,
        child: Stack(
          children: [
            CircleAvatar(
              radius: 23,
              child: SvgPicture.asset(
                "assets/person.svg",
                color: Colors.white,
                width: 30,
                height: 30,
              ),
              backgroundColor: Colors.blueGrey[300],
            ),
            Positioned(
              right: 4,
              bottom: 5,
              child: CircleAvatar(
                backgroundColor: Colors.teal,
                radius: 11,
                child: Icon(
                  Icons.check,
                  color: Colors.white,
                  size: 18,
                ),
              ),
            )
          ],
        ),
      ),
      title: Text(
        contact!.name,
        style: TextStyle(
          fontSize: 15,
          fontWeight: FontWeight.bold,
        ),
      ),
      subtitle: Text(
        contact!.Status,
        style: TextStyle(
          fontSize: 13,
        ),
      ),
    );
  }
}
