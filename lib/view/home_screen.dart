import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  final List<String> imgList = [
    'https://placehold.co/150x150.png',
    'https://placehold.co/150x150.png',
    'https://placehold.co/150x150.png',
    'https://placehold.co/150x150.png',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('News Feed'),
      ),
      body: LayoutBuilder(
        builder: (context, constraints) {
          if (constraints.maxWidth > 600) {
            return _buildGridView();
          } else {
            return _buildListView();
          }
        },
      ),
    );
  }

  Widget _buildListView() {
    return ListView.builder(
      itemCount: imgList.length,
      itemBuilder: (context, index) {
        return _newsCard(imgList[index]);
      },
    );
  }

  Widget _buildGridView() {
    return GridView.builder(
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        crossAxisSpacing: 8.0,
        mainAxisSpacing: 8.0,
      ),
      itemCount: imgList.length,
      itemBuilder: (context, index) {
        return _newsCard(imgList[index]);
      },
    );
  }

  Widget _newsCard(String img) {
    return Card(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(
            height: 150,
            width: 150,
            child: Image.network(img),
          ),
        ],
      ),
    );
  }
}
