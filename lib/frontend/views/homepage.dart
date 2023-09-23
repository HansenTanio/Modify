import 'dart:typed_data';
import 'package:flutter/material.dart';
import 'package:ujianprojectflutter/frontend/Models/FavoriteModel.dart';
import 'package:ujianprojectflutter/frontend/views/about.dart';
import 'package:ujianprojectflutter/frontend/views/player.dart';
import 'package:ujianprojectflutter/frontend/views/premium.dart';
import 'package:ujianprojectflutter/frontend/views/login.dart';
import 'package:ujianprojectflutter/frontend/providers/favoriteProviders.dart';
import 'package:ujianprojectflutter/frontend/views/setting.dart';
import 'package:ujianprojectflutter/frontend/views/favorit.dart';
import 'package:uuid/uuid.dart';
import 'package:provider/provider.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final TextEditingController _searchController = TextEditingController();
  bool check = true;
  var uuid = Uuid();

  List<Item> listData = [
    Item(
      id: Uuid().v1(),
      cover: "assets/IU.jpeg",
      title: "Eight",
      subtitle: "IU",
      duration: Duration(seconds: 220),
      song: "Eight.mp3",
    ),
    Item(
      id: Uuid().v1(),
      cover: "assets/Jisoo.jpeg",
      title: "Flower",
      subtitle: "JISOO",
      duration: Duration(seconds: 185),
      song: "Flower.mp3",
    ),
    Item(
      id: Uuid().v1(),
      cover: "assets/Mahalini.jpeg",
      title: "Sial",
      subtitle: "Mahalini",
      duration: Duration(seconds: 244),
      song: "Sial.mp3",
    ),
    Item(
      id: Uuid().v1(),
      cover: "assets/Dynamite.jpeg",
      title: "Dynamite",
      subtitle: "BTS",
      duration: Duration(seconds: 224),
      song: "Dynamite.mp3",
    ),
    Item(
      id: Uuid().v1(),
      cover: "assets/akuyangsalah.jpg",
      title: "Aku Yang Salah",
      subtitle: "Mahalini",
      duration: Duration(seconds: 280),
      song: "akuyangsalah.mp3",
    ),
    Item(
      id: Uuid().v1(),
      cover: "assets/AtTheEnd.png",
      title: "At The End",
      subtitle: "Kim Chungha",
      duration: Duration(seconds: 280),
      song: "AtTheEnd.mp3",
    ),
    Item(
      id: Uuid().v1(),
      cover: "assets/melawanrestu.jpg",
      title: "Melawan Restu",
      subtitle: "Mahalini",
      duration: Duration(seconds: 280),
      song: "MelawanRestu.mp3",
    ),
    Item(
      id: Uuid().v1(),
      cover: "assets/star.png",
      title: "Time, Like A Shinning Star",
      subtitle: "Jimin park",
      duration: Duration(seconds: 280),
      song: "star.mp3",
    ),
    Item(
      id: Uuid().v1(),
      cover: "assets/tertawanhati.jpg",
      title: "Tertawan Hati",
      subtitle: "Awdella",
      duration: Duration(seconds: 280),
      song: "tertawan.mp3",
    ),
    Item(
      id: Uuid().v1(),
      cover: "assets/trauma.jpg",
      title: "Trauma",
      subtitle: "Elsya",
      duration: Duration(seconds: 280),
      song: "trauma.mp3",
    ),
    Item(
      id: Uuid().v1(),
      cover: "assets/tuturbatin.jpg",
      title: "Tutur Batin",
      subtitle: "Yura Yunita",
      duration: Duration(seconds: 280),
      song: "tuturbatin.mp3",
    )
  ];

  _showLogoutConfirmationDialog() {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          backgroundColor: Theme.of(context).scaffoldBackgroundColor,
          title: Text(
            'Logout',
            style: Theme.of(context).textTheme.headline6!.copyWith(
                  color: Theme.of(context).textTheme.bodyText1!.color,
                ), // Use the text color from the app's theme
          ),
          content: Text(
            'Are you sure you want to logout?',
            style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                  color: Theme.of(context).textTheme.bodyText2!.color,
                ),
          ),
          actions: [
            TextButton(
              child: Text(
                'Cancel',
                style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                      color: Theme.of(context).textTheme.bodyText2!.color,
                    ),
              ),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
            TextButton(
              child: Text(
                'Confirm',
                style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                      color: Theme.of(context).textTheme.bodyText2!.color,
                    ),
              ),
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) {
                  return LoginPage();
                }));
              },
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    var prov = Provider.of<FavoriteProvider>(context);
    return Scaffold(
      appBar: AppBar(
        title: const Text('HomePage'),
        backgroundColor: Color.fromARGB(255, 1, 67, 121),
        centerTitle: true,
      ),
      drawer: Drawer(
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        child: Container(
          child: ListView(
            padding: EdgeInsets.zero,
            children: <Widget>[
              Container(
                height: 100,
                child: DrawerHeader(
                  decoration: BoxDecoration(
                    color: Color.fromARGB(255, 1, 67, 121),
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Text(
                        'Account Musik',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 25,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Card(
                child: ListTile(
                  leading: Icon(Icons.star),
                  iconColor: Colors.yellow,
                  title: Text('Premium'),
                  onTap: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) {
                      return Premium();
                    }));
                  },
                ),
              ),
              Card(
                child: ListTile(
                  leading: Icon(Icons.favorite),
                  iconColor: Colors.red,
                  title: Text('Favorite'),
                  onTap: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) {
                      return lagufavorit();
                    }));
                  },
                ),
              ),
              Card(
                child: ListTile(
                  leading: Icon(Icons.settings),
                  iconColor: Colors.black,
                  title: Text('Settings'),
                  onTap: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) {
                      return SettingsScreen();
                    }));
                  },
                ),
              ),
              Card(
                child: ListTile(
                  leading: Icon(Icons.contact_support),
                  title: Text('AboutUs'),
                  iconColor: Colors.blueGrey,
                  onTap: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) {
                      return about();
                    }));
                  },
                ),
              ),
              Card(
                child: ListTile(
                  leading: Icon(Icons.logout),
                  iconColor: Color.fromARGB(255, 1, 67, 121),
                  title: Text('Logout'),
                  onTap: () {
                    _showLogoutConfirmationDialog();
                  },
                ),
              ),
            ],
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              margin: EdgeInsets.all(10.0),
              child: TextField(
                controller: _searchController,
                decoration: InputDecoration(
                  hintText: 'Find Your Favorite Song',
                  suffixIcon: IconButton(
                    icon: Icon(Icons.clear),
                    onPressed: () => _searchController.clear(),
                  ),
                  prefixIcon: IconButton(
                    icon: Icon(Icons.search),
                    onPressed: () {},
                  ),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(18),
                  ),
                ),
              ),
            ),
            Container(
              padding: EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: Color.fromARGB(255, 1, 67, 121),
              ),
              child: Text(
                'Recommended',
                style: TextStyle(color: Colors.white, fontSize: 18),
              ),
              width: double.infinity,
            ),
            SizedBox(
              height: 170,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: listData.length,
                shrinkWrap: true,
                itemBuilder: (context, index) => GestureDetector(
                  onTap: () {
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (context) =>
                            MusicPlayer(item: listData[index]),
                      ),
                    );
                  },
                  child: Column(
                    children: [
                      Container(
                        margin:
                            EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                        width: 100,
                        height: 100,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(18),
                          image: DecorationImage(
                            fit: BoxFit.cover,
                            image: AssetImage(listData[index].cover),
                          ),
                        ),
                      ),
                      Text(listData[index].title,
                          style: Theme.of(context).textTheme.bodyText1),
                      Text(
                        listData[index].subtitle,
                        style: TextStyle(color: Colors.grey),
                      )
                    ],
                  ),
                ),
              ),
            ),
            Container(
              padding: EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: Color.fromARGB(255, 1, 67, 121),
              ),
              child: Text(
                'Top Chart',
                style: TextStyle(color: Colors.white, fontSize: 18),
              ),
              width: double.infinity,
            ),
            ListView.builder(
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              itemCount: listData.length,
              itemBuilder: (context, index) => GestureDetector(
                onTap: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) => MusicPlayer(item: listData[index]),
                    ),
                  );
                },
                child: Row(
                  children: [
                    Container(
                      alignment: Alignment.centerLeft,
                      margin: EdgeInsets.all(14),
                      width: 80,
                      height: 80,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(18),
                        image: DecorationImage(
                          fit: BoxFit.cover,
                          image: AssetImage(listData[index].cover),
                        ),
                      ),
                    ),
                    SizedBox(width: 10),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          listData[index].title,
                          style: TextStyle(
                            color: Theme.of(context).textTheme.bodyText1!.color,
                            fontSize: 16,
                          ),
                        ),
                        Text(
                          listData[index].subtitle,
                          style: TextStyle(
                            color: Colors.grey,
                            fontSize: 14,
                          ),
                        ),
                      ],
                    ),
                    const Spacer(),
                    Container(
                      margin: EdgeInsets.only(right: 20),
                      child: IconButton(
                        icon: !prov.favoriteList.contains(listData[index])
                            ? Icon(Icons.favorite_border)
                            : Icon(
                                Icons.favorite,
                                color: Colors.red,
                              ),
                        onPressed: () {
                          if (!prov.favoriteList.contains(listData[index])) {
                            prov.addFavorite(listData[index]);
                          } else {
                            prov.removeFavorite(listData[index]);
                          }
                        },
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
