import 'package:flutter/material.dart';
import 'package:gymmanagement/Models/member_model.dart';

class MemberDetailsScreen extends StatelessWidget {
  final Member member;

  const MemberDetailsScreen({super.key, required this.member});

  @override
  Widget build(BuildContext context) {
    bool isExpired = member.status.toLowerCase() == "expired";
    return Scaffold(
      appBar: AppBar(title: const Text("Member Details")),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              member.name,
              style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 10),
            Text("Mobile: ${member.mobile}", style: TextStyle(fontSize: 18)),
            Text(
              "Membership Plan: ${member.plan}",
              style: TextStyle(fontSize: 18),
            ),
            Text(
              "Join Date: ${member.joinDate}",
              style: TextStyle(fontSize: 18),
            ),
            Text(
              "Expiry Date: ${member.expiryDate}",
              style: TextStyle(
                fontSize: 18,
                color: isExpired ? Colors.red : Colors.black,
              ),
            ),
            SizedBox(height: 10),
            Text(
              "Attendance Count: ${member.attendance}",
              style: TextStyle(fontSize: 18),
            ),
          ],
        ),
      ),
    );
  }
}
