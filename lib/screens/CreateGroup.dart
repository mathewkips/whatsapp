// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:whatsap/CustomUI/ContactsCard.dart';
import 'package:whatsap/Model/ChatModel.dart';

class Creategroup extends StatefulWidget {
  const Creategroup({super.key});

  @override
  State<Creategroup> createState() => _CreategroupState();
}

class _CreategroupState extends State<Creategroup> {
  List<ChatModel> contacts = [
    ChatModel(
      name: "Mathew",
      Status: "Flutter",
      select: false,
    ),
    ChatModel(
      name: "Mesh",
      Status: "Android",
      select: false,
    ),
    ChatModel(
      name: "Enock",
      Status: "PHP",
      select: false,
    ),
    ChatModel(
      name: "Chesaina",
      Status: "Kiplimo@123",
      select: false,
    ),
    ChatModel(
      name: "Avin",
      Status: "Feels goood",
      select: false,
    ),
    ChatModel(
      name: "Isak",
      Status: "futbal",
      select: false,
    ),
    ChatModel(
      name: "Millie",
      Status: "Fullstack",
      select: false,
    ),
    ChatModel(
      name: "Anty",
      Status: "Busy ant",
      select: false,
    ),
    ChatModel(
      name: "Nimrod",
      Status: "Whatsap only",
      select: false,
    ),
    ChatModel(
      name: "neto",
      Status: "Sleeping",
      select: false,
    ),
  ];
  List<ChatModel> groups = [];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Column(
          children: [
            Text(
              "New group",
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 19,
              ),
            ),
            Text(
              "Add members",
              style: TextStyle(
                fontSize: 13,
              ),
            )
          ],
        ),
        actions: [
          IconButton(
            icon: Icon(Icons.search),
            onPressed: () {},
          ),
        ],
      ),
      body: ListView.builder(
          itemCount: contacts.length,
          itemBuilder: (context, index) {
            return InkWell(
              onTap: () {
                if (contacts[index].select == false) {
                  setState(() {
                    contacts[index].select == true;
                    groups.add(contacts[index]);
                  });
                } else {
                  setState(() {
                    contacts[index].select == false;
                    groups.remove(contacts[index]);
                  });
                }
              },
              child: Contactscard(
                contact: contacts[index],
              ),
            );
          }),
    );
  }
}
