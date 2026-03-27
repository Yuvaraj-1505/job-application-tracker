import 'package:flutter/material.dart';
import 'application_details_page.dart';

class HomePage extends StatelessWidget {
  final List<Map<String, String>> jobs = [
    {
      "company": "codeAj Marketplace",
      "position": "Python Developer",
      "location": "HSR Layout",
      "salary": "600000"
    },
    {
      "company": "TechWorld",
      "position": "Software Developer",
      "location": "MG Road",
      "salary": "500000"
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Job Applications"), backgroundColor: Colors.blue),
      body: ListView.builder(
        itemCount: jobs.length,
        itemBuilder: (context, index) {
          final job = jobs[index];
          return Card(
            margin: EdgeInsets.all(10),
            child: ListTile(
              title: Text(job["position"]!),
              subtitle: Text(job["company"]!),
              trailing: Icon(Icons.arrow_forward),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (_) => ApplicationDetailsPage(
                      company: job["company"]!,
                      position: job["position"]!,
                      location: job["location"]!,
                      salary: job["salary"]!,
                    ),
                  ),
                );
              },
            ),
          );
        },
      ),
    );
  }
}