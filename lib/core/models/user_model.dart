class UserModel {
  final String uid;
  final String name;
  final String email;
  final String role;
  final String department;

  UserModel({
    required this.uid,
    required this.name,
    required this.email,
    required this.role,
    required this.department,
  });

  Map<String, dynamic> toMap() {
    return {
      "uid": uid,
      "name": name,
      "email": email,
      "role": role,
      "department": department,
    };
  }

  factory UserModel.fromMap(String id, Map<String, dynamic> data) {
    return UserModel(
      uid: id,
      name: data['name'] ?? '',
      email: data['email'] ?? '',
      role: data['role'] ?? '',
      department: data['department'] ?? '',
    );
  }
}
