// ignore_for_file: non_constant_identifier_names

class ChatModel {
  String name;
  String icon;
  bool isGroup;
  String time;
  String currentMessage;
  String Status;
  bool select;

  ChatModel({
    this.name = '',
    this.icon = '',
    this.isGroup = false,
    this.time = '',
    this.currentMessage = '',
    this.Status = '',
    this.select = false,
  });
}
