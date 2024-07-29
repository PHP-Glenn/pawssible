import 'package:flutter/material.dart';

class QueueStatusPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // Retrieve arguments
    final String? ownerName = ModalRoute.of(context)!.settings.arguments as String?;

    return Scaffold(
      backgroundColor: Color.fromARGB(255, 236, 238, 242),
      appBar: AppBar(
        title: Text('Queue Status'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Owner Name:',
              style: TextStyle(fontSize: 24),
            ),
            SizedBox(height: 20),
            Container(
              padding: EdgeInsets.all(20),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(5),
              ),
              child: Text(
                ownerName ?? 'Unknown',
                style: TextStyle(fontSize: 18, color: Colors.black),
              ),
            ),
          ],
        ),
      ),
    );
  }
}