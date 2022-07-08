import 'package:flutter/material.dart';
import 'package:sewa_kost_dicoding/detail_screen.dart';
import 'package:sewa_kost_dicoding/model/kost_data.dart';

class MainScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Sewa Kost'),
      ),
      body: LayoutBuilder(
          builder: (BuildContext context, BoxConstraints constraints) {
        if (constraints.maxWidth <= 600) {
          return KostGrid(gridCount: 2);
        } else if (constraints.maxWidth <= 1200) {
          return KostGrid(gridCount: 4);
        } else {
          return KostGrid(gridCount: 6);
        }
      }),
    );
  }
}

class KostGrid extends StatelessWidget {
  final int gridCount;
  KostGrid({required this.gridCount});
  @override
  Widget build(BuildContext context) {
    return Scrollbar(
      thumbVisibility: true,
      child: Padding(
        padding: const EdgeInsets.all(24.0),
        child: GridView.count(
          crossAxisCount: gridCount,
          crossAxisSpacing: 16,
          mainAxisSpacing: 16,
          children: kostDataList.map((kostData) {
            return InkWell(
              onTap: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) {
                  return DetailScreen(kostData: kostData);
                }));
              },
              child: Card(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Expanded(
                        child: Image.asset(
                      kostData.thumbnail,
                      fit: BoxFit.cover,
                    )),
                    SizedBox(
                      height: 8,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Column(
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(left: 8.0),
                              child: Text(
                                kostData.name,
                                style: TextStyle(
                                    fontSize: 16.0,
                                    fontWeight: FontWeight.bold),
                              ),
                            ),
                            Row(
                              children: [
                                Icon(Icons.location_on),
                                Padding(
                                  padding:
                                      EdgeInsets.only(top: 3.0, bottom: 3.0),
                                  child: Text(
                                    kostData.location,
                                  ),
                                )
                              ],
                            )
                          ],
                        ),
                        Column(
                          children: [
                            Container(
                              child: Text(
                                kostData.status,
                                style: TextStyle(color: Colors.white),
                              ),
                              decoration: BoxDecoration(
                                  color: Colors.blueGrey,
                                  borderRadius: BorderRadius.circular(10)),
                              padding: EdgeInsets.all(3.0),
                            ),
                            Text(
                              kostData.price,
                              style: TextStyle(color: Colors.green),
                            )
                          ],
                        )
                      ],
                    )
                  ],
                ),
              ),
            );
          }).toList(),
        ),
      ),
    );
  }
}
