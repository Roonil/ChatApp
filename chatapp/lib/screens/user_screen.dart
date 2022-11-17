import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../providers/current_user.dart';
import '../models/user.dart';

class UserScreen extends StatelessWidget {
  static const routeName = "user";
  static AppBar appBar(BuildContext context) {
    return AppBar(
      automaticallyImplyLeading: false,
      // leading: BackButton(
      //   onPressed: () => context.router.pop(),
      // ),
      actions: [
        IconButton(
            onPressed: Provider.of<CurrentUser>(context).logOut,
            icon: const Icon(Icons.logout))
      ],
      backgroundColor: Theme.of(context).primaryColor,
      elevation: 10,
      title: const Text("Profile"),
    );
  }

  const UserScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // final int userId =
    //     (ModalRoute.of(context)?.settings.arguments as Map)['id'];
    // final User user = Provider.of<Users>(context).withId(userId);

    // final User user = Provider.of<Users>(context, listen: false)
    //     .withId(Provider.of<CurrentUser>(context).userId ?? 0);

    final User user =
        Provider.of<CurrentUser>(context, listen: false).user as User;

    final nameController = TextEditingController(text: user.name);
    final bioController = TextEditingController(text: user.profile.bio);

    return Padding(
      padding: const EdgeInsets.only(top: 6),
      child: Card(
        //bottomNavigationBar: const NavigationScreen(),
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              children: [
                Center(
                  child: CircleAvatar(
                    backgroundColor: Theme.of(context).primaryColorDark,
                    radius: 100,
                    child: const FittedBox(
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
        ),
      ),
    );
  }
}
