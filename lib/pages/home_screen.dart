import 'package:flutter/material.dart';
import 'package:pakaian_adat_app/data/traditional_clothes_list.dart';
import 'package:pakaian_adat_app/pages/detail_screen.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: <Widget>[
          SliverList(
              delegate: SliverChildListDelegate(
                  [appHeader(context), backgroundHeader()])),
          SliverPadding(
            padding: const EdgeInsets.all(20),
            sliver: SliverGrid.count(
              crossAxisSpacing: 10,
              mainAxisSpacing: 10,
              childAspectRatio: 0.75,
              crossAxisCount: 2,
              children: traditionalClothes.map((item) {
                return Card(
                  elevation: 4.0,
                  child: Stack(
                    children: <Widget>[
                      // Text
                      Container(
                        decoration: const BoxDecoration(
                            gradient: LinearGradient(
                                begin: Alignment.bottomCenter,
                                end: Alignment.topCenter,
                                colors: [
                              Colors.black87,
                              Colors.black26,
                              Colors.black12,
                              Colors.transparent
                            ])),
                      ),
                      InkWell(
                        splashColor: Colors.white.withAlpha(30),
                        onTap: () {
                          Navigator.push(context,
                              MaterialPageRoute(builder: (context) {
                            return DetailScreen(item: item);
                          })); // navigasi ke detail image
                        },
                        child: Ink.image(
                          image: AssetImage(item.imageAsset),
                          fit: BoxFit.cover,
                        ),
                      ),
                      Positioned(
                        bottom: 15.0,
                        left: 15.0,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Text(
                              item.province,
                              style: const TextStyle(
                                  fontFamily: 'Raleway',
                                  fontSize: 20,
                                  fontWeight: FontWeight.w700,
                                  color: Colors.white),
                            ),
                            Text(
                              item.island,
                              style: const TextStyle(
                                  fontFamily: 'Raleway',
                                  fontSize: 13,
                                  fontWeight: FontWeight.w300,
                                  color: Colors.white),
                            )
                          ],
                        ),
                      )
                    ],
                  ),
                );
              }).toList(),
            ),
          ),
        ],
      ),
    );
  }
}

Widget appHeader(BuildContext context) {
  return AppBar(
    title: const Text(
      "Pakaian Adat Indonesia",
      style: TextStyle(fontFamily: 'Grand Hotel', fontSize: 30),
    ),
    centerTitle: true,
    backgroundColor: Colors.redAccent,
    actions: <Widget>[
      IconButton(
        icon: const Icon(Icons.info_outline),
        onPressed: () {
          showDialog(
            context: context,
            barrierDismissible: false,
            builder: (_) => AlertDialog(
              title: const Text('Informasi'),
              content: const Text(
                  'Sumber gambar dan isi konten adalah dari Internet.\nNantikan fitur lainnya segera.'),
              actions: [
                TextButton(
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                    child: const Text('Oke'))
              ],
            ),
          );
        },
        tooltip: 'Info',
      ),
    ],
  );
}

Widget backgroundHeader() {
  return Container(
      width: double.infinity,
      height: 200,
      decoration: const BoxDecoration(
          color: Colors.redAccent,
          borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(40),
              bottomRight: Radius.circular(40))),
      child: const Padding(
        padding: EdgeInsets.only(top: 70, left: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(
              'Selamat Datang!',
              style: TextStyle(
                  fontFamily: 'Raleway',
                  fontSize: 32,
                  fontWeight: FontWeight.w700,
                  color: Colors.white),
            ),
            Text(
              'Mari Lebih Mengenal Pakaian Adat Indonesia',
              style: TextStyle(
                  fontFamily: 'Raleway', fontSize: 18, color: Colors.white),
            )
          ],
        ),
      ));
}
