import 'package:facebook_interface/components/button_img_profile.dart';
import 'package:facebook_interface/models/user.dart';
import 'package:flutter/material.dart';

class ContactList extends StatelessWidget {
  const ContactList({Key? key, required this.users}) : super(key: key);

  final List<User> users;
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          Row(
            children: [
              Expanded(
                child: Text(
                  "Contatos",
                  style: TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.bold,
                    color: Colors.grey[700],
                  ),
                ),
              ),
              IconButton(
                onPressed: () {},
                icon: const Icon(Icons.video_call),
              ),
              IconButton(
                onPressed: () {},
                icon: const Icon(Icons.search),
              ),
              IconButton(
                onPressed: () {},
                icon: const Icon(Icons.more_horiz),
              ),
            ],
          ),
          Expanded(
            child: ListView.builder(
                itemCount: users.length,
                itemBuilder: (context, index) {
                  User currentUser = users.elementAt(index);
                  return Padding(
                    padding: const EdgeInsets.symmetric(vertical: 7),
                    child: ButtonImageProfile(
                      user: currentUser,
                      onTap: () {},
                    ),
                  );
                }),
          )
        ],
      ),
    );
  }
}
