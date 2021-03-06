import 'package:flutter/material.dart';

void main() => runApp(Wazzap());

class Wazzap extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Wazzap',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: WazzapHome(),
    );
  }
}

class WazzapHome extends StatefulWidget {
  @override
  _WazzapHomeState createState() => _WazzapHomeState();
}

class _WazzapHomeState extends State<WazzapHome> with SingleTickerProviderStateMixin {
  TabController controller;

  @override
  void initState(){
    super.initState();
    controller = new TabController(length: 3, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
        backgroundColor: Color.fromRGBO(7, 94, 84, 2),
          title: Text("Wazzap"),
          actions: <Widget>[
            Padding(
              padding: EdgeInsets.only(right: 15.0),
              child: Icon(Icons.search),
            ),
            Padding(
              padding: EdgeInsets.only(right: 15.0),
              child: Icon(Icons.more_vert),
            ),
          ],
          bottom: TabBar(
            indicatorColor: Colors.white,
            controller: controller,
            tabs: <Widget>[
              GestureDetector(
                child: Tab(
                  child: Text("CHATS"),
                ),
              ),
              GestureDetector(
                child: Tab(
                  child: Text("STATUS"),
                ),
              ),
              GestureDetector(
                child: Tab(
                  child: Text("CALLS"),
                ),
              ),
            ],
          ),
        ),
        body: TabBarView(
          controller: controller,
          children: <Widget>[

            Container(
              child: ListView.builder(
                itemCount: 10,
                itemBuilder: (BuildContext context, int i){
                  return Card(
                    child: ListTile(
                      contentPadding: EdgeInsets.all(10.0),
                      title: Text("SAMPLE", style: TextStyle(
                        fontWeight: FontWeight.bold,
                      ),),
                      subtitle: Text("Sample message"),
                      leading: CircleAvatar(
                        backgroundColor: Color.fromRGBO(7, 94, 84, 2),
                        child: Icon(
                            Icons.android
                        ),
                      ),
                      trailing: Text("${DateTime.now().hour}" + ":" + "${DateTime.now().second}"),
                    ),
                  );
                },
              ),
            ),
            Container(
              color: Colors.white,
              child: Column(
                children: <Widget>[
                  ListTile(
                    leading: CircleAvatar(
                      backgroundColor: Color.fromRGBO(7, 94, 84, 2),
                      child: Icon(Icons.android),
                    ),
                    title: Text("My Status", style: TextStyle(fontWeight: FontWeight.bold),),
                    subtitle: Text("Tap to add status update"),
                  ),
                  Container(
                    height: 25,
                    color: Colors.black12,
                    child: Row(
                      children: <Widget>[
                        Padding(
                          padding: EdgeInsets.only(left: 20),
                        ),
                        Text("Recent Updates", textAlign: TextAlign.left),
                      ],
                    ),
                  ),
                  Expanded(
                    child: Container(
                      margin: EdgeInsets.all(0),
                      // height: MediaQuery.of(context).size.height,
                      child: ListView.builder(
                        itemCount: 10,
                        itemBuilder: (context, i){
                          return Card(

                            child: ListTile(

                              leading: CircleAvatar(
                                backgroundColor: Color.fromRGBO(7, 94, 84, 2),
                                child: Icon(Icons.android),
                              ),
                              contentPadding: EdgeInsets.all(7.0),
                              title: Text("Hey", style: TextStyle(fontWeight: FontWeight.bold)),
                              subtitle: Text("Today ${DateTime.now().hour}" + ":" + "${DateTime.now().minute}" + "pm"),
                            ),
                          );
                        },
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Container(
              child: ListView.builder(
                
                itemCount: 10,
                itemBuilder: (BuildContext context, int i){
                  return ListTile(
                    contentPadding: EdgeInsets.all(7.0),
                    leading: CircleAvatar(
                      child: Icon(Icons.android),
                      backgroundColor: Color.fromRGBO(7, 94, 84, 2),
                    ),
                    title: Text("Sample", style: TextStyle(fontWeight: FontWeight.bold)),
                    subtitle: Text("Yesterday, ${DateTime.now().hour}" + ":" + "${DateTime.now().minute}" + "pm"),
                    trailing: Icon(Icons.call, color: Color.fromRGBO(7, 94, 84, 2),),
                  );
                },
              ),
            ),

          ],
        ),
        floatingActionButton: FloatingActionButton(
          child: Icon(Icons.camera_alt),
          backgroundColor: Color.fromRGBO(7, 94, 84, 2), onPressed: () {},
        ),
      ),
    );
  }
}
