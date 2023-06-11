import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
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
              spacing: 8,
              runSpacing: 8,
              children: [
                MyPhotoGrid(
                    imgLink:
                        'https://media.istockphoto.com/id/931479532/photo/mountain-valley-during-sunrise-beutiful-natural-landsscape-in-the-summer-time.jpg?s=612x612&w=0&k=20&c=ND9k1tgsUbvsjylYrniloA_C8ICA4GXFZP-8dgvzDxY='),
                MyPhotoGrid(
                    imgLink:
                        'https://cdn.pixabay.com/photo/2015/04/23/22/00/tree-736885_1280.jpg'),
                MyPhotoGrid(
                    imgLink:
                        'https://images.unsplash.com/reserve/Af0sF2OS5S5gatqrKzVP_Silhoutte.jpg?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=1000&q=80'),
                MyPhotoGrid(
                    imgLink:
                        'https://www.simplilearn.com/ice9/free_resources_article_thumb/what_is_image_Processing.jpg'),
                MyPhotoGrid(
                    imgLink:
                        'https://cdn.pixabay.com/photo/2015/04/19/08/32/marguerite-729510_1280.jpg'),
                MyPhotoGrid(
                    imgLink:
                        'https://i0.wp.com/www.flutterbeads.com/wp-content/uploads/2022/01/add-image-in-flutter-hero.png?fit=2850%2C1801&ssl=1'),
              ],
            ),
            ListTile(
              title: const Text('Sample Photo 1'),
              subtitle: const Text('Category 1'),
              leading: Image.network(
                'https://cdn.pixabay.com/photo/2015/04/23/22/00/tree-736885_1280.jpg',
                fit: BoxFit.cover,
                width: 40,
                height: 40,
              ),
            ),
            ListTile(
              title: const Text('Sample Photo 2'),
              subtitle: const Text('Category 2'),
              leading: Image.network(
                'https://cdn.pixabay.com/photo/2015/04/23/22/00/tree-736885_1280.jpg',
                fit: BoxFit.cover,
                width: 40,
                height: 40,
              ),
            ),
            ListTile(
              title: const Text('Sample Photo 3'),
              subtitle: const Text('Category 3'),
              leading: Image.network(
                'https://cdn.pixabay.com/photo/2015/04/23/22/00/tree-736885_1280.jpg',
                fit: BoxFit.cover,
                width: 40,
                height: 40,
              ),
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
}

class MyPhotoGrid extends StatefulWidget {
  String imgLink;

  MyPhotoGrid({required this.imgLink});

  @override
  State<MyPhotoGrid> createState() => _MyPhotoGridState();
}

class _MyPhotoGridState extends State<MyPhotoGrid> {
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        padding: EdgeInsets.zero,
      ),
      onPressed: () {
        setState(() {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
              content: Text('Clicked on photo!'),
            ),
          );
        });
      },
      child: Container(
        height: 100,
        width: 100,
        child: Stack(
          children: [
            Image.network(
              width: 100,
              height: 100,
              widget.imgLink,
              fit: BoxFit.cover,
            ),
            Positioned(
              bottom: 0,
              left: 15,
              child: Container(
                color: Colors.black.withOpacity(0.5),
                padding:
                    const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                child: const Text(
                  'Caption',
                  textAlign: TextAlign.center,
                  style: TextStyle(color: Colors.white),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
