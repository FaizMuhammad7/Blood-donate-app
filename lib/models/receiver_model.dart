class ReceiverModel {
  String name, reason, b_quantity, b_group, gender, address, age;

//<editor-fold desc="Data Methods">
  ReceiverModel({
    required this.name,
    required this.reason,
    required this.b_quantity,
    required this.b_group,
    required this.gender,
    required this.address,
    required this.age,
  });

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is ReceiverModel &&
          runtimeType == other.runtimeType &&
          name == other.name &&
          reason == other.reason &&
          b_quantity == other.b_quantity &&
          b_group == other.b_group &&
          gender == other.gender &&
          address == other.address &&
          age == other.age);

  @override
  int get hashCode =>
      name.hashCode ^
      reason.hashCode ^
      b_quantity.hashCode ^
      b_group.hashCode ^
      gender.hashCode ^
      address.hashCode ^
      age.hashCode;

  @override
  String toString() {
    return 'ReceiverModel{' +
        ' name: $name,' +
        ' reason: $reason,' +
        ' b_quantity: $b_quantity,' +
        ' b_group: $b_group,' +
        ' gender: $gender,' +
        ' address: $address,' +
        ' age: $age,' +
        '}';
  }

  ReceiverModel copyWith({
    String? name,
    String? reason,
    String? b_quantity,
    String? b_group,
    String? gender,
    String? address,
    String? age,
  }) {
    return ReceiverModel(
      name: name ?? this.name,
      reason: reason ?? this.reason,
      b_quantity: b_quantity ?? this.b_quantity,
      b_group: b_group ?? this.b_group,
      gender: gender ?? this.gender,
      address: address ?? this.address,
      age: age ?? this.age,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'name': this.name,
      'reason': this.reason,
      'b_quantity': this.b_quantity,
      'b_group': this.b_group,
      'gender': this.gender,
      'address': this.address,
      'age': this.age,
    };
  }

  factory ReceiverModel.fromMap(Map<String, dynamic> map) {
    return ReceiverModel(
      name: map['name'] as String,
      reason: map['reason'] as String,
      b_quantity: map['b_quantity'] as String,
      b_group: map['b_group'] as String,
      gender: map['gender'] as String,
      address: map['address'] as String,
      age: map['age'] as String,
    );
  }

//</editor-fold>
}