import 'package:flutter/material.dart';

class ChatPage extends StatefulWidget {
  ChatPage({Key key, this.title}) : super(key: key);

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  _ChatPageState createState() => _ChatPageState();
}

class _ChatPageState extends State<ChatPage> {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
        backgroundColor: Colors.grey[100],
        appBar: AppBar(
          backgroundColor: Colors.white,
          title: Text(
            "${widget.title}",
            style: TextStyle(
                color: Colors.black, fontWeight: FontWeight.w700, fontSize: 30),
          ),
          centerTitle: false,
          actions: <Widget>[
            Row(children: [
              new IconButton(
                icon: Image.asset("assets/images/icon_chat_invite.png"),
                onPressed: () {},
              ),
              Text(
                "INVAITE FRIENDS",
                style: TextStyle(color: Colors.black),
              )
            ]),
          ],
        ),
        body: ListView.builder(
            itemCount: mockList.length,
            itemBuilder: (BuildContext ctxt, int index) {
              return _buildListItem(mockList[index]);
            }));
  }

  List<MockListItem> mockList = [
    MockListItem(
        title: "Alice",
        tags: ["Intellectual disability", "Hemiparesis", "Anxiety disorder"],
        imagePath: "assets/images/mock/1.png",
        msgList: [
          ChatMessage(
              message: "How are you?",
              status: ChatMessageStatus.NOT_READ,
              isMy: true)
        ],
        countNotRead: 0),
    MockListItem(
        title: "Megan",
        tags: ["Hemiparesis", "Intellectual disability"],
        imagePath: "assets/images/mock/2.png",
        msgList: [
          ChatMessage(
              message: "%[cleap]%", status: ChatMessageStatus.READ, isMy: true)
        ],
        countNotRead: 0),
    MockListItem(
        title: "Amber",
        tags: ["Traumatic brain injury", "PTSD"],
        imagePath: "assets/images/mock/3.png",
        msgList: [
          ChatMessage(
              message: "That would be AMAZING!!",
              status: ChatMessageStatus.READ,
              isMy: false)
        ],
        countNotRead: 0),
    MockListItem(
        title: "Susie",
        tags: ["Intellectual disability", "Epilepsy"],
        imagePath: "assets/images/mock/4.png",
        msgList: [
          ChatMessage(
              message:
                  "See you on Friday! I hope it's all ok and long message to show",
              status: ChatMessageStatus.NOT_READ,
              isMy: false)
        ],
        countNotRead: 200),
    MockListItem(
        title: "Alice",
        tags: ["Down Syndrome, Autism…"],
        imagePath: "assets/images/mock/5.png",
        msgList: [
          ChatMessage(
              message: "See you on Friday! I hope it's...",
              status: ChatMessageStatus.NOT_READ,
              isMy: false)
        ],
        countNotRead: 2),
  ];

  Widget _buildListItem(MockListItem mockList) {
    return Row(
      children: [
        Image.asset(mockList.imagePath),
        Column(
          children: [
            Text(mockList.title),
            Text(mockList.tags.join(", ")),
            Text(mockList.msgList.last.isMy
                ? "You:"
                : "" + mockList.msgList.last.message)
          ],
        ),
      ],
    );
  }
}

class MockListItem {
  String title;
  List<String> tags;
  String imagePath;
  List<ChatMessage> msgList;
  int countNotRead;

  MockListItem(
      {this.title, this.tags, this.imagePath, this.msgList, this.countNotRead});
}

class ChatMessage {
  String message;
  ChatMessageStatus status;
  bool isMy;
  DateTime timestamp;
  ChatMessage({this.message, this.status, this.isMy});
}

enum ChatMessageStatus { NOT_READ, READ }
