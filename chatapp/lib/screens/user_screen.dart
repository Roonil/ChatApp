import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../models/user.dart';
import '../providers/users.dart';

class UserScreen extends StatelessWidget {
  static const routeName = "/user";
  final int userId;
  const UserScreen({required this.userId, super.key});

  @override
  Widget build(BuildContext context) {
    final User user = Provider.of<Users>(context).withId(userId);
    final nameController = TextEditingController(text: user.name);
    final bioController = TextEditingController(text: user.profile.bio);

    return Scaffold(
      appBar: AppBar(
        leading: BackButton(
          onPressed: () => Navigator.pop(context),
        ),
        backgroundColor: Theme.of(context).primaryColor,
        elevation: 3,
        title: const Text("Profile"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [
            const Center(
              child: CircleAvatar(
                radius: 100,
                child: FittedBox(
                  child: Icon(Icons.person, size: 150),
                ),
              ),
            ),
            TextField(
              controller: nameController,
              decoration: const InputDecoration(
                //border: InputBorder.none,
                label: Text("Name"),
                hintText: "Enter Name",
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            TextField(
              controller: bioController,
              decoration: const InputDecoration(
                //border: InputBorder.none,
                label: Text("Bio"),
                hintText: "Enter Bio",
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Align(
              alignment: Alignment.centerLeft,
              child: ElevatedButton(
                onPressed: () => {
                  user.name = nameController.text,
                  user.profile.bio = bioController.text
                },
                child: const Text("Save Changes"),
              ),
            )
          ],
        ),
      ),
    );
  }
}
