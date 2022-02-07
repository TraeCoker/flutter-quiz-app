import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  int count = 0;

  //called once when widget is first initialized
  @override
  void initState() {
    //fetch data from firebase
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  //called when widget is removed from ui

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      //used as the base of the app to configure themes and routes
      //scaffold is visual layout structure. build screens with common UI elements
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.blue,
          title: const Text('Flutter is Fun!'),
        ),
        floatingActionButton: FloatingActionButton(
          child: Icon(Icons.add),
          onPressed: () {
            setState(() {
              count++;
            });
          },
        ),
        body: Center(
            child: Text(
          '$count',
          style: TextStyle(fontSize: 60),
        )),
        bottomNavigationBar: BottomNavigationBar(
          items: const [
            BottomNavigationBarItem(
              icon: Icon(Icons.home),
              label: 'Home',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.business),
              label: 'Business',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.school),
              label: 'School',
            ),
          ],
        ),
        drawer: const Drawer(
          child: Text('Yo!'),
        ),
        //Build dynamic widgets with builder functions that you define
        //to map a list of data to a list of widgets
        // body: ListView.builder(
        //   itemBuilder: (_, index){
        //     return Container(
        //       color: Colors.lightBlueAccent,
        //       width: 500,
        //       height: 500,
        //     );
        //   },

        //body: ListView(
        //scrollDirection: Axis.horizontal,
        //-->garbage collect items that are no longer on screen
        //addAutomaticKeepAlives: false,
        //)

        //body is like a div. takes one child
        // body: Center(
        //   child: Container(
        //     child: const Text('Hi Mom!'),
        //     margin: const EdgeInsets.all(10),
        //     padding: const EdgeInsets.all(10),
        // color: Colors.red,
        // height: 100,
        // width: 100,
        //takes box decoration widget as it's argument
        //decoration: BoxDecoration()
        //     ),
        // )

        // widgets that overlap
        //   body: Stack(
        //     children: [
        //       Container(
        //         color: Colors.red,
        //         width: 100,
        //         height: 100,
        //       ),
        //like absolute in CSS
        // Positioned(
        //   child: Icon(Icons.verified),
        //   top: 25,
        //   left: 25,),
        //       Align(
        //         child: Icon(Icons.verified),
        //         alignment: Alignment.center,
        //       )
        //     ],
        //   ),
      ),
    );
  }
}

//Use the Navigator to push and pop widgets on the navigation stack.
//The Scaffold class will automatically handle the back button for you.
class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green,
        title: const Text('Flutter is Fun!'),
      ),
      body: ElevatedButton(
        child: Text('Navigate'),
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (_) => AboutScreen(),
            ),
          );
        },
      ),
    );
  }
}

class AboutScreen extends StatelessWidget {
  const AboutScreen({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('about'),
      ),  
    );
  }
}


//Example of a stream builder
class DemoApp extends StatelessWidget {
  const DemoApp({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<int>(
      stream: Stream.fromIterable([1,2,3,4]),
      builder: (context, snapshot) {
        var count = snapshot.data;

        //add UI here

        return Text('$count');
      },
    );
  }
}