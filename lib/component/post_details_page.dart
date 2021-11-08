import 'package:flutter/material.dart';
import 'package:mobile_project/component/post_page.dart';

import 'like_page.dart';


class DetailPage extends StatelessWidget {
  const DetailPage({Key? key}) : super(key: key);

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
              const Text("Title :"),

              Image.asset('assets/images/switzerland.webp', height: 200, width: 200,),

              const Text("Description :"),

              const SizedBox(height: 10),

              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  ElevatedButton(
                    child: const Text('Create Post'),
                    onPressed: () {},
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
      );
    }
}
