import 'package:flutter/material.dart';

class AnasayfaPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.deepOrange.shade300,
        title: Text("Anasayfa"),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: <Widget>[
              Container(
                height: 40,
                width: 390,
                child: Text("Sahipleri Aranan Hayvanlar",
                    style: TextStyle(color: Colors.white, fontSize: 20)),
                padding: const EdgeInsets.all(8.0),
                margin: EdgeInsets.all(3),
                color: Colors.purple,
              ),
              SizedBox(
                height: 10,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: <Widget>[
                  Container(
                    height: 250,
                    width: 170,
                    child: Text("Pet1",
                        style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 20)),
                    padding: const EdgeInsets.all(8.0),
                    margin: EdgeInsets.all(3),
                    color: Colors.purple.shade100,
                  ),
                  Container(
                    height: 250,
                    width: 170,
                    child: Text("Pet2",
                        style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 20)),
                    padding: const EdgeInsets.all(8.0),
                    margin: EdgeInsets.all(3),
                    color: Colors.purple.shade100,
                  ),
                ],
              ),
              SizedBox(
                height: 15,
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: <Widget>[
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: <Widget>[
                      Container(
                        height: 250,
                        width: 170,
                        child: Text("Pet3",
                            style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                                fontSize: 20)),
                        padding: const EdgeInsets.all(8.0),
                        margin: EdgeInsets.all(3),
                        color: Colors.purple.shade100,
                      ),
                      Container(
                        height: 250,
                        width: 170,
                        child: Text("Pet4",
                            style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                                fontSize: 20)),
                        padding: const EdgeInsets.all(8.0),
                        margin: EdgeInsets.all(3),
                        color: Colors.purple.shade100,
                      ),
                    ],
                  ),
                ],
              ),
              SizedBox(
                height: 10,
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: <Widget>[
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: <Widget>[
                      Container(
                        height: 250,
                        width: 170,
                        child: Text("Pet5",
                            style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                                fontSize: 20)),
                        padding: const EdgeInsets.all(8.0),
                        margin: EdgeInsets.all(3),
                        color: Colors.purple.shade100,
                      ),
                      Container(
                        height: 250,
                        width: 170,
                        child: Text("Pet6",
                            style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                                fontSize: 20)),
                        padding: const EdgeInsets.all(8.0),
                        margin: EdgeInsets.all(3),
                        color: Colors.purple.shade100,
                      ),
                    ],
                  ),
                ],
              ),
              SizedBox(
                height: 10,
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: <Widget>[
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: <Widget>[
                      Container(
                        height: 250,
                        width: 170,
                        child: Text("Pet7",
                            style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                                fontSize: 20)),
                        padding: const EdgeInsets.all(8.0),
                        margin: EdgeInsets.all(3),
                        color: Colors.purple.shade100,
                      ),
                      Container(
                        height: 250,
                        width: 170,
                        child: Text("Pet8",
                            style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                                fontSize: 20)),
                        padding: const EdgeInsets.all(8.0),
                        margin: EdgeInsets.all(3),
                        color: Colors.purple.shade100,
                      ),
                    ],
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
