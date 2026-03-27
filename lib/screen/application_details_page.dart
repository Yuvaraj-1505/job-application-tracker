import 'package:flutter/material.dart';

class ApplicationDetailsPage extends StatelessWidget {
  final String company;
  final String position;
  final String location;
  final String salary;

  const ApplicationDetailsPage({
    super.key,
    required this.company,
    required this.position,
    required this.location,
    required this.salary,
  });

  Widget buildCard({required String title, required List<Widget> children}) {
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      elevation: 3,
      margin: EdgeInsets.symmetric(vertical: 10),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(title,
                style: TextStyle(
                    fontSize: 16, fontWeight: FontWeight.bold)),
            SizedBox(height: 10),
            ...children
          ],
        ),
      ),
    );
  }

  Widget infoRow(IconData icon, String label, String value) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 6.0),
      child: Row(
        children: [
          Icon(icon, color: Colors.blue),
          SizedBox(width: 10),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(label, style: TextStyle(color: Colors.grey)),
              Text(value,
                  style: TextStyle(
                      fontSize: 14, fontWeight: FontWeight.w500)),
            ],
          )
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Application Details"),
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () => Navigator.pop(context),
        ),
        backgroundColor: Colors.blue,
      ),
      body: Padding(
        padding: const EdgeInsets.all(12.0),
        child: ListView(
          children: [
            buildCard(
              title: "Company Information",
              children: [
                infoRow(Icons.business, "Company", company),
                infoRow(Icons.work, "Position", position),
                infoRow(Icons.location_on, "Location", location),
                infoRow(Icons.attach_money, "Salary", salary),
              ],
            ),
            // You can add more cards here if needed
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.purple,
        child: Icon(Icons.edit),
        onPressed: () {},
      ),
    );
  }
}