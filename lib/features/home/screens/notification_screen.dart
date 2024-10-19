import 'package:flutter/material.dart';
import 'package:notas/core/extensions/routes_extenstion.dart';
import 'package:notas/features/auth/screens/widgets/app_bar_white.dart';
import 'package:notas/features/home/screens/widgets/notification_card.dart';

class NotificationScreen extends StatefulWidget {
  const NotificationScreen({
    super.key,
  });

  @override
  State<NotificationScreen> createState() => _NotificationScreenState();
}

class _NotificationScreenState extends State<NotificationScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: PreferredSize(
          preferredSize: const Size.fromHeight(55),
          child: CustomAppBar(
              onPressed: () {
                context.pop();
              },
              text: "Notifications"),
        ),
        body: ListView.builder(
            itemCount: 4,
            itemBuilder: (context, index) => const NotficationCard(
                title: "Pay Your Bills",
                text: "Please Pay your Electricity Bill on Time")));
  }
}
