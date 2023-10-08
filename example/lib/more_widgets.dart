import 'package:flutter/material.dart';
import 'package:platform_ui/platform_ui.dart';

class MoreWidgets extends StatefulWidget {
  const MoreWidgets({super.key});

  @override
  State<MoreWidgets> createState() => _MoreWidgetsState();
}

class _MoreWidgetsState extends State<MoreWidgets> {
  @override
  Widget build(BuildContext context) {
    return const Center(
      child: SizedBox(
        width: 200,
        height: 200,
        child: Card(
          elevation: 8.0,
          child: Center(
              child: PlatformText(
            "Text in Card",
            style: TextStyle(color: Colors.blue),
          )),
        ),
      ),
    );
  }
}
