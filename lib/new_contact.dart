import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:sqlitefff/api/contact_api.dart';
import 'package:sqlitefff/models/contact.dart';

class NewContact extends StatefulWidget {
  const NewContact({Key? key}) : super(key: key);

  @override
  _NewContactState createState() => _NewContactState();
}

class _NewContactState extends State<NewContact> {
  TextEditingController nom = TextEditingController();
  TextEditingController phone = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Nouveau contact"),
        elevation: 1,
      ),
      body: ListView(
        padding: const EdgeInsets.symmetric(
          horizontal: 24,
          vertical: 20,
        ),
        children: [
          TextFormField(
            controller: nom,
            decoration: const InputDecoration(
                label: Text("Nom"), prefixIcon: Icon(CupertinoIcons.person)),
          ),
          TextFormField(
            keyboardType: TextInputType.phone,
            controller: phone,
            decoration: const InputDecoration(
                label: Text("phone"), prefixIcon: Icon(CupertinoIcons.phone)),
          ),
          const SizedBox(
            height: 72,
          ),
          ElevatedButton(
            style: ElevatedButton.styleFrom(
                primary: Colors.black,
                padding: const EdgeInsets.symmetric(vertical: 15)),
            onPressed: () {
              var cc = Contact(name: nom.text, phone: phone.text);
              ContactApi().createContact(cc);
            },
            child: const Text(
              "Save",
              style: TextStyle(
                color: Colors.orange,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
