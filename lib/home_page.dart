import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<String> myImageList = [
    'https://media.istockphoto.com/id/931479532/photo/mountain-valley-during-sunrise-beutiful-natural-landsscape-in-the-summer-time.jpg?s=612x612&w=0&k=20&c=ND9k1tgsUbvsjylYrniloA_C8ICA4GXFZP-8dgvzDxY=',
    'https://cdn.pixabay.com/photo/2015/04/23/22/00/tree-736885_1280.jpg',
    'https://images.unsplash.com/reserve/Af0sF2OS5S5gatqrKzVP_Silhoutte.jpg?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=1000&q=80',
    'https://www.simplilearn.com/ice9/free_resources_article_thumb/what_is_image_Processing.jpg',
    'https://cdn.pixabay.com/photo/2015/04/19/08/32/marguerite-729510_1280.jpg',
    'https://i0.wp.com/www.flutterbeads.com/wp-content/uploads/2022/01/add-image-in-flutter-hero.png?fit=2850%2C1801&ssl=1'
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Photo Gallery'),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              padding: const EdgeInsets.symmetric(vertical: 10),
              width: double.infinity,
              child: const Text(
                'Welcome to My Photo Gallery!',
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
            ),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
              child: const TextField(
                decoration: InputDecoration(
                  border: OutlineInputBorder(borderSide: BorderSide()),
                  prefixIcon: Icon(Icons.search),
                  hintText: 'Search',
                ),
              ),
            ),
            Wrap(
              spacing: 5,
              runSpacing: 5,
              children: [
                for (int x = 0; x < myImageList.length; x++) myImageGrid(x)
              ],
            ),
            ListView(
              primary: false,
              shrinkWrap: true,
              children: [
                for (int x = 0; x < myImageList.length; x++)
                  ListTile(
                    title: Text('Sample Photo ${x + 1}'),
                    subtitle: Text('Category ${x + 1}'),
                    leading: Image.network(
                      myImageList[x].toString(),
                      fit: BoxFit.cover,
                      width: 40,
                      height: 40,
                    ),
                  ),
              ],
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          setState(() {
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(content: Text('Photo Uploaded Successfully!')),
            );
          });
        },
        child: const Icon(Icons.cloud_upload),
      ),
    );
  }

  ElevatedButton myImageGrid(int index) {
    double size = 100;
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        padding: EdgeInsets.zero,
      ),
      onPressed: () {
        setState(() {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text('Clicked on photo!')),
          );
        });
      },
      child: Stack(
        children: [
          Container(
            height: size,
            width: size,
            child:
                Image.network(myImageList[index].toString(), fit: BoxFit.cover),
          ),
          Positioned(
            width: size,
            height: size,
            child: Align(
              alignment: Alignment.bottomCenter,
              child: Container(
                padding: EdgeInsets.all(8),
                color: Colors.black.withOpacity(0.5),
                child: Text('Caption'),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
