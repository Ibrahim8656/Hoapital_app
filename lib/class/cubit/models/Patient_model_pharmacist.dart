class PatientModel {
  final int id;
  final String firstName;
  final String lastName;
  final int age;
  final String image;
  final String phone;
  final String address;
  final String gender;
  final String blood;
  final int user;

  PatientModel({
    required this.id,
    required this.firstName,
    required this.lastName,
    required this.age,
    required this.image,
    required this.phone,
    required this.address,
    required this.gender,
    required this.blood,
    required this.user,
  });
  factory PatientModel.fromJson(Map<String, dynamic> json) {
    return PatientModel(
      id: json['id'],
      firstName: json['firstname'],
      lastName: json['lastname'],
      age: json['age'],
      image: json['photo'],
      phone: json['phone_number'],
      address: json['address'],
      gender: json['gender'],
      blood: json['blood'],
      user: json['user'],
    );
  }
}
