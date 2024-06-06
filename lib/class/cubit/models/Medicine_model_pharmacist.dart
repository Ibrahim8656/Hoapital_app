class MedicineModel {
  final int id;
  final String name;
  final String dosage;
  final String manufacturer;
  final String form;
  final String price;
  final String expiry_date;
  final String description;
  final List<String> side_effects;
  final int quantity;
  final String availability;
  final String photo;

  MedicineModel({
    required this.id,
    required this.name,
    required this.dosage,
    required this.manufacturer,
    required this.form,
    required this.price,
    required this.expiry_date,
    required this.description,
    required this.side_effects,
    required this.quantity,
    required this.availability,
    required this.photo,
  });

  factory MedicineModel.fromJson(Map<String, dynamic> json) {
    return MedicineModel(
      id: json['id'],
      name: json['name'],
      dosage: json['dosage'],
      manufacturer: json['manufacturer'],
      form: json['form'],
      price: json['price'],
      expiry_date: json['expiry_date'],
      description: json['description'],
      side_effects: List<String>.from(json['side_effects']),
      quantity: json['quantity'],
      availability: json['availability'],
      photo: json['photo'],
    );
  }
}
