import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});


  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: MyHomePage(),

    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  State<MyHomePage> createState() => _MyHomePageState();
}
class _MyHomePageState extends State<MyHomePage> {
  List<String> courses=["PHYSICS","STATS","CALCULAS","ICS","OOP","ASSEMBLY LANGUAGE","ENGLISH"];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Center(child: Text("DISMISSIBLE APP",style: TextStyle(fontSize: 23,fontWeight: FontWeight.bold,color: Colors.black),)),
          backgroundColor: Colors.blueGrey,
        ),
      body: Container(
        decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: [
                Colors.black,
                Colors.blueGrey,
              ],
            ),
        ),
        child: ListView.builder(
          itemCount: courses.length,
          itemBuilder: (context, index) {
            final Courses = courses[index];
            return Dismissible(
                onDismissed: (direction) {
                  if (direction == DismissDirection.startToEnd) {
                    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                      content: Text(courses[index]),
                      backgroundColor: Colors.red,
                    ));
                  } else {
                    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                      content: Text(courses[index]),
                      backgroundColor: Colors.green,
                    ));
                  }
                },
                key: Key(Courses),
                background: Container(
                  color: Colors.red,
                ),
                secondaryBackground: Container(
                  color: Colors.green,
                ),
                child: Card(
                  color: Colors.blueGrey,
                  child: ListTile(
                    title: Text(courses[index]),
                  ),
                ),
             );
          },
        ),
      ),
    );
  }
}

