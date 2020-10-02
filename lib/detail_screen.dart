import 'package:flutter/material.dart';
import 'package:submission_kitari/model/traditional_clothes.dart';

class DetailScreen extends StatelessWidget {
  final TraditionalClothes item;

  DetailScreen({@required this.item});

  @override
  Widget build(BuildContext context) {
    final List<String> _tabs = ['Ringkasan', 'Lokasi', 'Foto Lainnya'];
    return Scaffold(
      body: DefaultTabController(
        length: _tabs.length,
        child: NestedScrollView(
          headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
            return <Widget>[
              SliverOverlapAbsorber(
                handle:
                    NestedScrollView.sliverOverlapAbsorberHandleFor(context),
                sliver: SliverAppBar(
                  expandedHeight: 300.0,
                  pinned: true,
                  backgroundColor: Colors.redAccent,
                  forceElevated: innerBoxIsScrolled,
                  flexibleSpace: Stack(
                    children: <Widget>[
                      FlexibleSpaceBar(
                        background: Image.asset(
                          item.imageAsset,
                          fit: BoxFit.cover,
                        ),
                      ),
                      Container(
                        decoration: BoxDecoration(
                            gradient: LinearGradient(
                                begin: Alignment.bottomCenter,
                                end: Alignment.topCenter,
                                colors: [
                              Colors.black45,
                              Colors.black26,
                              Colors.black12,
                            ])),
                      ),
                      FlexibleSpaceBar(
                        titlePadding: EdgeInsets.only(bottom: 65),
                        centerTitle: true,
                        title: Text(
                          item.province,
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 20.0,
                              fontFamily: 'Raleway',
                              fontWeight: FontWeight.w700),
                        ),
                      ),
                    ],
                  ),
                  actions: <Widget>[StarButton()],
                  bottom: TabBar(
                    indicatorColor: Colors.redAccent,
                    tabs: _tabs.map((String name) => Tab(text: name)).toList(),
                  ),
                ),
              ),
            ];
          },
          // Content Tab
          body: TabBarView(children: [
            // Tab Ringkasan
            SafeArea(
              top: false,
              bottom: false,
              child: Builder(builder: (BuildContext context) {
                return CustomScrollView(
                  slivers: <Widget>[
                    SliverOverlapInjector(
                      handle: NestedScrollView.sliverOverlapAbsorberHandleFor(
                          context),
                    ),
                    SliverPadding(
                      padding: const EdgeInsets.all(20.0),
                      sliver: SliverList(
                        delegate: SliverChildListDelegate([
                          Text(
                            item.description,
                            style:
                                TextStyle(fontFamily: 'Raleway', fontSize: 16),
                          ),
                        ]),
                      ),
                    ),
                  ],
                );
              }),
            ),
            // Tab Lokasi
            SafeArea(
              top: false,
              bottom: false,
              child: Builder(
                builder: (BuildContext context) {
                  return CustomScrollView(
                    slivers: <Widget>[
                      SliverOverlapInjector(
                        handle: NestedScrollView.sliverOverlapAbsorberHandleFor(
                            context),
                      ),
                      SliverPadding(
                        padding: const EdgeInsets.all(20.0),
                        sliver: SliverList(
                          delegate: SliverChildListDelegate([
                            Text(
                              'Bendera dan Lambang ' + item.province,
                              style: TextStyle(fontFamily: 'Raleway'),
                            ),
                            SizedBox(height: 20),
                            Image.network(
                              item.imageIslandLogo,
                              loadingBuilder:
                                  (context, child, loadingProgress) {
                                if (loadingProgress == null) return child;
                                return Center(
                                  child: CircularProgressIndicator(
                                    value: loadingProgress.expectedTotalBytes !=
                                            null
                                        ? loadingProgress
                                                .cumulativeBytesLoaded /
                                            loadingProgress.expectedTotalBytes
                                        : null,
                                  ),
                                );
                              },
                            ),
                            SizedBox(height: 20),
                            Text(
                              'Peta ' + item.province,
                              style: TextStyle(fontFamily: 'Raleway'),
                            ),
                            SizedBox(height: 20),
                            Image.network(
                              item.imageIsland,
                              loadingBuilder:
                                  (context, child, loadingProgress) {
                                if (loadingProgress == null) return child;
                                return Center(
                                  child: CircularProgressIndicator(
                                    value: loadingProgress.expectedTotalBytes !=
                                            null
                                        ? loadingProgress
                                                .cumulativeBytesLoaded /
                                            loadingProgress.expectedTotalBytes
                                        : null,
                                  ),
                                );
                              },
                            ),
                          ]),
                        ),
                      ),
                    ],
                  );
                },
              ),
            ),
            // Tab Foto Lainnya
            SafeArea(
              top: false,
              bottom: false,
              child: Builder(builder: (BuildContext context) {
                return CustomScrollView(
                  slivers: <Widget>[
                    SliverOverlapInjector(
                      handle: NestedScrollView.sliverOverlapAbsorberHandleFor(
                          context),
                    ),
                    SliverPadding(
                      padding: const EdgeInsets.all(20.0),
                      sliver: SliverGrid.count(
                        crossAxisCount: 2,
                        mainAxisSpacing: 10,
                        crossAxisSpacing: 10,
                        childAspectRatio: 1,
                        children: item.imageUrls.map((url) {
                          return Card(
                            child: Image.network(
                              url,
                              fit: BoxFit.cover,
                              loadingBuilder:
                                  (context, child, loadingProgress) {
                                if (loadingProgress == null) return child;
                                return Center(
                                  child: CircularProgressIndicator(
                                    value: loadingProgress.expectedTotalBytes !=
                                            null
                                        ? loadingProgress
                                                .cumulativeBytesLoaded /
                                            loadingProgress.expectedTotalBytes
                                        : null,
                                  ),
                                );
                              },
                            ),
                          );
                        }).toList(),
                      ),
                    ),
                  ],
                );
              }),
            ),
          ]),
        ),
      ),
    );
  }
}

Widget contentTab() {
  return SafeArea(
    top: false,
    bottom: false,
    child: Builder(
      builder: (BuildContext context) {
        return CustomScrollView(
          slivers: <Widget>[
            SliverOverlapInjector(
              handle: NestedScrollView.sliverOverlapAbsorberHandleFor(context),
            ),
            SliverPadding(
              padding: const EdgeInsets.all(20.0),
              sliver: SliverGrid.count(
                crossAxisCount: 2,
                mainAxisSpacing: 10,
                crossAxisSpacing: 10,
                childAspectRatio: 1,
                children: [],
              ),
            ),
          ],
        );
      },
    ),
  );
}

class StarButton extends StatefulWidget {
  @override
  _StarButtonState createState() => _StarButtonState();
}

class _StarButtonState extends State<StarButton> {
  bool isStar = false;

  @override
  Widget build(BuildContext context) {
    return IconButton(
      icon: Icon(
        isStar ? Icons.star : Icons.star_border,
        color: Colors.yellow,
      ),
      onPressed: () {
        setState(() {
          isStar = !isStar;
        });
      },
    );
  }
}
