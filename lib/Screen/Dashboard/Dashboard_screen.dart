import 'package:flutter/material.dart';
import 'package:gymmanagement/Provider/Member_provider.dart';
import 'package:gymmanagement/Screen/Members/add_members_list.dart';
import 'package:provider/provider.dart';

class DashboardScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final memberProvider = Provider.of<MemberProvider>(context);

    return Scaffold(
      appBar: AppBar(title: Text("Dashboard")),
      body: GridView.count(
        padding: const EdgeInsets.all(16),
        crossAxisCount: 2,
        crossAxisSpacing: 12,
        mainAxisSpacing: 12,
        children: [
          _dashboardCard(
            "Total Members",
            memberProvider.totalMembers.toString(),
            Icons.people,
          ),
          _dashboardCard(
            "Active Members",
            memberProvider.activeMembers.toString(),
            Icons.check_circle,
          ),
          _dashboardCard("Today’s Check-ins", "15", Icons.fitness_center),
          _dashboardCard("Monthly Revenue", "\$5000", Icons.attach_money),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.people),
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (_) => MembersListScreen()),
          );
        },
      ),
    );
  }

  Widget _dashboardCard(String title, String value, IconData icon) {
    return Card(
      elevation: 4,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(icon, size: 40, color: Colors.deepOrange),
          SizedBox(height: 10),
          Text(
            value,
            style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
          ),
          SizedBox(height: 5),
          Text(title),
        ],
      ),
    );
  }
}
