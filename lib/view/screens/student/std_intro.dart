import 'package:attendee/view/provider/home_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class StudentNotificationPage extends StatelessWidget {
  const StudentNotificationPage({super.key});

  @override
  Widget build(BuildContext context) {
        final homePro = Provider.of<HomeProvider>(context);

    return  Scaffold(
      body: RefreshIndicator(
        onRefresh: ()async{
     homePro.getNotificationStudents();
        },
        child: const NotificationList()),
    );
  }
}

class NotificationList extends StatelessWidget {
  const NotificationList({super.key});

  @override
  Widget build(BuildContext context) {
    // Replace this with a list of notifications received from the super admin.
    // final notifications = [
    //   'Notification 1: Your account has been updated.Your account has been updated.Your account has been updated.Your account has been updated.',
    //   'Notification 2: New features are available.',
    //   'Notification 3: Upcoming maintenance on Sunday.Upcoming maintenance on Sunday.',
    //   'Notification 4: Testing this page.',
    //   'Notification 5: Executed Successfully thanks.'
    //   // Add more notifications here.
    // ];

    final homePro = Provider.of<HomeProvider>(context);

    return homePro.isNotificationLoading
        ? const Center(
            child: CircularProgressIndicator(),
          )
        : ListView.builder(
            itemCount: homePro.notificationModelST?.data.length,
            itemBuilder: (context, index) {
              // Define a list of background colors for the notification tiles
              final tileColors = [
                Colors.teal,
                Colors.teal,
                Colors.teal,
              ];

              // Use modulo to cycle through the colors
              final tileColor = tileColors[index % tileColors.length];
              final noteItem = homePro.notificationModelST?.data[index];
              return Card(
                elevation: 5,
                margin: const EdgeInsets.all(12),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
                color: tileColor, // Set the background color of the card
                child: ListTile(
                  title: Text(
                    noteItem?.title ?? '',
                    style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                      color:
                          Colors.white, // Set text color to white for contrast
                      fontFamily: 'Roboto', // Use a modern font (if available)
                    ),
                  ),
                  subtitle: Text(
                    noteItem?.description ?? '',
                    style: const TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w600,
                      color:
                          Colors.white, // Set text color to white for contrast
                      fontFamily: 'Roboto', // Use a modern font (if available)
                    ),
                  ),
                  leading: const Icon(
                    Icons.filter_list_rounded,
                    color: Colors.white, // Set icon color to white
                    size: 36,
                  ),
                  onTap: () {
                    // Handle the notification tap, e.g., open a detailed view.
                  },
                ),
              );
            },
          );
  }
}
