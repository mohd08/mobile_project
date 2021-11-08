import 'package:flutter/material.dart';

class LikePage extends StatelessWidget {
  const LikePage({Key? key}) : super(key: key);

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

              const Text("Liked", style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),

              Card(
                margin: const EdgeInsets.symmetric(vertical: 5, horizontal: 5),
                child: Padding(
                  padding: const EdgeInsets.only(top:10.0, bottom: 10.0, left: 5.0, right: 5.0),
                  child: Row(
                    children: <Widget>[

                      ClipRRect(
                        borderRadius: BorderRadius.circular(10.0),
                        child: Image.asset('assets/images/new_zealand.webp', height: 80, width: 180),
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
                            icon: Image.asset('assets/images/heart_red.png'),
                            iconSize: 8,
                            onPressed: () {},
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ],
          )
        )
      );
    }
}
