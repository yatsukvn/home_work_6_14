// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';

import '../model/user.dart';

class UserInfoPage extends StatelessWidget {
  final User userInfo;
  var list = <ListTile>[];

  UserInfoPage({Key? key, required this.userInfo}) : super(key: key) {
    list = [
      _listTileItem(
        title: userInfo.name,
        subtitle: userInfo.story,
        leadingIcon: Icons.person,
        trailing: userInfo.country,
      ),
      _listTileItem(
        title: userInfo.phone,
        leadingIcon: Icons.phone,
      ),
    ];

    if (userInfo.email.isNotEmpty) {
      list.add(
        _listTileItem(
          title: userInfo.email,
          leadingIcon: Icons.mail,
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('User Info'),
        centerTitle: true,
      ),
      body: Card(
        margin: const EdgeInsets.all(16.0),
        child: Column(
          children: list,
        ),
      ),
    );
  }
}

ListTile _listTileItem(
    {String? title,
    String? subtitle,
    IconData? leadingIcon,
    String? trailing}) {
  return ListTile(
    title: Text(
      title ?? '',
      style: const TextStyle(fontWeight: FontWeight.w500),
    ),
    subtitle: subtitle == null ? null : Text(subtitle),
    leading: Icon(
      leadingIcon,
      color: Colors.black,
    ),
    trailing: trailing == null ? null : Text(trailing),
  );
}
