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
        if (constraints.maxWidth <= 520) {
          return KostListView();
        } else if (constraints.maxWidth <= 768) {
          return KostGrid(gridCount: 2);
        } else if (constraints.maxWidth <= 1000) {
          return KostGrid(gridCount: 3);
        } else if (constraints.maxWidth <= 1200) {
          return KostGrid(gridCount: 4);
        } else {
          return KostGrid(gridCount: 4);
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
                    Stack(
                      children: [
                        Expanded(
                            child: Image.asset(
                          kostData.thumbnail,
                          fit: BoxFit.cover,
                        )),
                        Padding(
                          padding: const EdgeInsets.all(4.0),
                          child: Container(
                            child: Text(
                              kostData.status,
                              style: TextStyle(color: Colors.white),
                            ),
                            decoration: BoxDecoration(
                                color: Colors.blueGrey,
                                borderRadius: BorderRadius.circular(10)),
                            padding: EdgeInsets.all(3.0),
                          ),
                        ),
                      ],
                    ),
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

class KostListView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemBuilder: (context, index) {
        final KostData kostData = kostDataList[index];
        return InkWell(
          onTap: () {
            Navigator.push(context, MaterialPageRoute(builder: (context) {
              return DetailScreen(
                kostData: kostData,
              );
            }));
          },
          child: Card(
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Expanded(
                    flex: 1,
                    child: Stack(
                      children: [
                        Image.asset(kostData.thumbnail),
                        Padding(
                          padding: const EdgeInsets.all(4.0),
                          child: Container(
                            child: Text(
                              kostData.status,
                              style: TextStyle(color: Colors.white),
                            ),
                            decoration: BoxDecoration(
                                color: Colors.blueGrey,
                                borderRadius: BorderRadius.circular(10)),
                            padding: EdgeInsets.all(3.0),
                          ),
                        ),
                      ],
                    )),
                Expanded(
                  flex: 2,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisSize: MainAxisSize.min,
                      children: <Widget>[
                        Text(
                          kostData.name,
                          style: TextStyle(fontSize: 16.0),
                        ),
                        SizedBox(
                          height: 5,
                        ),
                        Text(kostData.location),
                        Text(
                          kostData.price,
                          style: TextStyle(color: Colors.green),
                        )
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
      },
      itemCount: kostDataList.length,
    );
  }
}
