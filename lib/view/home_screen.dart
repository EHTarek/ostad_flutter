import 'package:flutter/material.dart';

import '../model/contact_model.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<ContactModel> contactList = [
    ContactModel(
        name: 'John Doe', email: 'john.doe@gmail.com', phone: '+9900949422479'),
    ContactModel(
        name: 'John Smith',
        email: 'john.smith@gmail.com',
        phone: '+9900812751208'),
    ContactModel(
        name: 'Alice Johnson',
        email: 'alice.johnson@gmail.com',
        phone: '+99005189528953'),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffffffff),
      appBar: AppBar(
        title: const Text('Contact List'),
        centerTitle: true,
      ),
      body: ListView.builder(
        itemCount: contactList.length,
        itemBuilder: (context, index) => ListTile(
          title: Text(contactList[index].name),
          onTap: () {
            showModalBottomSheet(
              context: context,
              builder: (_) => Container(
                width: double.maxFinite,
                padding: const EdgeInsets.all(20.0),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'Contact Details',
                      style:
                          TextStyle(fontSize: 26, fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(height: 20),
                    Text('Name: ${contactList[index].name}'),
                    Text('Email: ${contactList[index].email}'),
                    Text('Phone Number: ${contactList[index].phone}'),
                    const SizedBox(height: 20),
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
