import 'package:flutter/material.dart';
import 'package:project_3/Widgets/widget_layout_builder.dart';

void main() {
  runApp(const AnimationNation());
}

class AnimationNation extends StatelessWidget {
  const AnimationNation({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'AnimationNationRoutes',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSwatch().copyWith(
          primary: Colors.green,
          secondary: Colors.greenAccent,
          tertiary: Colors.blueGrey,
        ),
        useMaterial3: true
      ),
      home: const WidgetLayoutBuilder(),
    );
  }
}
