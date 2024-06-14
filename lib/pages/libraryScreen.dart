import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';
import 'package:nyimbo_player/utils/font.dart';
import 'package:iconsax/iconsax.dart';

class LibraryScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.only(left:8.0,right:8.0),
        child: CustomScrollView(
          slivers: <Widget>[
            SliverAppBar(
              backgroundColor: Colors.black,
              pinned: true,
              expandedHeight: 120.0,
              leading:CircleAvatar(
                backgroundColor: Color.fromARGB(255, 46, 46, 46),
                child: Icon(Iconsax.mirror,color:Colors.grey),
              ),
              flexibleSpace: FlexibleSpaceBar(
                title: Text(
                  'Your Library',
                  style: FontStyles.heading1,
                ),
                centerTitle: true,
              ),
              actions: <Widget>[
                IconButton(
                  icon: Icon(Iconsax.search_favorite, color:Colors.white),
                  onPressed: () {
                    // Implement your search action here
                  },
                ),
                IconButton(
                  icon: Icon(Iconsax.add,color: Colors.white,),
                  onPressed: () {
                    // Implement your add action here
                  },
                ),
              ],
            ),
            SliverList(
              delegate: SliverChildBuilderDelegate(
                (BuildContext context, int index) {
                  return Shimmer.fromColors(
                    baseColor: Color.fromARGB(255, 50, 47, 47),
                    highlightColor: Color.fromARGB(255, 94, 94, 94),
                    child: ListTile(
                      leading: CircleAvatar(
                        backgroundColor: Color.fromARGB(255, 66, 65, 65),
                        radius: 30,
                        child: Icon(Icons.music_note, color: Colors.white),
                      ),
                      title: Container(
                        height: 50,
                        color: Colors.grey[300],
                      ),
                      subtitle: Container(
                        height: 16,
                        color: Colors.grey[300],
                      ),
                    ),
                  );
                },
                childCount: 10, // Number of shimmer items
              ),
            ),
          ],
        ),
      ),
    );
  }
}
