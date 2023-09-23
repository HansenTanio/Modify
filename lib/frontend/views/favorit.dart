import 'package:flutter/material.dart';
import 'package:ujianprojectflutter/frontend/views/homepage.dart';
import 'package:ujianprojectflutter/frontend/views/player.dart';
import 'package:ujianprojectflutter/frontend/providers/favoriteProviders.dart';
import 'package:provider/provider.dart';

class lagufavorit extends StatefulWidget {
  @override
  _lagufavorit createState() => _lagufavorit();
}

class _lagufavorit extends State<lagufavorit> {
  @override
  Widget build(BuildContext context) {
    FavoriteProvider favorite = Provider.of<FavoriteProvider>(context);
    return Scaffold(
      appBar: AppBar(
        title: Text('Favorite Songs'),
        backgroundColor: Color.fromARGB(255, 1, 67, 121),
        centerTitle: true,
      ),
      body: Visibility(
        visible: favorite
            .favoriteList.isEmpty, // Tampilkan widget ini jika daftar kosong
        child: Center(
          child: Text(
            'Belum ada lagu favorit',
            style: TextStyle(
              color: Theme.of(context).textTheme.bodyText1!.color,
              fontSize: 20,
            ),
          ),
        ),
        replacement: ListView.builder(
          shrinkWrap: true,
          itemCount: favorite.favoriteList.length,
          itemBuilder: (context, index) {
            final data = favorite.favoriteList[index];
            return GestureDetector(
              onTap: () {
                Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) =>
                        MusicPlayer(item: favorite.favoriteList[index])));
              },
              child: Row(
                children: [
                  Divider(
                    color: Color.fromARGB(255, 1, 67, 121),
                  ),
                  Container(
                    alignment: Alignment.centerLeft,
                    margin: EdgeInsets.all(14),
                    width: 80,
                    height: 80,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(18),
                      image: DecorationImage(
                        fit: BoxFit.cover,
                        image: AssetImage(data.cover),
                      ),
                    ),
                  ),
                  SizedBox(width: 10),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        data.title,
                        style: TextStyle(
                          color: Theme.of(context).textTheme.bodyText1!.color,
                          fontSize: 16,
                        ),
                      ),
                      Text(
                        data.subtitle,
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
                      icon: !favorite.favoriteList.contains(data)
                          ? Icon(Icons.delete)
                          : Icon(
                              Icons.delete,
                              color: Theme.of(context).iconTheme.color,
                            ),
                      onPressed: () {
                        if (!favorite.favoriteList.contains(data)) {
                          favorite.addFavorite(data);
                        } else {
                          favorite.removeFavorite(data);
                        }
                      },
                    ),
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
