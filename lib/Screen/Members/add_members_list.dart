import 'package:flutter/material.dart';
import 'package:gymmanagement/Provider/Member_provider.dart';
import 'package:gymmanagement/Screen/Members/add_members_screen.dart';
import 'package:gymmanagement/Screen/Members/member_details.dart';
import 'package:provider/provider.dart';

class MembersListScreen extends StatefulWidget {
  @override
  _MembersListScreenState createState() => _MembersListScreenState();
}

class _MembersListScreenState extends State<MembersListScreen> {
  TextEditingController searchController = TextEditingController();
  String query = "";

  @override
  Widget build(BuildContext context) {
    // Get provider instance here
    final memberProvider = Provider.of<MemberProvider>(context);
    final members = memberProvider.searchMembers(query);

    return Scaffold(
      appBar: AppBar(title: Text("Members List")),
      body: Padding(
        padding: EdgeInsets.all(16),
        child: Column(
          children: [
            // Search Field
            TextField(
              controller: searchController,
              decoration: InputDecoration(
                labelText: "Search Members",
                prefixIcon: Icon(Icons.search),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
              onChanged: (val) {
                setState(() {
                  query = val;
                });
              },
            ),
            SizedBox(height: 20),
            // Members List
            Expanded(
              child: members.isEmpty
                  ? Center(child: Text("No members found"))
                  : ListView.builder(
                      itemCount: members.length,
                      itemBuilder: (context, index) {
                        final member = members[index];
                        return Card(
                          child: ListTile(
                            title: Text(member.name),
                            subtitle: Text("${member.plan} | ${member.status}"),
                            trailing: Text(
                              member.status,
                              style: TextStyle(
                                color: member.status == "Expired"
                                    ? Colors.red
                                    : Colors.green,
                              ),
                            ),
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (_) =>
                                      MemberDetailsScreen(member: member),
                                ),
                              );
                            },
                          ),
                        );
                      },
                    ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.add),
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => AddMemberScreen()),
          );
        },
      ),
    );
  }
}
