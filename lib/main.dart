import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:web_socket_channel/web_socket_channel.dart';
import 'component/post.dart';

import 'flutter_bloc.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Final Project MD',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: BlocProvider(
        create: (context) => UsernameCubit(),
        child: const HomePage(),
      ),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final usernameInput = TextEditingController();
  bool enableBtn = false;
  String? name;
  
  void checkText() {
    if (usernameInput.text.isNotEmpty) {
      enableBtn = true;
    } else {
      enableBtn = false;
    }
  }

  //fetch API
  final fetchAPI = WebSocketChannel.connect(Uri.parse('ws://besquare-demo.herokuapp.com'));

  @override
  void dispose() {
    usernameInput.dispose();
    super.dispose();
  }

  //sign-in
  void _getSignInResponse(String userInput) {
    fetchAPI.sink.add('{"type": "sign_in", "data": {"name": "$userInput"}}');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.purpleAccent,
        title: const Text('Doppelganger Instagram'),
      ),
      body: Padding(
          padding: const EdgeInsets.all(10),
          child: ListView(
            children: <Widget>[
              Container(
                  alignment: Alignment.center,
                  padding: const EdgeInsets.all(10),
                  child: const Text(
                    'Lets Get Connected !',
                    style: TextStyle(
                        color: Colors.purpleAccent,
                        fontWeight: FontWeight.w500,
                        fontSize: 30),
                    )
                  ),

              Image.asset('assets/images/social.png', width: 300, height: 200),
              
              BlocBuilder <UsernameCubit, String>(
                builder: (context, state) {
                  return TextField(
                    controller: usernameInput,
                    decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: " Username",   
                    ),
                    onChanged: (String? usernameInput) {
                      context.read<UsernameCubit>().updateUsername;
                    },
                  );
                }
              ),
              
              BlocConsumer<UsernameCubit, String>(
              listener: (context, state) {},
              builder: (context, state) {
                return Text(
                  state,
                  style: Theme.of(context).textTheme.headline4,
                );
              }),

              const SizedBox(height: 16),

              Container(
                height: 50,
                width: 150,
                padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
                child: ElevatedButton(
                  child: const Text('Login'),
                  onPressed: enableBtn ? null 
                  : () { 
                    String textInput = (usernameInput.toString());
                    _getSignInResponse(textInput);
                    Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => PostPage(postchannel: fetchAPI)));
                    ScaffoldMessenger.of(context).showSnackBar((const SnackBar(content: Text('Successful sign in. '))));                     
                  },
                  style: ElevatedButton.styleFrom(
                    fixedSize: const Size(150, 50),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30)
                    )
                  ),
                )
              ),
            ],
          )
      )
    );
  }
}