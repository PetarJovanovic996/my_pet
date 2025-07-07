import 'package:equatable/equatable.dart';

class User extends Equatable {
  const User({required this.id, this.email, this.name});

  final String? email;

  final String id;

  final String? name;

  static const empty = User(id: '');

  String get capitalizedName {
    final name = this.name;
    final capitalizedName =
        name != null && name.isNotEmpty
            ? name[0].toUpperCase() + name.substring(1).toLowerCase()
            : '';

    return capitalizedName;
  }

  @override
  List<Object?> get props => [email, id, name];
}
