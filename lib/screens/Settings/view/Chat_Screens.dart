import 'dart:io';
import 'package:adrox/core/utility/Custom_Appbar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class ChatScreens extends StatefulWidget {
  const ChatScreens({super.key});
  @override
  _ChatScreensState createState() => _ChatScreensState();
}

class _ChatScreensState extends State<ChatScreens> {
  final TextEditingController _messageController = TextEditingController();
  List<MessageModel> _messages = [];

  File? _selectedImage;

  String formatteddate = '';

  final ImagePicker _picker = ImagePicker();

  Future<void> _pickImage() async {
    final XFile? image = await _picker.pickImage(source: ImageSource.gallery);
    if (image != null) {
      if (image.path.endsWith('.png') || image.path.endsWith('.jpg')
          // image.path.endsWith('.jpeg')
          ) {
        setState(() {
          _selectedImage = File(image.path);
        });
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Only PNG and JPG formats are supported')),
        );
      }
    }
  }

  @override
  void initState() {
    super.initState();
    _messages = [
      MessageModel(message: "Hello!", time: "10:31 AM", myMessage: false),
      MessageModel(
        message: "Hi! How are you?",
        time: "10:30 AM",
        myMessage: true,
      ),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CommonAppBar(title: 'Chat With Support', usePaddedLeading: true),
      body: SafeArea(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 20.0,
                vertical: 15,
              ),
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Padding(
                  padding: const EdgeInsets.only(
                    right: 15,
                    top: 15,
                    bottom: 15,
                    left: 15,
                  ),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Transaction Failed due to some reason, i don’t ...' ??
                                  "No Subject",
                              style: const TextStyle(
                                fontFamily: 'Mulish',
                                fontSize: 13,
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                            const SizedBox(height: 10),
                            Text(
                              "Created on 27.03.25",
                              style: TextStyle(
                                fontSize: 12,
                                color: Colors.black.withOpacity(0.3),
                              ),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(width: 15),
                      Container(
                        height: 75,
                        width: 58,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(12),
                          color: Colors.red.withOpacity(0.1),
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(
                              Icons.close_rounded,
                              color: Colors.red.withOpacity(0.6),
                              weight: 1000,
                            ),
                            const SizedBox(height: 5),
                            Text(
                              "Close\nTicket",
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                fontSize: 10,
                                color: Colors.red.withOpacity(0.6),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            SizedBox(height: 5),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: ListView.builder(
                  reverse: true,
                  itemCount: _messages.length,
                  itemBuilder: (context, index) {
                    final msg = _messages[index];
                    final bool isUser = msg.myMessage ?? false;
                    // String formattedTime = msg.time != null
                    //     ? DateFormat('hh:mm a')
                    //         .format(DateTime.parse(msg.time!))
                    //     : ' ';
                    String? formattedTime = msg.time;
                    return Padding(
                      padding: const EdgeInsets.symmetric(
                        vertical: 4.0,
                        horizontal: 10,
                      ),
                      child: Row(
                        mainAxisAlignment: isUser
                            ? MainAxisAlignment.end
                            : MainAxisAlignment.start,
                        children: [
                          ConstrainedBox(
                            constraints: BoxConstraints(
                              maxWidth: MediaQuery.of(context).size.width * 0.7,
                              minWidth: 50,
                            ),
                            child: IntrinsicWidth(
                              child: DecoratedBox(
                                decoration: BoxDecoration(
                                  color: isUser
                                      ? const Color(0XFFFFFFFF)
                                      : const Color(0XFF10213C),
                                  borderRadius: BorderRadius.only(
                                    topLeft: const Radius.circular(13),
                                    topRight: const Radius.circular(13),
                                    bottomLeft: isUser
                                        ? const Radius.circular(13)
                                        : Radius.zero,
                                    bottomRight: isUser
                                        ? Radius.zero
                                        : const Radius.circular(13),
                                  ),
                                ),
                                child: Padding(
                                  padding: const EdgeInsets.all(13),
                                  child: Column(
                                    crossAxisAlignment: isUser
                                        ? CrossAxisAlignment.end
                                        : CrossAxisAlignment.start,
                                    children: [
                                      if (msg.files != null &&
                                          msg.files!.isNotEmpty)
                                        Padding(
                                          padding: const EdgeInsets.symmetric(
                                            vertical: 8.0,
                                          ),
                                          child: Image.network(
                                            msg.files!,
                                            width: 200,
                                            height: 200,
                                            fit: BoxFit.cover,
                                          ),
                                        ),
                                      if (msg.message != null)
                                        Text(
                                          msg.message!,
                                          style: TextStyle(
                                            color: isUser
                                                ? Colors.black
                                                : Colors.white,
                                            fontSize: 14,
                                          ),
                                          softWrap: true,
                                        ),
                                      SizedBox(height: 5),
                                      Align(
                                        alignment: Alignment.bottomLeft,
                                        child: Text(
                                          formattedTime ?? '',
                                          style: TextStyle(
                                            color: isUser
                                                ? Colors.black
                                                : Colors.white,
                                            fontSize: 8,
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    );
                  },
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
              child: Container(
                height: 60,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(30),
                ),
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10.0),
                  child: Row(
                    children: [
                      Expanded(
                        child: TextField(
                          maxLines: null,
                          controller: _messageController,
                          decoration: const InputDecoration(
                            border: InputBorder.none,
                            contentPadding: EdgeInsets.symmetric(
                              horizontal: 20,
                            ),
                            hintText: 'Say hii!',
                            hintStyle: TextStyle(color: Color(0xff919199)),
                          ),
                        ),
                      ),
                      IconButton(
                        onPressed: () {
                          _pickImage();
                        },
                        icon: Icon(
                          Icons.cloud_upload,
                          size: 30,
                          color: Color(0xff959595),
                        ),
                      ),
                      const SizedBox(width: 5),
                      Container(
                        height: 45,
                        width: 45,
                        decoration: BoxDecoration(
                          color: Color(0xff3F5FF2),
                          borderRadius: BorderRadius.circular(30),
                        ),
                        child: IconButton(
                          icon: const Icon(Icons.send, color: Colors.white),
                          onPressed: () {},
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class MessageModel {
  final String? message;
  final String? files;
  final String? time;
  final bool? myMessage;

  MessageModel({this.message, this.files, this.time, this.myMessage});
}
