import 'package:floor/floor.dart';

@entity
class CustomerEntity {
  @primaryKey
  final int id;
  final String firstname;
  final String lastname;
  final String dateOfBirth;
  final String phoneNumber;
  final String email;
  final String bankAccountNumber;

  CustomerEntity(this.id, this.firstname, this.lastname, this.dateOfBirth,
      this.phoneNumber, this.email, this.bankAccountNumber);
}