class UserModel {
  String user_id , name, email, password,
   address, gender, b_group, pic_url;

//<editor-fold desc="Data Methods">
  UserModel({
    required this.user_id,
    required this.name,
    required this.email,
    required this.password,
    required this.address,
    required this.gender,
    required this.b_group,
    required this.pic_url,
  });

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is UserModel &&
          runtimeType == other.runtimeType &&
          user_id == other.user_id &&
          name == other.name &&
          email == other.email &&
          password == other.password &&
          address == other.address &&
          gender == other.gender &&
          b_group == other.b_group &&
          pic_url == other.pic_url);

  @override
  int get hashCode =>
      user_id.hashCode ^
      name.hashCode ^
      email.hashCode ^
      password.hashCode ^
      address.hashCode ^
      gender.hashCode ^
      b_group.hashCode ^
      pic_url.hashCode;

  @override
  String toString() {
    return 'UserModel{' +
        ' user_id: $user_id,' +
        ' name: $name,' +
        ' email: $email,' +
        ' password: $password,' +
        ' address: $address,' +
        ' gender: $gender,' +
        ' b_group: $b_group,' +
        ' pic_url: $pic_url,' +
        '}';
  }

  UserModel copyWith({
    String? user_id,
    String? name,
    String? email,
    String? password,
    String? address,
    String? gender,
    String? b_group,
    String? pic_url,
  }) {
    return UserModel(
      user_id: user_id ?? this.user_id,
      name: name ?? this.name,
      email: email ?? this.email,
      password: password ?? this.password,
      address: address ?? this.address,
      gender: gender ?? this.gender,
      b_group: b_group ?? this.b_group,
      pic_url: pic_url ?? this.pic_url,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'user_id': this.user_id,
      'name': this.name,
      'email': this.email,
      'password': this.password,
      'address': this.address,
      'gender': this.gender,
      'b_group': this.b_group,
      'pic_url': this.pic_url,
    };
  }

  factory UserModel.fromMap(Map<String, dynamic> map) {
    return UserModel(
      user_id: map['user_id'] as String,
      name: map['name'] as String,
      email: map['email'] as String,
      password: map['password'] as String,
      address: map['address'] as String,
      gender: map['gender'] as String,
      b_group: map['b_group'] as String,
      pic_url: map['pic_url'] as String,
    );
  }

//</editor-fold>
}