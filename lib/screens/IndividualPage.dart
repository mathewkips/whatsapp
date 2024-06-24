// ignore_for_file: prefer_const_constructors, deprecated_member_use, sort_child_properties_last, avoid_unnecessary_containers, unused_label, prefer_const_literals_to_create_immutables, sized_box_for_whitespace

import 'package:emoji_picker_flutter/emoji_picker_flutter.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../Model/ChatModel.dart';

class IndividualPage extends StatefulWidget {
  const IndividualPage({super.key, required this.chatModel});
  final ChatModel chatModel;

  @override
  State<IndividualPage> createState() => _IndividualPageState();
}

class _IndividualPageState extends State<IndividualPage> {
  bool show = false;
  FocusNode focusNode = FocusNode();
  final TextEditingController _controller = TextEditingController();
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    focusNode.addListener(() {
      if (focusNode.hasFocus) {
        setState(() {
          show = false;
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blueGrey,
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(60),
        child: AppBar(
          leadingWidth: 70,
          titleSpacing: 0,
          leading: InkWell(
            onTap: () {
              Navigator.pop(context);
            },
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  Icons.arrow_back,
                  size: 24,
                ),
                CircleAvatar(
                  child: SvgPicture.asset(
                    widget.chatModel.isGroup
                        ? "assets/groups.svg"
                        : "assets/person.svg",
                    color: Colors.white,
                    height: 38,
                    width: 38,
                  ),
                  radius: 20,
                  backgroundColor: Colors.blueGrey,
                ),
              ],
            ),
          ),
          title: InkWell(
            onTap: () {},
            child: Container(
              margin: EdgeInsets.all(6),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    widget.chatModel.name,
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    "Last seen today 3:26 pm",
                    style: TextStyle(
                      fontSize: 13,
                    ),
                  )
                ],
              ),
            ),
          ),
          actions: [
            IconButton(
              icon: Icon(Icons.videocam),
              onPressed: () {},
            ),
            IconButton(
              icon: Icon(Icons.call),
              onPressed: () {},
            ),
            PopupMenuButton<String>(
              onSelected: (value) {
                print(value);
              },
              itemBuilder: (BuildContext context) {
                return [
                  PopupMenuItem(
                    value: "View contact",
                    child: Text("View contact"),
                  ),
                  PopupMenuItem(
                    value: "Media,Links, and docs",
                    child: Text("Media,Links, and docs"),
                  ),
                  PopupMenuItem(
                    value: "Search",
                    child: Text("Search"),
                  ),
                  PopupMenuItem(
                    value: "Mute notifications",
                    child: Text("Mute notifications"),
                  ),
                  PopupMenuItem(
                    value: "Dissapearing messages",
                    child: Text("Dissapearing messages"),
                  ),
                  PopupMenuItem(
                    value: "WallPaper",
                    child: Text("Wallpaper"),
                  ),
                ];
              },
            ),
          ],
        ),
      ),
      body: Container(
        //remove here
        child: Container(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          child: WillPopScope(
            child: Stack(
              children: [
                ListView(),
                Align(
                  alignment: Alignment.bottomCenter,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Row(
                        children: [
                          Container(
                            width: MediaQuery.of(context).size.width - 60,
                            child: Card(
                              margin:
                                  EdgeInsets.only(left: 2, right: 2, bottom: 8),
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(25)),
                              child: TextFormField(
                                controller: _controller,
                                focusNode: focusNode,
                                textAlignVertical: TextAlignVertical.center,
                                keyboardType: TextInputType.multiline,
                                maxLines: 5,
                                minLines: 1,
                                decoration: InputDecoration(
                                    border: InputBorder.none,
                                    hintText: "Message",
                                    contentPadding: EdgeInsets.all(5),
                                    prefixIcon: IconButton(
                                      icon: Icon(
                                        Icons.emoji_emotions,
                                      ),
                                      onPressed: (() {
                                        focusNode.unfocus();
                                        focusNode.canRequestFocus = false;

                                        setState(() {
                                          show = !show;
                                        });
                                      }),
                                    ),
                                    suffixIcon: Row(
                                      mainAxisSize: MainAxisSize.min,
                                      children: [
                                        IconButton(
                                          icon: Icon(Icons.attach_file),
                                          onPressed: (() {
                                            showModalBottomSheet(
                                                backgroundColor:
                                                    Colors.transparent,
                                                context: context,
                                                builder: (builder) =>
                                                    bottomSheet());
                                          }),
                                        ),
                                        IconButton(
                                          icon: Icon(Icons.camera_alt),
                                          onPressed: (() {}),
                                        ),
                                      ],
                                    )),
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(
                              bottom: 8,
                              right: 5,
                              left: 2,
                            ),
                            child: CircleAvatar(
                              radius: 25,
                              backgroundColor: Color(0xFF128C7E),
                              child: IconButton(
                                icon: Icon(
                                  Icons.mic,
                                  color: Colors.white,
                                ),
                                onPressed: () {},
                              ),
                            ),
                          ),
                        ],
                      ),
                      show ? emojiSelect() : Container(),
                    ],
                  ),
                ),
              ],
            ),
            onWillPop: () {
              if (show) {
                setState(() {
                  show = false;
                });
                // return false;
              } else {
                Navigator.pop(context);
              }
              return Future.value(false);
            },
          ),
        ),
      ),
    );
  }

  Widget bottomSheet() {
    return Container(
        height: 280,
        width: MediaQuery.of(context).size.width,
        child: Card(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 20),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    iconCreation(
                        Icons.insert_drive_file, Colors.indigo, "Documents"),
                    SizedBox(
                      width: 40,
                    ),
                    iconCreation(Icons.camera_alt, Colors.pink, "Camera"),
                    SizedBox(
                      width: 40,
                    ),
                    iconCreation(Icons.insert_photo, Colors.purple, "Gallery"),
                  ],
                ),
                SizedBox(
                  height: 30,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    iconCreation(Icons.headset, Colors.orange, "Audio"),
                    SizedBox(
                      width: 40,
                    ),
                    iconCreation(Icons.location_pin, Colors.teal, "Location"),
                    SizedBox(
                      width: 40,
                    ),
                    iconCreation(Icons.person, Colors.blue, "Contacts"),
                  ],
                ),
              ],
            ),
          ),
        ));
  }

  Widget iconCreation(IconData icon, Color color, String text) {
    return InkWell(
      onTap: () {},
      child: Column(
        children: [
          CircleAvatar(
            radius: 25,
            backgroundColor: color,
            child: Icon(
              icon,
              size: 29,
              color: Colors.white,
            ),
          ),
          SizedBox(
            height: 5,
          ),
          Text(
            text,
            style: TextStyle(
              fontSize: 12,
            ),
          ),
        ],
      ),
    );
  }

  Widget emojiSelect() {
    rows:
    4;
    columns:
    7;
    return EmojiPicker(onEmojiSelected: (category, emoji) {
      setState(() {
        _controller.text = _controller.text + emoji.emoji;
      });
    });
  }
}
