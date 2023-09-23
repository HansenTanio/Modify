import 'package:flutter/material.dart';
import 'package:ujianprojectflutter/frontend/widget/PremiumCardWidget.dart';
import 'setting.dart';

class Premium extends StatefulWidget {
  @override
  _premium createState() => _premium();
}

class _premium extends State<Premium> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Premium Subscription'),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              PremiumCard(
                title: 'Paket Gercepp',
                price: 'Rp.29.000/1 Bulan',
                features: [
                  'Ad-free streaming',
                  'Offline listening',
                  'High-quality audio',
                  'Unlimited skips',
                  'Lyrics display',
                ],
                buttonText: 'SUBSCRIBE',
                buttonColor: Color.fromARGB(255, 30, 215, 96),
              ),
              SizedBox(height: 16.0),
              PremiumCard(
                title: 'Paket Santuyy',
                price: 'Rp.79.000/3 Bulan',
                features: [
                  'Ad-free streaming',
                  'Offline listening',
                  'High-quality audio',
                  'Unlimited skips',
                  'Lyrics display',
                ],
                buttonText: 'SUBSCRIBE',
                buttonColor: Color.fromARGB(255, 30, 215, 96),
              ),
              SizedBox(height: 16.0),
              PremiumCard(
                title: 'Paket Sultann',
                price: 'Rp.159.000/1 Tahun',
                features: [
                  'Ad-free streaming',
                  'Offline listening',
                  'High-quality audio',
                  'Unlimited skips',
                  'Lyrics display',
                ],
                buttonText: 'SUBSCRIBE',
                buttonColor: Color.fromARGB(255, 30, 215, 96),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
