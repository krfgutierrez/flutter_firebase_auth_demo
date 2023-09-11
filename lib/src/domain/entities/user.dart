import 'package:equatable/equatable.dart';

/// 
/// Note:
/// - Renamed from User to AppUser to avoid conflict with User class from FirebaseAuth.
/// 
class AppUser extends Equatable {
  final String uid;
  final String? email;
  final String? phoneNumber;
  final String? photoURL;
  const AppUser(
    this.uid, {
    this.email,
    this.phoneNumber,
    this.photoURL,
  });

  @override
  List<Object?> get props => [uid, email, phoneNumber, photoURL];
}
