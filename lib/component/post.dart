import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:mobile_project/component/like_page.dart';
import 'package:mobile_project/component/post_details_page.dart';
import 'package:web_socket_channel/web_socket_channel.dart';

import 'create_post_page.dart';

class PostPage extends StatefulWidget {
  PostPage({required this.postchannel,Key? key}) : super(key: key);
  final WebSocketChannel postchannel;

  @override
  State<PostPage> createState() => _PostPageState(this.postchannel);
}

class _PostPageState extends State<PostPage> {
  _PostPageState(this.postchannel);
  WebSocketChannel postchannel;

  List post=[];
  List favPost =[];
  int currentPost= 10;


  @override
  initState() {
    super.initState();

    postchannel.stream.listen((message) {
    final decodedMessage = jsonDecode(message);
    if (decodedMessage['type'] == 'all_posts') {
      post = decodedMessage['data']['posts'];
      }
      setState(() {});
    });
    _getPostResponse();
  }

    void _getPostResponse() {
    postchannel.sink.add('{"type": "get_posts"}');
  }

  void onUnfavourite(id){
    setState(() {
      favPost = favPost.where((i) => i != id).toList();
    });
  }

  void onFavourite(id){
    setState(() {
      favPost.add(id);
    });
  }

  @override
    Widget build(BuildContext context) {
      List newcard = post.reversed.toList();
      return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.purpleAccent,
          title: const Text('Doppelganger Instagram'),
        ),
        body: Center (
          child: Column(
            children: <Widget> [
              Row(
                children: [
                  IconButton(
                    icon: Image.asset('assets/images/settings.png'),
                    iconSize: 3,
                    onPressed: () {},
                  ),

                  Expanded(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        IconButton(
                          alignment: Alignment.topRight,
                          icon: Image.asset('assets/images/sort.png'),
                          iconSize: 3,
                          onPressed: () {},
                        ),
                      ],
                    ),
                  ),
                ],
              ),

              Expanded(
                child: SingleChildScrollView(
                  child: ListView.builder(
                    physics: BouncingScrollPhysics(),
                    scrollDirection: Axis.vertical,
                    shrinkWrap: true,
                    itemCount: post.length,
                    itemBuilder: (context, index) {
                      bool isFavourited = favPost.contains(newcard[index]);
                      return GestureDetector(
                        onTap: () => {Navigator.push(
                                    context,
                                    MaterialPageRoute(builder: (context) => DetailPage(data: newcard[index])))
                                    },
                        child: Card(
                          margin: const EdgeInsets.symmetric(vertical: 3, horizontal: 5),
                          child: Padding(
                            padding: const EdgeInsets.only(top:10.0, bottom: 10.0, left: 5.0, right: 5.0),
                            child: Row(
                              children: <Widget>[
                        
                                Container(
                                  height: 100,
                                  width: 100,
                                  child: Image.network("${newcard[index]["image"]}"),
                                ),
                        
                                const SizedBox(width: 7),
                        
                                Expanded(
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                        
                                      Text(newcard[index]["title"], 
                                          style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold)),
                        
                                      Text(newcard[index]["description"],
                                          style: TextStyle(fontSize: 17)),
                                      
                                      SizedBox(height: 13),
                        
                                      Text(newcard[index]["date"],
                                      style: TextStyle(fontSize: 12)),
                                    ],
                                  ),
                                ),
                                
                                Row(
                                  children: [
                                    IconButton(
                                      icon: Icon(
                                        isFavourited
                                          ? Icons.favorite : Icons.favorite_border, 
                                          color: isFavourited 
                                          ? Colors.pink: null
                                      ),
                                      iconSize: 35,
                                      onPressed: () {
                                        setState(() {
                                          if (isFavourited) {
                                            favPost.remove(newcard[index]);
                                          } else {
                                            favPost.add(newcard[index]);
                                          }
                                        });
                                      },
                                    ),
                                  
                                    IconButton(
                                      icon: Image.asset('assets/images/trash.png'),
                                      iconSize: 5,
                                      onPressed: () {_showDialog(context);},
                                    ),
                                    
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ),
                      );
                    }
                  ),
                ),
              ),
              const SizedBox(height: 20),
            ],
          )
        ),
        
        bottomNavigationBar: BottomAppBar(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              IconButton(icon: const Icon(Icons.home), 
                          iconSize: 40,
                          onPressed: () {
                            // Navigator.push(
                            // context,
                            // MaterialPageRoute(builder: (context) => PostPage()));
                          }
                        ),
              // const Spacer(),
              IconButton(icon: Image.asset('assets/images/like.png'),
                          iconSize: 8,
                          onPressed: () {
                            Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => LikePage(favouritePost: favPost, unfavourite: onUnfavourite)));
                          }
                        ),
            ],
          ),
        ),
        floatingActionButton:
            FloatingActionButton(child: const Icon(Icons.add), onPressed: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => CreatePage()));
              }
            ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      );
    }
}

class MyBehavior extends ScrollBehavior {
  @override
  Widget buildViewportChrome(
      BuildContext context, Widget child, AxisDirection axisDirection) {
    return child;
  }
}

void _showDialog(BuildContext context) {
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        title: const Text("Notification"),
        content: const Text("Are you sure want to delete post ?"),
        actions: <Widget>[
          TextButton(
            child: const Text("Cancel"),
            onPressed: () {
              Navigator.of(context).pop();
            },
          ),

          TextButton(
            child: const Text("Yes"),
            onPressed: () {
              Navigator.of(context).pop();
            },
          ),
        ],
      );
    },
  );
}