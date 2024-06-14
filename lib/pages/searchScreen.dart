import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

import '../utils/font.dart';

class SearchScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: <Widget>[
          SliverAppBar(
            backgroundColor: Colors.black,
            pinned: true,
            expandedHeight: 120.0,
            flexibleSpace: FlexibleSpaceBar(
              titlePadding: EdgeInsets.only(left: 16, bottom: 16),
              title: Align(
                alignment: Alignment.topLeft,
                child: Text(
                  'Search',
                  style: FontStyles.heading1,
                ),
              ),
            ),
            bottom: PreferredSize(
              preferredSize: Size.fromHeight(60.0),
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: Row(
                  children: <Widget>[
                    Expanded(
                      child: TextField(
                        decoration: InputDecoration(
                          hintText: 'Search',
                          hintStyle: FontStyles.bodyText2,
                          filled: true,
                          fillColor: Colors.white,
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(5.0),
                            borderSide: BorderSide.none,
                          ),
                          prefixIcon: Icon(Iconsax.search_favorite, color: Colors.black38),
                        ),
                      ),
                    ),
                    SizedBox(width: 10),
                    IconButton(
                      icon: Icon(Iconsax.microphone),
                      onPressed: () {},
                    ),
                  ],
                ),
              ),
            ),
          ),
          SliverList(
            delegate: SliverChildBuilderDelegate(
              (BuildContext context, int index) {
                return ListTile(
                  title: Text('Item #$index'),
                );
              },
              childCount: 50, // Number of items in the list
            ),
          ),
        ],
      ),
    );
  }
}
