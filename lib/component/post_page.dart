import 'package:flutter/material.dart';
import 'package:mobile_project/component/like_page.dart';
import 'package:mobile_project/component/post_details_page.dart';

import 'create_post_page.dart';


class PostPage extends StatelessWidget {
  const PostPage({Key? key}) : super(key: key);

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
              Row(
                children: [
                  IconButton(
                    icon: Image.asset('assets/images/settings.png'),
                    iconSize: 5,
                    onPressed: () {},
                  ),

                  Expanded(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        IconButton(
                          alignment: Alignment.topRight,
                          icon: Image.asset('assets/images/sort.png'),
                          iconSize: 5,
                          onPressed: () {},
                        ),
                      ],
                    ),
                  ),
                ],
              ),

              GestureDetector(
                onTap: () => {Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => const DetailPage()))
                            },
                child: Card(
                  margin: const EdgeInsets.symmetric(vertical: 5, horizontal: 5),
                  child: Padding(
                    padding: const EdgeInsets.only(top:10.0, bottom: 10.0, left: 5.0, right: 5.0),
                    child: Row(
                      children: <Widget>[

                        ClipRRect(
                          borderRadius: BorderRadius.circular(10.0),
                          child: Image.asset('assets/images/switzerland.webp', height: 80, width: 180),
                        ),

                        const SizedBox(width: 5),

                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: const [

                              Text("Title", 
                                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),

                              SizedBox(
                                width: 100,
                                height: 10,
                                child: FittedBox(fit:BoxFit.fitWidth,
                                  child: Text("Description",
                                  style: TextStyle(fontSize: 13)),
                                )
                              ),
                              
                              SizedBox(height: 13),

                              Text("Create Date",
                              style: TextStyle(fontSize: 12)),
                            ],
                          ),
                        ),
                        
                        Row(
                          children: [
                            IconButton(
                              alignment: Alignment.topRight,
                              icon: Image.asset('assets/images/trash.png'),
                              iconSize: 6,
                              onPressed: () {},
                            ),

                            IconButton(
                              alignment: Alignment.topRight,
                              icon: Image.asset('assets/images/heart.png'),
                              iconSize: 8,
                              onPressed: () {},
                            ),
                          ],
                        ),
                      ],
                    ),
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
                          onPressed: () {
                            Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => const PostPage()));
                          }
                        ),
              // const Spacer(),
              IconButton(icon: Image.asset('assets/images/heart.png'),
                          iconSize: 8,
                          onPressed: () {
                            Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => const LikePage()));
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
