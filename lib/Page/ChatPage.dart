// ignore_for_file: prefer_const_constructors, unused_import

import 'package:flutter/material.dart';
import 'package:whatsap/CustomUI/CustomCard.dart';
import 'package:whatsap/Model/ChatModel.dart';
import 'package:whatsap/Page/ChatPage.dart';
import 'package:whatsap/screens/selectContact.dart';

class ChatPage extends StatefulWidget {
  const ChatPage({super.key});

  @override
  State<ChatPage> createState() => _ChatPageState();
}

class _ChatPageState extends State<ChatPage> {
  List<ChatModel> chats = [
    ChatModel(
      name: "Mathew",
      icon: "person.svg",
      isGroup: false,
      time: "4:37 pm",
      currentMessage: "Hi Babyboy",
    ),
    ChatModel(
      name: "Milly",
      icon: "person.svg",
      isGroup: false,
      time: "4:46 pm",
      currentMessage: "Hi Milly",
    ),
    ChatModel(
      name: "Sizzy",
      icon: "person.svg",
      isGroup: false,
      time: "4:27 pm",
      currentMessage: "Hi Sizzy,, how is mummy",
    ),
    ChatModel(
      name: "BBIT MMU",
      icon: "groups.svg",
      isGroup: true,
      time: "10:37 am",
      currentMessage: "Hi Classies, its me",
    ),
    ChatModel(
      name: "Dev server chat",
      icon: "groups.svg",
      isGroup: true,
      time: "11:37 pm",
      currentMessage: "Hi developers, see yah",
    ),
    ChatModel(
      name: "St josheps alumini",
      icon: "groups.svg",
      isGroup: true,
      time: "11:37 pm",
      currentMessage: "Hi friends, its mathew",
    ),
    ChatModel(
      name: "Mum",
      icon: "person.svg",
      isGroup: false,
      time: "10:46 pm",
      currentMessage: "Hi son,",
    ),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.chat),
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => Selectcontact(),
            ),
          );
        },
      ),
      body: ListView.builder(
        itemCount: chats.length,
        itemBuilder: (context, index) => CustomCard(
          chatModel: chats[index],
        ),
      ),
    );
  }
}
