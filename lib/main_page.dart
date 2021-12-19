import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:sqlitefff/api/contact_api.dart';
import 'package:sqlitefff/models/contact.dart';

class MainPage extends StatefulWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Liste de contacts"),
      ),
      body: StreamBuilder<List<Contact>>(
          stream: ContactApi().getAllContacts().asStream(),
          builder: (context, snapshot) {
            if (!snapshot.hasData) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            }
            return ListView.builder(
                itemCount: snapshot.data!.length,
                itemBuilder: (context, index) {
                  Contact contact = snapshot.data![index];
                  return ListTile(
                    title: Text(contact.name),
                    subtitle: Text(contact.phone),
                    trailing: IconButton(
                      icon: Icon(
                        CupertinoIcons.delete,
                        color: Colors.orange.shade700,
                      ),
                      onPressed: () {
                        ContactApi().deleteContact(contact.id!);
                      },
                    ),
                  );
                });
          }),
      floatingActionButton: FloatingActionButton.extended(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(6)),
        onPressed: () {
          Navigator.of(context).pushNamed("new_contact");
        },
        label: const Text("Nouveau"),
        icon: const Icon(CupertinoIcons.add),
      ),
    );
  }
}
