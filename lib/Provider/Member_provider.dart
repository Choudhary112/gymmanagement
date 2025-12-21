import 'package:flutter/material.dart';
import 'package:gymmanagement/Data/Dummy_members.dart';
import 'package:gymmanagement/Models/member_model.dart';

class MemberProvider extends ChangeNotifier {
  List<Member> _members = [...dummyMembers];

  List<Member> get members => _members;

  void addMember(Member member) {
    _members.add(member);
    notifyListeners();
  }

  List<Member> searchMembers(String query) {
    if (query.isEmpty) return _members;
    return _members
        .where(
          (m) =>
              m.name.toLowerCase().contains(query.toLowerCase()) ||
              m.mobile.contains(query),
        )
        .toList();
  }

  int get totalMembers => _members.length;

  int get activeMembers => _members.where((m) => m.status == "Active").length;
}
