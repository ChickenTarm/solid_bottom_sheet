import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:solid_bottom_sheet/solid_bottom_sheet.dart';

void main() {
  testWidgets('Solid bottom sheet unit test', (WidgetTester tester) async {
    final textFinder = find.byKey(Key('text'));
    final headerFinder = find.byKey(Key('header'));
    final bodyFinder = find.byKey(Key('body'));
    final MyApp app = MyApp();

    await tester.pumpWidget(app);

    expect(textFinder, findsNothing);

    tester.tap(headerFinder).then((res) {
      expect(textFinder, findsOneWidget);
    });
  });
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Counter App',
      home: MyHomePage(title: 'Counter App Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Text(
          'Testing Solid bottom sheet',
        ),
      ),
      bottomSheet: SolidBottomSheet(
        headerBar: Container(
          key: Key(("header")),
          color: Theme.of(context).primaryColor,
          height: 50,
          child: Center(
            child: Text("Swipe here"),
          ),
        ),
        body: Container(
          key: Key(("body")),
          color: Colors.white,
          height: 30,
          child: Center(
            child: Text(
              "Body text",
              key: Key(("text")),
              style: Theme.of(context).textTheme.display1,
            ),
          ),
        ),
        toggleVisibilityOnTap: true,
      ),
    );
  }
}
