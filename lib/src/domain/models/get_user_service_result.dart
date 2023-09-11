class GetUserServiceResult {
  final String uid;
  final String? email;
  final String? phoneNumber;
  final String? provider;
  final String? photoUrl;
  const GetUserServiceResult(
    this.uid, {
    this.email,
    this.phoneNumber,
    this.provider,
    this.photoUrl,
  });
}
