import 'package:flutter/material.dart';

class PremiumCard extends StatelessWidget {
  final String title;
  final String price;
  final List<String> features;
  final String buttonText;
  final Color buttonColor;

  const PremiumCard({
    required this.title,
    required this.price,
    required this.features,
    required this.buttonText,
    required this.buttonColor,
  });

  @override
  Widget build(BuildContext context) {
    final TextStyle priceTextStyle =
        Theme.of(context).textTheme.bodyText1!.copyWith(
              // Modifikasi style sesuai kebutuhan Anda
              color: Theme.of(context)
                  .textTheme
                  .bodyText1!
                  .color, // Menggunakan warna default dari tema
              fontSize: 16,
              fontWeight: FontWeight.bold,
            );
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(25.0), // Menambahkan border radius
      ),
      elevation: 4.0,
      child: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Text(
              title,
              style: TextStyle(
                fontSize: 20.0,
                fontWeight: FontWeight.bold,
              ),
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 8.0),
            Text(
              price,
              style: TextStyle(
                fontSize: 16.0,
                fontWeight: FontWeight.bold,
                color: Theme.of(context).textTheme.bodyText1!.color,
              ),
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 16.0),
            Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: features.map((feature) {
                return Padding(
                  padding: EdgeInsets.only(bottom: 4.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Icon(Icons.check, size: 16.0),
                      SizedBox(width: 8.0),
                      Text(
                        feature,
                        style: TextStyle(
                          color: Theme.of(context).textTheme.bodyText2!.color,
                        ),
                      ),
                    ],
                  ),
                );
              }).toList(),
            ),
            SizedBox(height: 16.0),
            ElevatedButton(
              onPressed: () {},
              child: Text(buttonText),
              style: ElevatedButton.styleFrom(
                primary: buttonColor,
                onPrimary: Colors.white,
                padding: EdgeInsets.symmetric(horizontal: 32.0, vertical: 12.0),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20.0),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
