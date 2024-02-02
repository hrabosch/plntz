import 'package:flutter/material.dart';

import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:plntz/model/layout_object.dart';

import 'widgets/layout_object_widget.dart';

void main() {
  runApp(
    ProviderScope(
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        home: GardenLayout(),
      ),
    ),
  );
}

class GardenLayout extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    List<LayoutObject> layoutObjects = [];
    return Scaffold(
      body: Center(
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(width: 600, height: 400, color: Colors.amber.shade100),
            ...layoutObjects
                .map(
                  (layoutObject) => Positioned(
                    top: layoutObject.offset.dy,
                    left: layoutObject.offset.dx,
                    child: GestureDetector(
                      // TODO fix unique keys
                      child: LayoutObjectWidget(
                        key: const Key("aaa"),
                        layoutObject: layoutObject,
                      ),
                    ),
                  ),
                )
                .toList(),
          ],
        ),
      ),
    );
  }
}
