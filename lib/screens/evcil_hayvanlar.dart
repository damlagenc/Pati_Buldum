import 'package:flutter/material.dart';
import 'package:mobil_projem/models/animal.dart';
import 'package:mobil_projem/viewmodel/getAnimal.dart';

class EvcilHayvanlar extends StatefulWidget {
  const EvcilHayvanlar({Key key}) : super(key: key);

  @override
  _EvcilHayvanlarState createState() => _EvcilHayvanlarState();
}

class _EvcilHayvanlarState extends State<EvcilHayvanlar> {
  Future<List<Animal>> animal;

  @override
  void initState() {
    super.initState();
    animal = getAnimal();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Evcil Hayvanlar Hakkında'),
        centerTitle: true,
      ),
      body: Center(
        child: FutureBuilder<List<Animal>>(
          future: animal,
          builder: (context, veri) {
            if (veri.hasData) {
              return ListView.builder(
                  itemCount: veri.data.length,
                  itemBuilder: (context, index) {
                    return Card(
                      child: Column(
                        children: [
                          Container(
                            child: Text(
                              veri.data[index].name,
                              style: TextStyle(
                                  fontSize: 24, fontWeight: FontWeight.bold),
                            ),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Container(
                            child: Image.network(
                              veri.data[index].url,
                              fit: BoxFit.cover,
                              width: MediaQuery.of(context).size.width,
                            ),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Container(
                            color: Colors.white,
                            child: Text(
                              veri.data[index].body,
                              style: TextStyle(fontSize: 15),
                            ),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                        ],
                      ),
                    );
                  });
            } else if (veri.hasError) {
              return Text(veri.error);
            }
            return CircularProgressIndicator();
          },
        ),
      ),
    );
  }
}
