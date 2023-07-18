import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final List<String> imgList = [
    'https://placehold.co/150x150.png',
    'https://placehold.co/150x150.png',
    'https://placehold.co/150x150.png',
    'https://placehold.co/150x150.png',
    'https://placehold.co/150x150.png',
    'https://placehold.co/150x150.png',
    'https://placehold.co/150x150.png',
    'https://placehold.co/150x150.png',
    'https://placehold.co/150x150.png',
    'https://placehold.co/150x150.png',
    'https://placehold.co/150x150.png',
    'https://placehold.co/150x150.png',
    'https://placehold.co/150x150.png',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Profile'),
      ),
      body: OrientationBuilder(
        builder: (context, orientation) {
          return orientation == Orientation.portrait
              ? _buildPortraitLayout(context)
              : _buildLandscapeLayout(context);
        },
      ),
    );
  }

  Widget _buildPortraitLayout(BuildContext context) {
    double height = MediaQuery.sizeOf(context).height;
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            padding: const EdgeInsets.all(5),
            height: height / 2,
            child: CircleAvatar(
              backgroundImage: const NetworkImage(
                'https://images.unsplash.com/photo-1575936123452-b67c3203c357?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8Mnx8aW1hZ2V8ZW58MHx8MHx8fDA%3D&w=1000&q=80',
              ),
              radius: height / 2,
            ),
          ),
          screenBottom(),
        ],
      ),
    );
  }

  ListView screenBottom() {
    return ListView(
      children: [
        const Text(
          'John Doe',
          style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
        ),
        const Padding(
          padding: EdgeInsets.all(10.0),
          child: Text(
              'An image is a visual representation of something. An image can be a two-dimensional (2D) representation, such as a drawing, painting, or photograph.'),
        ),
        GridView.builder(
          itemCount: imgList.length,
          shrinkWrap: true,
          primary: false,
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              mainAxisSpacing: 5,
              crossAxisSpacing: 5,
              crossAxisCount: 3),
          itemBuilder: (context, index) {
            return SizedBox(
              width: 100,
              height: 100,
              child: Image.network(imgList[index]),
            );
          },
        ),
      ],
    );
  }

  Widget _buildLandscapeLayout(BuildContext context) {
    double width = MediaQuery.sizeOf(context).width;
    return Row(
      mainAxisSize: MainAxisSize.max,
      children: [
        Container(
          padding: const EdgeInsets.all(5),
          height: width / 3,
          width: width / 3,
          child: CircleAvatar(
            backgroundImage: const NetworkImage(
              'https://images.unsplash.com/photo-1575936123452-b67c3203c357?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8Mnx8aW1hZ2V8ZW58MHx8MHx8fDA%3D&w=1000&q=80',
            ),
            radius: width / 3,
          ),
        ),
        Container(
            padding: const EdgeInsets.all(5),
            width: width/1.5,
            child: screenBottom()),
      ],
    );
  }
}



/*
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final List<String> imgList = [
    'https://placehold.co/150x150.png',
    'https://placehold.co/150x150.png',
    'https://placehold.co/150x150.png',
    'https://placehold.co/150x150.png',
    'https://placehold.co/150x150.png',
    'https://placehold.co/150x150.png',
    'https://placehold.co/150x150.png',
    'https://placehold.co/150x150.png',
    'https://placehold.co/150x150.png',
    'https://placehold.co/150x150.png',
    'https://placehold.co/150x150.png',
    'https://placehold.co/150x150.png',
    'https://placehold.co/150x150.png',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Profile'),
      ),
      body: OrientationBuilder(
        builder: (context, orientation) {
          return orientation == Orientation.portrait
              ? _buildPortraitLayout(context)
              : _buildLandscapeLayout(context);
        },
      ),
    );
  }

  Widget _buildPortraitLayout(BuildContext context) {
    double height = MediaQuery.sizeOf(context).height;
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            padding: const EdgeInsets.all(5),
            height: height / 2,
            child: CircleAvatar(
              backgroundImage: const NetworkImage(
                'https://images.unsplash.com/photo-1575936123452-b67c3203c357?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8Mnx8aW1hZ2V8ZW58MHx8MHx8fDA%3D&w=1000&q=80',
              ),
              radius: height / 2,
            ),
          ),
          screenBottom(),
        ],
      ),
    );
  }

  ListView screenBottom() {
    return ListView(
          children: [
            const Text(
              'John Doe',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            const Padding(
              padding: EdgeInsets.all(10.0),
              child: Text(
                  'An image is a visual representation of something. An image can be a two-dimensional (2D) representation, such as a drawing, painting, or photograph.'),
            ),
            GridView.builder(
              itemCount: imgList.length,
              shrinkWrap: true,
              primary: false,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                mainAxisSpacing: 5,
                crossAxisSpacing: 5,
                  crossAxisCount: 3),
              itemBuilder: (context, index) {
                return SizedBox(
                  width: 100,
                  height: 100,
                  child: Image.network(imgList[index]),
                );
              },
            ),
          ],
        );
  }

  Widget _buildLandscapeLayout(BuildContext context) {
    double width = MediaQuery.sizeOf(context).width;
    return Row(
      mainAxisSize: MainAxisSize.max,
      children: [
        Container(
          padding: const EdgeInsets.all(5),
          height: width / 3,
          width: width / 3,
          child: CircleAvatar(
            backgroundImage: const NetworkImage(
              'https://images.unsplash.com/photo-1575936123452-b67c3203c357?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8Mnx8aW1hZ2V8ZW58MHx8MHx8fDA%3D&w=1000&q=80',
            ),
            radius: width / 3,
          ),
        ),
        Container(
            padding: const EdgeInsets.all(5),
            width: width/1.5,
            child: screenBottom()),
      ],
    );
  }
}
*/
