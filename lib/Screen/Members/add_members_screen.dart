import 'package:flutter/material.dart';
import 'package:gymmanagement/Models/member_model.dart';
import 'package:gymmanagement/Provider/Member_provider.dart';
import 'package:provider/provider.dart';

class AddMemberScreen extends StatefulWidget {
  const AddMemberScreen({super.key});

  @override
  State<AddMemberScreen> createState() => _AddMemberScreenState();
}

class _AddMemberScreenState extends State<AddMemberScreen> {
  final _formKey = GlobalKey<FormState>();
  final nameController = TextEditingController();
  final mobileController = TextEditingController();

  String plan = "Monthly";

  @override
  void dispose() {
    nameController.dispose();
    mobileController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Add Member")),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              // NAME
              TextFormField(
                controller: nameController,
                decoration: const InputDecoration(
                  labelText: "Name",
                  border: OutlineInputBorder(),
                ),
                // validator: (value) =>
                //     value == null || value.isEmpty ? "Enter name" : null,
              ),

              const SizedBox(height: 12),

              // MOBILE
              TextFormField(
                controller: mobileController,
                decoration: const InputDecoration(
                  labelText: "Mobile",
                  border: OutlineInputBorder(),
                ),
                keyboardType: TextInputType.phone,
                // validator: (value) => value == null || value.length != 10
                //     ? "Enter valid 10 digit mobile"
                //     : null,
              ),

              const SizedBox(height: 12),

              // PLAN DROPDOWN
              DropdownButtonFormField<String>(
                value: plan,
                decoration: const InputDecoration(
                  labelText: "Membership Plan",
                  border: OutlineInputBorder(),
                ),
                items: const ["Monthly", "Quarterly", "Yearly"]
                    .map((e) => DropdownMenuItem(value: e, child: Text(e)))
                    .toList(),
                onChanged: (value) {
                  setState(() {
                    plan = value!;
                  });
                },
              ),

              const SizedBox(height: 20),

              // ADD BUTTON
              ElevatedButton(
                onPressed: () {
                  Provider.of<MemberProvider>(context, listen: false).addMember(
                    Member(
                      name: nameController.text,
                      mobile: mobileController.text,
                      plan: plan,
                      status: "Active",
                      joinDate: DateTime.now().toString().split(" ")[0],
                      expiryDate: "Next Month",
                      attendance: 0,
                    ),
                  );

                  Navigator.pop(context);
                },
                child: const Text("Add Member"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
