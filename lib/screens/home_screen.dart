import 'package:flutter/material.dart';
import 'profile_screen.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,

      // ---------------- APP BAR ----------------
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        centerTitle: true,
        title: const Text(
          "Task Reminder",
          style: TextStyle(
            color: Colors.deepPurple,
            fontWeight: FontWeight.bold,
          ),
        ),
        iconTheme: const IconThemeData(
          color: Colors.deepPurple,
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.person),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const ProfileScreen(),
                ),
              );
            },
          ),
        ],
      ),

      // ---------------- BODY ----------------
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [
              Colors.white,
              Color(0xffF8F2FF),
              Color(0xffE8D7FF),
            ],
          ),
        ),

        child: SafeArea(
          child: SingleChildScrollView(
            padding: const EdgeInsets.all(20),

            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [

                // Greeting Card
                Container(
                  padding: const EdgeInsets.all(22),
                  decoration: BoxDecoration(
                    color: Colors.white.withOpacity(.9),
                    borderRadius: BorderRadius.circular(25),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.deepPurple.withOpacity(.08),
                        blurRadius: 20,
                        offset: const Offset(0, 8),
                      ),
                    ],
                  ),

                  child: Row(
                    children: [
                      CircleAvatar(
                        radius: 30,
                        backgroundColor: Colors.deepPurple.shade100,
                        child: const Icon(
                          Icons.person,
                          size: 32,
                          color: Colors.deepPurple,
                        ),
                      ),

                      const SizedBox(width: 18),

                      const Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Hello Afshan 👋",
                              style: TextStyle(
                                fontSize: 28,
                                fontWeight: FontWeight.bold,
                              ),
                            ),

                            SizedBox(height: 6),

                            Text(
                              "Stay productive today ✨",
                              style: TextStyle(
                                fontSize: 16,
                                color: Colors.grey,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),

                const SizedBox(height: 25),

                // Progress Card
                Container(
                  padding: const EdgeInsets.all(22),

                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      colors: [
                        Colors.deepPurple,
                        Colors.deepPurple.shade400,
                      ],
                    ),
                    borderRadius: BorderRadius.circular(25),
                  ),

                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment:
                            MainAxisAlignment.spaceBetween,
                        children: [
                          const Text(
                            "Today's Progress",
                            style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 22,
                            ),
                          ),

                          Container(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 12,
                              vertical: 6,
                            ),
                            decoration: BoxDecoration(
                              color: Colors.white24,
                              borderRadius:
                                  BorderRadius.circular(20),
                            ),
                            child: const Text(
                              "0%",
                              style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ],
                      ),

                      const SizedBox(height: 18),

                      const Text(
                        "0 of 0 Tasks Completed",
                        style: TextStyle(
                          color: Colors.white70,
                          fontSize: 15,
                        ),
                      ),

                      const SizedBox(height: 18),

                      ClipRRect(
                        borderRadius:
                            BorderRadius.circular(20),
                        child: const LinearProgressIndicator(
                          value: 0,
                          minHeight: 9,
                          backgroundColor: Colors.white24,
                          color: Colors.white,
                        ),
                      ),
                    ],
                  ),
                ),

                const SizedBox(height: 25),

                // Quick Stats
                Row(
                  children: [
                    Expanded(
                      child: _buildStatCard(
                        "Today's Tasks",
                        "0",
                        Icons.task_alt,
                        Colors.deepPurple,
                      ),
                    ),

                    const SizedBox(width: 15),

                    Expanded(
                      child: _buildStatCard(
                        "Completed",
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

                const Text(
                  "Today's Tasks",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 24,
                  ),
                ),

                const SizedBox(height: 20),

                Container(
                  width: double.infinity,
                  padding: const EdgeInsets.symmetric(
                    vertical: 50,
                    horizontal: 20,
                  ),
                  decoration: BoxDecoration(
                    color: Colors.white.withOpacity(.85),
                    borderRadius: BorderRadius.circular(25),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(.05),
                        blurRadius: 15,
                      ),
                    ],
                  ),
                  child: const Column(
                    children: [
                      Icon(
                        Icons.assignment_turned_in_rounded,
                        size: 90,
                        color: Colors.deepPurple,
                      ),

                      SizedBox(height: 20),

                      Text(
                        "No Tasks Yet",
                        style: TextStyle(
                          fontSize: 26,
                          fontWeight: FontWeight.bold,
                        ),
                      ),

                      SizedBox(height: 10),

                      Text(
                        "Tap the button below to add your\nfirst reminder.",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: Colors.grey,
                          fontSize: 16,
                        ),
                      ),
                    ],
                  ),
                ),

                const SizedBox(height: 90),
              ],
            ),
          ),
        ),
      ),

      floatingActionButton: FloatingActionButton.extended(
        backgroundColor: Colors.deepPurple,
        foregroundColor: Colors.white,
        elevation: 8,
        onPressed: () {
          // TODO: Open Add Task screen
        },
        icon: const Icon(Icons.add),
        label: const Text(
          "Add Task",
          style: TextStyle(
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }

  Widget _buildStatCard(
    String title,
    String value,
    IconData icon,
    Color color,
  ) {
    return Container(
      padding: const EdgeInsets.all(18),
      decoration: BoxDecoration(
        color: Colors.white.withOpacity(.88),
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(.05),
            blurRadius: 12,
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
              fontSize: 26,
              fontWeight: FontWeight.bold,
              color: color,
            ),
          ),

          const SizedBox(height: 5),

          Text(
            title,
            textAlign: TextAlign.center,
            style: const TextStyle(
              color: Colors.grey,
            ),
          ),
        ],
      ),
    );
  }
}