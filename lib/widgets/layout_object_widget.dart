import 'package:flutter/widgets.dart';
import 'package:plntz/model/layout_object.dart';

class LayoutObjectWidget extends StatelessWidget {
  final LayoutObject layoutObject;

  const LayoutObjectWidget({required Key key, required this.layoutObject}) : super(key: key);

  @override
  Widget build(BuildContext) {
    return Positioned(
      top: layoutObject.offset.dx,
      left: layoutObject.offset.dy,
      child: Container(
        color: layoutObject.backgroundColor,
        child: Text(layoutObject.name),
      ),
    );
  }
}
