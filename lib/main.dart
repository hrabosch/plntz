import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

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
    const List<Icon> placeableIconsMock = [
      Icon(Icons.bakery_dining),
      Icon(Icons.ac_unit_rounded),
      Icon(Icons.dashboard),
      Icon(Icons.face),
      Icon(Icons.handshake),
      Icon(Icons.mobile_off)
    ];
    return Scaffold(
      body: Center(
        child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Expanded(
                  flex: 8,
                  child: Container(
                    padding: const EdgeInsets.all(8.0),
                    decoration: const BoxDecoration(
                      color: Color.fromARGB(255, 182, 194, 141),
                    ),
                    child: ZoomableWidget(
                      key: const Key("asdfasfd"),
                      child: Stack(
                        children: [
                          Container(
                            width: 200,
                            height: 200,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10.0),
                                color: const Color.fromARGB(255, 218, 218, 218),
                                border: Border.all(color: Colors.black, width: 2)),
                          ),
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
                  )),
              Expanded(
                  // flex: 2,
                  child: Container(
                      height: 120,
                      color: Colors.brown,
                      child: ListView.builder(
                        itemCount: placeableIconsMock.length,
                        physics: const ClampingScrollPhysics(),
                        scrollDirection: Axis.horizontal,
                        shrinkWrap: true,
                        itemBuilder: (BuildContext context, int index) {
                          return Container(
                            width: 100,
                            child: Card(elevation: 10, child: placeableIconsMock[index]),
                          );
                        },
                      )))
            ]),
      ),
    );
  }
}
