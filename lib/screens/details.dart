import 'package:flutter/material.dart';
import 'package:clipboard/clipboard.dart';

class Details extends StatefulWidget {
  final String text;
  Details(this.text);

  @override
  State<Details> createState() => _DetailsState();
}

class _DetailsState extends State<Details> {
  final GlobalKey<ScaffoldState> _key = new GlobalKey<ScaffoldState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _key,
      appBar: AppBar(
        title: Text("Details"),
        actions: [
          IconButton(
            onPressed: () {
              FlutterClipboard.copy(widget.text).then((value) => _key
                  .currentState!
                  .showBottomSheet((context) => Text("Copied!")));
            },
            icon: Icon(Icons.copy),
          ),
        ],
      ),
      body: Container(
        padding: EdgeInsets.all(8),
        alignment: Alignment.center,
        height: double.infinity,
        width: double.infinity,
        child: SelectableText(
            widget.text.isEmpty ? "No Text Available" : widget.text),
      ),
    );
  }
}
