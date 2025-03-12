import 'package:flutter/material.dart';

class UserAvatar extends StatelessWidget {
  final String name;

  const UserAvatar({super.key, required this.name});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 60,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Stack(
            alignment: Alignment.bottomRight,
            children: [
              const CircleAvatar(
                radius: 30,
                backgroundImage: NetworkImage(
                    "https://cdn.pixabay.com/photo/2016/08/08/09/17/avatar-1577909_640.png"),
              ),
              const Padding(
                padding: EdgeInsetsDirectional.only(bottom: 1, end: 1),
                child: CircleAvatar(
                  radius: 10,
                  backgroundColor: Colors.white,
                  child: CircleAvatar(
                    radius: 5,
                    backgroundColor: Colors.green,
                  ),
                ),
              )
            ],
          ),
          Text(
            name,
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );

  }
}
