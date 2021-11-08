import 'package:flutter/material.dart';

import 'like_page.dart';

class DetailPage extends StatefulWidget {
  DetailPage({required this.data
  , Key? key}) : super(key: key);
  final dynamic data;

  @override
  State<DetailPage> createState() => _DetailPage(this.data);
}

class _DetailPage extends State<DetailPage>{
  _DetailPage(this.data);
  final dynamic data;

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
              Text(data["title"],
                  style: TextStyle(fontSize: 27, fontWeight: FontWeight.bold)),

              const SizedBox(height: 5),

              Text(data["date"],
                  style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold)),

              Container(
                height: 200,
                width: 200,
                child: Image.network("${data["image"]}"),
              ),

              const SizedBox(height: 5),

              Text(data["description"],
              style: TextStyle(fontSize: 20)),
            ],
          )
        ),

        bottomNavigationBar: BottomAppBar(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              IconButton(icon: const Icon(Icons.home), 
                          onPressed: () {
                            // Navigator.push(
                            // context,
                            // MaterialPageRoute(builder: (context) => PostPage(postchannel:)));
                          }
                        ),
              // const Spacer(),
              IconButton(icon: Image.asset('assets/images/heart.png'),
                          iconSize: 8,
                          onPressed: () {
                            Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => LikePage()));
                          }
                        ),
            ],
          ),
        ),
      );
    }
}
