import 'package:flutter/material.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("My Profile"),
        centerTitle: true,
        backgroundColor: Colors.deepPurple,
        foregroundColor: Colors.white,
      ),

      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [
              Colors.white,
              Color(0xFFF7F1FF),
              Color(0xFFE5D3FF),
            ],
          ),
        ),

        child: SingleChildScrollView(
          padding: const EdgeInsets.all(20),

          child: Column(
            children: [

              const SizedBox(height: 20),

              CircleAvatar(
                radius: 60,
                backgroundColor: Colors.deepPurple.shade100,
                child: const Icon(
                  Icons.person,
                  size: 70,
                  color: Colors.deepPurple,
                ),
              ),

              const SizedBox(height: 20),

              const Text(
                "Afshan",
                style: TextStyle(
                  fontSize: 28,
                  fontWeight: FontWeight.bold,
                ),
              ),

              const SizedBox(height: 8),

              const Text(
                "afshan@email.com",
                style: TextStyle(
                  color: Colors.grey,
                  fontSize: 16,
                ),
              ),

              const SizedBox(height: 35),

              Row(
                children: [

                  Expanded(
                    child: _buildStatCard(
                      "Tasks",
                      "0",
                      Icons.task_alt,
                      Colors.deepPurple,
                    ),
                  ),

                  const SizedBox(width: 15),

                  Expanded(
                    child: _buildStatCard(
                      "Done",
                      "0",
                      Icons.check_circle,
                      Colors.green,
                    ),
                  ),

                  const SizedBox(width: 15),

                  Expanded(
                    child: _buildStatCard(
                      "Pending",
                      "0",
                      Icons.pending_actions,
                      Colors.orange,
                    ),
                  ),
                ],
              ),

              const SizedBox(height: 30),

              _buildTile(
                Icons.phone,
                "Phone",
                "+91 9876543210",
              ),

              _buildTile(
                Icons.email,
                "Email",
                "afshan@email.com",
              ),

              _buildTile(
                Icons.info,
                "About",
                "TaskFlow v1.0",
              ),

              const SizedBox(height: 40),

              SizedBox(
                width: double.infinity,
                height: 55,

                child: ElevatedButton.icon(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.red,
                    foregroundColor: Colors.white,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15),
                    ),
                  ),

                  onPressed: () {
                    Navigator.pop(context);
                  },

                  icon: const Icon(Icons.logout),

                  label: const Text(
                    "Logout",
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  static Widget _buildStatCard(
      String title,
      String value,
      IconData icon,
      Color color,
      ) {
    return Container(
      padding: const EdgeInsets.all(15),

      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(18),
        boxShadow: const [
          BoxShadow(
            blurRadius: 10,
            color: Colors.black12,
          ),
        ],
      ),

      child: Column(
        children: [

          Icon(
            icon,
            color: color,
            size: 30,
          ),

          const SizedBox(height: 10),

          Text(
            value,
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
              color: color,
            ),
          ),

          const SizedBox(height: 5),

          Text(title),
        ],
      ),
    );
  }

  static Widget _buildTile(
      IconData icon,
      String title,
      String subtitle,
      ) {
    return Card(
      margin: const EdgeInsets.only(bottom: 15),
      elevation: 3,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15),
      ),

      child: ListTile(
        leading: CircleAvatar(
          backgroundColor: Colors.deepPurple.shade100,
          child: Icon(
            icon,
            color: Colors.deepPurple,
          ),
        ),
        title: Text(title),
        subtitle: Text(subtitle),
      ),
    );
  }
}