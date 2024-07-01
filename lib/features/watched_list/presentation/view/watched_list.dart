import 'package:flutter/material.dart';

import 'widget/watched_list_body.dart';

class WatchedList extends StatelessWidget {
  const WatchedList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.all(16.0),
      child: SafeArea(
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.all(16.0),
              child: Text(
                'WatchList',
                style: TextStyle(fontSize: 20),
              ),
            ),
            WatchedListBody(),
          ],
        ),
      ),
    );
  }
}
