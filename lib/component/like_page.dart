import 'package:flutter/material.dart';

class LikePage extends StatefulWidget {
  LikePage({this.favouritePost, this.unfavourite
  , Key? key});

  final List?favouritePost;
  dynamic unfavourite;

  @override
  State<LikePage> createState() => _LikePageState();
}

class _LikePageState extends State<LikePage> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.purpleAccent,
        title: const Text('Doppelganger Instagram'),
      ),
      body: Center (
        child: Column(
          children: [
            Text("Liked", style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),

            Expanded(
              child: SingleChildScrollView(
                child: ListView.builder(
                  itemCount: widget.favouritePost?.length,
                  itemBuilder: (context, index){
                    return Card(
                      margin: const EdgeInsets.symmetric(vertical: 5, horizontal: 5),
                      child: Padding(
                        padding: const EdgeInsets.only(top:10.0, bottom: 10.0, left: 5.0, right: 5.0),
                        child: Row(
                          children: <Widget>[
              
                            ClipRRect(
                              borderRadius: BorderRadius.circular(10.0),
                              child: Image.network(widget.favouritePost?[index]["image"]),
                            ),
              
                            const SizedBox(width: 5),
              
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
              
                                  Text('${widget.favouritePost?[index]["author"]}', 
                                      style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
              
                                  SizedBox(
                                    width: 100,
                                    height: 10,
                                    child: FittedBox(fit:BoxFit.fitWidth,
                                      child: Text('${widget.favouritePost?[index]["description"]}',
                                      style: TextStyle(fontSize: 13)),
                                    )
                                  ),
                                  
                                  SizedBox(height: 13),
              
                                  Text('${widget.favouritePost?[index]["date"]}',
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
                                  icon: Image.asset('assets/images/heart_red.png'),
                                  iconSize: 8,
                                  onPressed: () {},
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    );
                  }
                ),
              ),
            ),
          ],
        )
      ),
    );
  }
}
