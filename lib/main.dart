import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomePage(),
    );
  }
}

//
// ================= HOME PAGE =================
//

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Job Applications"),
        centerTitle: true,
        backgroundColor: Colors.blue,
      ),

      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.purple,
        child: const Icon(Icons.add),

        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) =>
                  const AddApplicationScreen(),
            ),
          );
        },
      ),

      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [

          Card(
            elevation: 4,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(15),
            ),
            child: const ListTile(
              leading: CircleAvatar(
                backgroundColor: Colors.blue,
                child: Icon(Icons.work, color: Colors.white),
              ),
              title: Text(
                "Software Developer",
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              subtitle: Text("Codeaj"),
              trailing: Icon(Icons.arrow_forward),
            ),
          ),

          const SizedBox(height: 15),

          Card(
            elevation: 4,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(15),
            ),
            child: const ListTile(
              leading: CircleAvatar(
                backgroundColor: Colors.green,
                child: Icon(Icons.work, color: Colors.white),
              ),
              title: Text(
                "Flutter Developer",
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              subtitle: Text("Infosys"),
              trailing: Icon(Icons.arrow_forward),
            ),
          ),
        ],
      ),
    );
  }
}

//
// ================= ADD APPLICATION SCREEN =================
//

class AddApplicationScreen extends StatelessWidget {
  const AddApplicationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Add Application"),
        elevation: 0,
        flexibleSpace: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              colors: [Colors.blue, Colors.purple],
            ),
          ),
        ),
      ),

      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),

        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [

            sectionTitle("Company Information"),

            inputCard(Icons.business, "Company Name"),
            inputCard(Icons.work, "Position"),
            inputCard(Icons.location_on, "Location"),
            inputCard(Icons.attach_money, "Salary Range"),

            sectionTitle("Application Details"),

            dropdownCard(),
            dateCard(),

            inputCard(
              Icons.description,
              "Job Description",
              maxLines: 3,
            ),

            sectionTitle("Contact Information"),

            inputCard(Icons.person, "Contact Person"),
            inputCard(Icons.email, "Contact Email"),

            sectionTitle("Notes"),

            inputCard(
              Icons.note,
              "Additional Notes",
              maxLines: 4,
            ),
          ],
        ),
      ),
    );
  }

  //
  // Section Title
  //

  Widget sectionTitle(String title) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),

      child: Text(
        title,
        style: const TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }

  //
  // Input Field Card
  //

  Widget inputCard(
    IconData icon,
    String hint, {
    int maxLines = 1,
  }) {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
      ),

      margin: const EdgeInsets.symmetric(vertical: 6),

      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 12),

        child: TextField(
          maxLines: maxLines,

          decoration: InputDecoration(
            icon: Icon(icon, color: Colors.blue),
            hintText: hint,
            border: InputBorder.none,
          ),
        ),
      ),
    );
  }

  //
  // Dropdown
  //

  Widget dropdownCard() {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
      ),

      margin: const EdgeInsets.symmetric(vertical: 6),

      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 12),

        child: DropdownButtonFormField<String>(
          value: "Applied",

          decoration: const InputDecoration(
            icon: Icon(Icons.flag, color: Colors.blue),
            border: InputBorder.none,
          ),

          items: const [
            DropdownMenuItem(
              value: "Applied",
              child: Text("Applied"),
            ),
            DropdownMenuItem(
              value: "Interview",
              child: Text("Interview"),
            ),
            DropdownMenuItem(
              value: "Offer",
              child: Text("Offer"),
            ),
            DropdownMenuItem(
              value: "Rejected",
              child: Text("Rejected"),
            ),
          ],

          onChanged: (value) {},
        ),
      ),
    );
  }

  //
  // Date Card
  //

  Widget dateCard() {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
      ),

      margin: const EdgeInsets.symmetric(vertical: 6),

      child: ListTile(
        leading: const Icon(
          Icons.calendar_today,
          color: Colors.blue,
        ),

        title: const Text(
          "Applied Date: 20 Oct 2025",
        ),

        onTap: () {},
      ),
    );
  }
}