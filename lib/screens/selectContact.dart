// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:whatsap/CustomUI/ButtonCard.dart';
import 'package:whatsap/CustomUI/ContactsCard.dart';
import 'package:whatsap/Model/ChatModel.dart';
import 'package:whatsap/screens/CreateGroup.dart';

class Selectcontact extends StatefulWidget {
  const Selectcontact({super.key});

  @override
  State<Selectcontact> createState() => _SelectcontactState();
}

class _SelectcontactState extends State<Selectcontact> {
  @override
  Widget build(BuildContext context) {
    List<ChatModel> contacts = [
      ChatModel(
        name: "Cole ",
        Status: "Flutter",
        select: false,
      ),
      ChatModel(
        name: "Misha",
        Status: "Android",
        select: false,
      ),
      ChatModel(
        name: "Carney",
        Status: "PHP",
        select: false,
      ),
      ChatModel(
        name: "Nkunku",
        Status: "Kiplimo@123",
        select: false,
      ),
      ChatModel(
        name: "Raheem",
        Status: "Feels goood",
        select: false,
      ),
      ChatModel(
        name: "Jackson",
        Status: "futbal",
        select: false,
      ),
      ChatModel(
        name: "Gusto malo",
        Status: "Fullstack",
        select: false,
      ),
      ChatModel(
        name: "Ben chilly",
        Status: "Busy ant",
        select: false,
      ),
      ChatModel(
        name: "Enzo fernandez",
        Status: "Whatsap only",
        select: false,
      ),
      ChatModel(
        name: "conor",
        Status: "Sleeping",
        select: false,
      ),
    ];

    return Scaffold(
      appBar: AppBar(
        title: Column(
          children: [
            Text(
              "Select contact",
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 19,
              ),
            ),
            Text(
              "257 contacts",
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
          PopupMenuButton<String>(
            onSelected: (value) {
              print(value);
            },
            itemBuilder: (BuildContext context) {
              return [
                PopupMenuItem(
                  value: "Invite a friend ",
                  child: Text("Invite a friend "),
                ),
                PopupMenuItem(
                  value: "Contacts",
                  child: Text("Contacts"),
                ),
                PopupMenuItem(
                  value: "Refresh",
                  child: Text("Refresh"),
                ),
                PopupMenuItem(
                  value: "Help",
                  child: Text("Help"),
                ),
              ];
            },
          ),
        ],
      ),
      body: ListView.builder(
          itemCount: contacts.length + 2,
          itemBuilder: (context, index) {
            if (index == 0) {
              return InkWell(
                onTap: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => Creategroup()));
                },
                child: Buttoncard(
                  icon: Icons.group_add,
                  name: "New Group",
                ),
              );
            }
            if (index == 1) {
              return Buttoncard(
                icon: Icons.person_add,
                name: "New Contact",
              );
            } else {
              return Contactscard(
                contact: contacts[index - 2],
              );
            }
          }),
    );
  }
}
