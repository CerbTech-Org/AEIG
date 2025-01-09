import 'package:auto_route/annotations.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

@RoutePage()
class CustomerNotificationsScreen extends StatefulWidget {
  const CustomerNotificationsScreen({super.key});

  @override
  _CustomerNotificationsScreenState createState() {
    return _CustomerNotificationsScreenState();
  }
}

class _CustomerNotificationsScreenState extends State<CustomerNotificationsScreen> {
  String? currentUid;
  bool isAdmin = false;

  Future<void> _getCurrentUid() async {
    User? user = FirebaseAuth.instance.currentUser;
    if (user != null) {
      setState(() {
        currentUid = user.uid;
      });
      DocumentSnapshot adminDoc = await FirebaseFirestore.instance
          .collection('admins')
          .doc(currentUid)
          .get();
      setState(() {
        isAdmin = adminDoc.exists && adminDoc.get('isAdmin') == true;
      });
    }
  }

  @override
  void initState() {
    super.initState();
    _getCurrentUid();
  }

  @override
  Widget build(BuildContext context) {
    if (currentUid == null) {
      return const Scaffold(
        body: Center(child: CircularProgressIndicator()),
      );
    }
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: StreamBuilder<QuerySnapshot>(
          stream: isAdmin
              ? FirebaseFirestore.instance
              .collection("message_send_by_user")
              .where('read', isEqualTo: false)
              .orderBy('timestamp', descending: true)
              .snapshots()
              : FirebaseFirestore.instance
              .collection("message_send_by_user")
              .where('userId', isEqualTo: currentUid)
              .where('read', isEqualTo: false)
              .orderBy('timestamp', descending: true)
              .snapshots(),
          builder: (context, snapshot) {
            if (snapshot.hasError) {
              _showMessage(context, "Erreur Firebase: ${snapshot.error}");
              return Center(child: Text('Erreur: ${snapshot.error}'));
            }
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(child: CircularProgressIndicator());
            }

            List<DocumentSnapshot> docs = snapshot.data!.docs;
            if (docs.isEmpty) {
              return const Center(child: Text("Aucune notification reçue pour le moment"));
            }

            return ListView.builder(
              itemCount: docs.length,
              itemBuilder: (context, index) {
                Map<String, dynamic> notification = docs[index].data() as Map<String, dynamic>;
                DateTime dateTime = (notification['timestamp'] as Timestamp).toDate();
                String formattedDate = DateFormat('dd/MM/yyyy HH:mm').format(dateTime);

                return Card(
                  elevation: 5, // Ajoute une ombre à la carte.
                  margin: const EdgeInsets.symmetric(vertical: 10),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(15.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          'De: Administrateur',
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(height: 8),
                        Text(
                          '${notification['message'] ?? 'Pas de message'}',
                          style: const TextStyle(fontSize: 16),
                        ),
                        const SizedBox(height: 8),
                        Text(
                          'Reçu le: $formattedDate',
                          style: const TextStyle(fontSize: 14, color: Colors.grey),
                        ),
                        const SizedBox(height: 8),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            TextButton(
                              onPressed: () => _markAsRead(docs[index].id),
                              child: const Text('Marquer comme lu'),
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                );
              },
            );
          },
        ),
      ),
    );
  }

  void _showMessage(BuildContext context, String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text(message)),
    );
  }

  void _markAsRead(String notificationId) {
    FirebaseFirestore.instance.collection('message_send_by_user').doc(notificationId).update({
      'read': true,
    }).then((_) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Notification marquée comme lue')),
      );
    }).catchError((error) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Erreur: $error')),
      );
    });
  }
}
