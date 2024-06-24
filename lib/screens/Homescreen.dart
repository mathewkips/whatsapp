// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables
import 'package:flutter/material.dart';
import 'package:whatsap/Page/ChatPage.dart';

class Homescreen extends StatefulWidget {
  const Homescreen({super.key});

  @override
  State<Homescreen> createState() => _HomescreenState();
}

class _HomescreenState extends State<Homescreen>
    with SingleTickerProviderStateMixin {
  late TabController _controller;

  @override
  void initState() {
    super.initState();

    _controller = TabController(length: 4, vsync: this, initialIndex: 0);
  }

  @override
  Widget build(BuildContext context) {
    // ignore: unused_local_variable
    //MediaQueryData mediaQuery=MediaQuery.of(context);

    return Scaffold(
      appBar: AppBar(
        title: Text("Whatsapp Clone"),
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
                  value: "New group",
                  child: Text("New group"),
                ),
                PopupMenuItem(
                  value: "New broadcast",
                  child: Text("New broadcast"),
                ),
                PopupMenuItem(
                  value: "Whatsapweb",
                  child: Text("Whatsapweb"),
                ),
                PopupMenuItem(
                  value: "Starred message",
                  child: Text("Starred message"),
                ),
                PopupMenuItem(
                  value: "Settings",
                  child: Text("Settings"),
                ),
              ];
            },
          ),
        ],
        bottom: TabBar(
          controller: _controller,
          tabs: [
            Tab(
              icon: Icon(Icons.camera_alt),
            ),
            Tab(
              text: "CHATS",
            ),
            Tab(
              text: "STATUS",
            ),
            Tab(
              text: "CALLS",
            ),
          ],
        ),
      ),
      body: TabBarView(
        controller: _controller,
        children: [
          Text("Camera"),
          ChatPage(),
          Text("Status"),
          Text("Calls"),
        ],
      ),
    );
  }
}
// import 'package:flutter/material.dart';
// import 'package:whatsap/Page/ChatPage.dart';

// class Homescreen extends StatefulWidget {
//   const Homescreen({super.key});

//   @override
//   State<Homescreen> createState() => _HomescreenState();
// }

// class _HomescreenState extends State<Homescreen>
//     with SingleTickerProviderStateMixin {
//   late TabController _controller;
//   @override
//   void initState() {
//     super.initState();

//     _controller = TabController(length: 4, vsync: this, initialIndex: 0);
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text("Whatsapp Clone"),
//         actions: [
//           IconButton(
//             icon: Icon(Icons.search),
//             onPressed: () {},
//           ),
//           PopupMenuButton<String>(onSelected: (value) {
//             print(value);
//           }, itemBuilder: (BuildContext context) {
//             return [
//               PopupMenuItem(
//                 value: "New group",
//                 child: Text("New group"),
//               ),
//               PopupMenuItem(
//                 value: "New broadcast",
//                 child: Text("New broadcast"),
//               ),
//               PopupMenuItem(
//                 value: "Whatsapweb",
//                 child: Text("Whatsapweb"),
//               ),
//               PopupMenuItem(
//                 value: "Starred message",
//                 child: Text("Starred message"),
//               ),
//               PopupMenuItem(
//                 value: "Settings",
//                 child: Text("Settings"),
//               ),
//             ];
//           })
//         ],
//         bottom: TabBar(
//           controller: _controller,
//           tabs: [
//             Tab(
//               icon: Icon(Icons.camera_alt),
//             ),
//             Tab(
//               text: "CHATS",
//             ),
//             Tab(
//               text: "STATUS",
//             ),
//             Tab(
//               text: "CALLS",
//             ),
//           ],
//         ),
//       ),
//       body: TabBarView(
//         controller: _controller,
//         children: [
//           Text("Camera"),
//           ChatPage(),
//           Text("Status"),
//           Text("Calls"),
//         ],
//       ),
//     );
//   }
// }
