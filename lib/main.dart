import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Flutter ListView Swipe'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(widget.title),
        ),
        body: MyListView()
        // ListView.builder(
        //   itemCount: 10,
        //   itemBuilder: (context, index) {
        //     return MyListItem(index: index);
        //   },
        // ),
        );
  }
}

class MyListItem extends StatefulWidget {
  final int index;

  const MyListItem({Key? key, required this.index}) : super(key: key);

  @override
  State<MyListItem> createState() => _MyListItemState();
}

class _MyListItemState extends State<MyListItem> {
  bool isEditing = false;

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 300),
      transform: Matrix4.translationValues(isEditing ? -50 : 0, 0, 0),
      child: ListTile(
        leading: GestureDetector(
          onTap: () {
            setState(() {
              isEditing = !isEditing;
            });
          },
          child: const Icon(Icons.menu),
        ),
        title: Text('List Item ${widget.index}'),
        trailing: isEditing
            ? IconButton(
                icon: const Icon(Icons.edit),
                onPressed: () {
                  // 편집 기능 수행
                },
              )
            : null,
      ),
    );
  }
}

class MyListView extends StatefulWidget {
  const MyListView({Key? key}) : super(key: key);

  @override
  State<MyListView> createState() => _MyListViewState();
}

class _MyListViewState extends State<MyListView> {
  bool _isExpanded = false;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: 10,
      itemBuilder: (context, index) {
        return ExpansionTile(
          title: Text('Item $index'),
          trailing: Icon(
            _isExpanded ? Icons.expand_less : Icons.expand_more,
          ),
          onExpansionChanged: (bool expanded) {
            setState(() {
              _isExpanded = expanded;
            });
          },
          children: <Widget>[
            ListTile(
              title: Text('Expanded Item $index'),
            ),
          ],
        );
      },
    );
  }
}
