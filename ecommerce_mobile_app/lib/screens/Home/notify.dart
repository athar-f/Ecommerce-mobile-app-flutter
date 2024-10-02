import 'package:flutter/material.dart';

class Notify extends StatefulWidget {
  const Notify({super.key});

  @override
  State<Notify> createState() => _NotifyState();
}

class _NotifyState extends State<Notify> {
  List<String> title = ['Order', 'Permotion', 'Feed Notification'];
  List<String> subtitle = [
    'Order Status, Tracking Updates',
    'Discount Sales Announcement, Price Alert ',
    'Hey! You Buy A New Product'
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Notifications'),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 10, left: 20),
            child: Text('New'),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: title.length,
              itemBuilder: (context, index) {
                return ListTile(
                  leading: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(30),
                    ),
                    child: CircleAvatar(),
                  ),
                  title: Text(title[index]),
                  subtitle: Text('your order has been replace'),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
