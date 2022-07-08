import 'package:flutter/material.dart';
import 'package:sewa_kost_dicoding/model/kost_data.dart';

class DetailScreen extends StatelessWidget {
  final KostData kostData;
  DetailScreen({required this.kostData});
  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (BuildContext context, BoxConstraints constraints) {
        // if (constraints.maxWidth > 800) {
        //   return DetailPage(kostData: kostData);
        // } else {
        //   return DetailPage(kostData: kostData);
        // }
        return DetailPage(kostData: kostData);
      },
    );
  }
}

class FavoriteButton extends StatefulWidget {
  @override
  _FavoriteButtonState createState() => _FavoriteButtonState();
}

class _FavoriteButtonState extends State<FavoriteButton> {
  bool isFavorite = false;
  @override
  Widget build(BuildContext context) {
    return IconButton(
      icon: Icon(
        isFavorite ? Icons.favorite : Icons.favorite_border,
        color: Colors.red,
      ),
      onPressed: () {
        setState(() {
          isFavorite = !isFavorite;
        });
      },
    );
  }
}

class DetailPage extends StatelessWidget {
  final KostData kostData;

  const DetailPage({required this.kostData});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Stack(
              children: [
                Image.asset(kostData.thumbnail),
                SafeArea(
                  child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          CircleAvatar(
                              backgroundColor: Colors.grey,
                              child: IconButton(
                                  icon: Icon(
                                    Icons.arrow_back,
                                    color: Colors.white,
                                  ),
                                  onPressed: () {
                                    Navigator.pop(context);
                                  })),
                          FavoriteButton(),
                        ],
                      )),
                )
              ],
            ),
            Container(
              height: 150,
              child: ListView(
                scrollDirection: Axis.horizontal,
                children: kostData.images.map((path) {
                  return Padding(
                    padding: const EdgeInsets.all(4.0),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(10.0),
                      child: Image.asset(path),
                    ),
                  );
                }).toList(),
              ),
            ),
            Container(
              margin: EdgeInsets.only(top: 16.0),
              child: Text(
                kostData.name,
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 30.0, fontWeight: FontWeight.bold),
              ),
            ),
            Container(
              margin: EdgeInsets.symmetric(vertical: 16.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Column(
                    children: [
                      Icon(Icons.house),
                      Text(kostData.status),
                      SizedBox(height: 8.0),
                    ],
                  ),
                  Column(
                    children: [
                      Icon(Icons.people),
                      Text(kostData.type),
                      SizedBox(
                        height: 8.0,
                      )
                    ],
                  ),
                  Column(
                    children: [
                      Icon(Icons.monetization_on),
                      Text(kostData.price),
                      SizedBox(
                        height: 8.0,
                      ),
                    ],
                  ),
                ],
              ),
            ),
            Container(
              padding: EdgeInsets.all(16.0),
              child: Text(
                kostData.description,
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 16.0),
              ),
            ),
            Container(
              child: Center(
                child: ElevatedButton(
                    onPressed: () {},
                    child: Padding(
                      padding: EdgeInsets.all(15.0),
                      child: Text("Pesan Sekarang"),
                    )),
              ),
              margin: EdgeInsets.only(top: 50.0),
            )
          ],
        ),
      ),
    ));
  }
}
