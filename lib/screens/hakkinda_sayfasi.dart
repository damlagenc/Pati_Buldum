import 'package:flutter/material.dart';

class HakkindaSayfasi extends StatefulWidget {
  @override
  _HakkindaSayfasiState createState() => _HakkindaSayfasiState();
}

class _HakkindaSayfasiState extends State<HakkindaSayfasi> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Hakkında"),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: <Widget>[
                  Container(
                      height: 400,
                      width: 370,
                      padding: const EdgeInsets.all(8.0),
                      margin: EdgeInsets.all(3),
                      color: Colors.purple.shade50,
                      child: Align(
                        alignment: Alignment.center,
                        child: Text(
                          "Bu uygulamanın amacı sokakta gördüğümüz evcil hayvanları sahipleri ile buluşturabilmektir. Hayvanseverler olarak, evcil hayvanı kaybolmuş sahiplerine destek olarak hayvanlarını bulmasına yardım edebilirsiniz. Tek yapmanız gereken üye olduktan sonra bulduğunuz hayvanların fotoğraflarını çekip anasayfaya yüklemektir. Böylece, hayvanların sahipleri kolayca size ulaşarak, hayvanları ile buluşabilir. :)",
                          style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                              color: Colors.black),
                        ),
                      )),
                ],
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: <Widget>[
                      Container(
                          height: 150,
                          width: 370,
                          padding: EdgeInsets.all(8.0),
                          margin: EdgeInsets.all(3),
                          color: Colors.purple.shade50,
                          child: Align(
                            alignment: Alignment.center,
                            child: Text(
                              "Bu uygulama Dr. Öğretim Üyesi Ahmet Cevahir ÇINAR tarafından yürütülen 3301456 kodlu MOBİL PROGRAMLAMA dersi kapsamında 193301040 numaralı Damla GENÇ tarafından 25 Haziran 2021 günü yapılmıştır.",
                              style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black),
                            ),
                          )),
                    ],
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 16.0),
                        child: ElevatedButton(
                          onPressed: () {
                            Navigator.pushNamed(context, '/');
                          },
                          child: Text("Anasayfaya Dön"),
                        ),
                      )
                    ],
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
