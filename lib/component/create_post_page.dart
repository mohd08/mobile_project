import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:web_socket_channel/web_socket_channel.dart';


class CreatePage extends StatelessWidget {
  CreatePage({Key? key}) : super(key: key);

  final textTitle = TextEditingController();
  final textDescription = TextEditingController();
  final textURL = TextEditingController();

  final getAPI = WebSocketChannel.connect(Uri.parse('ws://besquare-demo.herokuapp.com'));

    //create post
  void _getToPost(String title, String description, String image) {
    getAPI.sink.add(
        '{"type": "create_post", "data": {"title": "$title", "description": "$description", "image": "$image"}}');
  }

  @override
    Widget build(BuildContext context) {
      return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.purpleAccent,
          title: const Text('Doppelganger Instagram'),
        ),
        body: Center (
          child: ListView(
            padding: const EdgeInsets.all(8),
            children: <Widget>[
              const SizedBox(height: 20),
              
              const Text("Title :"),
              TextField(
                keyboardType: TextInputType.multiline,
                maxLines: null,
                controller: textTitle,
                decoration: const InputDecoration(
                  // contentPadding: EdgeInsets.symmetric(vertical: 10.0),
                  border: OutlineInputBorder(),
                  labelText: "Title",
                  floatingLabelBehavior: FloatingLabelBehavior.never,
                ),
              ),

              const SizedBox(height: 20),

              const Text("Description :"),
              Container(
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.black38),
                  borderRadius: const BorderRadius.all(Radius.circular(2)),
                ),
                width: 100,
                height: 200,
                child: TextField(
                  keyboardType: TextInputType.multiline,
                  maxLines: null,
                  controller: textDescription,
                  decoration: const InputDecoration(
                    contentPadding: EdgeInsets.symmetric(horizontal: 16),
                    border: InputBorder.none,
                    labelText: "Description",
                    floatingLabelBehavior: FloatingLabelBehavior.never,
                  ),
                ),
              ),

              const SizedBox(height: 20),

              const Text("Image URL :"),
              TextField(
                keyboardType: TextInputType.multiline,
                maxLines: null,
                controller: textURL,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: "link URL",
                  floatingLabelBehavior: FloatingLabelBehavior.never,
                ),
              ),

              const SizedBox(height: 20),

              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  ElevatedButton(
                    child: const Text('Create Post'),
                    onPressed: () {
                      String title = (textTitle.toString());
                      String description = (textDescription.toString());
                      String image = (textURL.toString());
                      _getToPost(title, description, image);
                      _showDialog(context);
                    },
                    style: ElevatedButton.styleFrom(
                      primary: Colors.pink,
                      fixedSize: const Size(150, 50),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30)
                      )
                    ),
                  ),

                  ElevatedButton(
                    child: const Text('Delete'),
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                      primary: Colors.pink,
                      fixedSize: const Size(150, 50),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30)
                      )
                    ),
                  ),
                ],
              ),
            ],
          )
        )
      );
    }
}

void _showDialog(BuildContext context) {
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        title: const Text("Notification"),
        content: const Text("Done upload the image"),
        actions: <Widget>[
          TextButton(
            child: const Text("Thank you"),
            onPressed: () {
              Navigator.of(context).pop();
            },
          ),
        ],
      );
    },
  );
}