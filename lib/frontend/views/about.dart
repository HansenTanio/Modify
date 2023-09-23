import 'package:flutter/material.dart';
import 'package:ujianprojectflutter/frontend/widget/aboutWidget.dart';

class about extends StatefulWidget {
  @override
  _about createState() => _about();
}

class _about extends State<about> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('About Us'),
        centerTitle: true,
        backgroundColor: Color.fromARGB(255, 1, 67, 121),
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Center(
                child: Text(
                  'LolKocakWkWk',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Theme.of(context).textTheme.bodyText1!.color,
                  ),
                ),
              ),
              SizedBox(height: 16),
              Text(
                'Perkenalkan nama kelompok kami LolKocakWkWk yang dimana ujianprojectflutter kami adalah membuat sebuah streaming musik seperti joox dan kawan", ide ini berasal dari anggota kami yang bernama vincent, dan untuk design dan codenya kami membuat ini bersama - sama Terima Kasih',
                style: TextStyle(
                  fontSize: 14,
                  color: Theme.of(context).textTheme.bodyText2!.color,
                ),
              ),
              SizedBox(height: 24),
              Center(
                child: Text(
                  'Anggota Kami',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Theme.of(context).textTheme.bodyText1!.color,
                  ),
                ),
              ),
              SizedBox(height: 18),
              Center(
                child: ProfileCard(
                  imageAsset: 'assets/Wilbert.png',
                  name: 'Wilbert Huberta',
                  position: 'Ketua Kelompok',
                ),
              ),
              SizedBox(height: 10),
              Center(
                child: ProfileCard(
                  imageAsset: 'assets/Vincent.png',
                  name: 'Vincent',
                  position: 'Anggota 1',
                ),
              ),
              SizedBox(height: 10),
              Center(
                child: ProfileCard(
                  imageAsset: 'assets/Khendi.jpg',
                  name: 'Khendi',
                  position: 'Anggota 2',
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
