import 'package:flutter/material.dart';

import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:plntz/model/layout_object.dart';
import 'package:plntz/widgets/zoomable_wrapper_widget.dart';

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
        child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Expanded(
                flex: 8,
                child: ZoomableWidget(
                  key: const Key("asdfasfd"),
                  child: Stack(
                    children: [
                      Container(width: 200, height: 200, color: Colors.amber.shade100),
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
              ),
              Expanded(
                  flex: 2,
                  child: Container(
                    color: Colors.brown,
                    child: const Text("Menu with placable items"),
                  ))
            ]),
      ),
    );
  }
}
