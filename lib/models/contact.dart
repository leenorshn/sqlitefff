class Contact {
  late int? id;
  late String name;
  late String phone;

  Contact({this.id, required this.phone, required this.name});

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'phone': phone,
    };
  }

  @override
  String toString() {
    return 'Dog{id: $id, name: $name, phone: $phone}';
  }
}
