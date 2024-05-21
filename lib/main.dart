import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Advanced Custom Scroll View Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: AdvancedCustomScrollView(),
    );
  }
}

class AdvancedCustomScrollView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            expandedHeight: 250.0,
            floating: false,
            pinned: true,
            flexibleSpace: FlexibleSpaceBar(
              title: Text('Advanced Custom Scroll View'),
              background: Image.network(
                'https://flutter.dev/assets/homepage/carousel/slide_1-layer_0-2fcecc8d5c65b0f51cc1642edcd6c4fc175a17494939e379f912bc02e3f4dd67.png',
                fit: BoxFit.cover,
              ),
            ),
          ),
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Text(
                'Welcome to the advanced custom scroll view demo! This demo shows how to combine various slivers to create a complex scrolling experience.',
                style: TextStyle(fontSize: 18.0),
              ),
            ),
          ),
          SliverGrid(
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              mainAxisSpacing: 10.0,
              crossAxisSpacing: 10.0,
              childAspectRatio: 2.0,
            ),
            delegate: SliverChildBuilderDelegate(
                  (context, index) {
                return Container(
                  alignment: Alignment.center,
                  color: index.isEven ? Colors.blue : Colors.green,
                  child: Text(
                    'Grid Item #$index',
                    style: TextStyle(color: Colors.white),
                  ),
                );
              },
              childCount: 10,
            ),
          ),
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Text(
                'Here is a list of items below:',
                style: TextStyle(fontSize: 18.0),
              ),
            ),
          ),
          SliverList(
            delegate: SliverChildBuilderDelegate(
                  (context, index) {
                return ListTile(
                  leading: Icon(Icons.label),
                  title: Text('List Item #$index'),
                  subtitle: Text('Subtitle for item #$index'),
                );
              },
              childCount: 20,
            ),
          ),
        ],
      ),
    );
  }
}
