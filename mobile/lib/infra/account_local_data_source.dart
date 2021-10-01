// part of 'account.dart';

import 'dart:convert';

import 'package:aqb_api/aqb_api.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

mixin IAccountLocalDataSource {
  static const CREDENTIAL_KEY = 'CREDENTIAL_KEY';
  static const ACCESS_TOKEN_KEY = 'ACCESS_TOKEN_KEY';
  static const REFRESH_TOKEN_KEY = 'REFRESH_TOKEN_KEY';

  Future<String?> getRefreshToken();

  Future<String?> getAccessToken();

  Future<void> updateRefreshToken(String token);

  Future<void> updateAccessToken(String token);

  Future<void> removeRefreshToken();

  Future<void> removeAccessToken();

  Future<void> removeCredential();

  Future<Credential?> getCredential();

  Future<void> updateCredential(Credential credential);

  Future<String?> getUserId();
}

class AccountLocalDataSource implements IAccountLocalDataSource {
  final FlutterSecureStorage storage;

  AccountLocalDataSource({required this.storage});

  @override
  Future<String?> getAccessToken() {
    return storage.read(key: IAccountLocalDataSource.ACCESS_TOKEN_KEY);
  }

  @override
  Future<String?> getRefreshToken() {
    return storage.read(key: IAccountLocalDataSource.REFRESH_TOKEN_KEY);
  }

  @override
  Future<void> removeAccessToken() {
    return storage.delete(key: IAccountLocalDataSource.ACCESS_TOKEN_KEY);
  }

  @override
  Future<void> removeRefreshToken() {
    return storage.delete(key: IAccountLocalDataSource.REFRESH_TOKEN_KEY);
  }

  @override
  Future<void> updateAccessToken(String accessToken) {
    return storage.write(
        key: IAccountLocalDataSource.ACCESS_TOKEN_KEY, value: accessToken);
  }

  @override
  Future<void> updateRefreshToken(String refreshToken) {
    return storage.write(
        key: IAccountLocalDataSource.REFRESH_TOKEN_KEY, value: refreshToken);
  }

  @override
  Future<void> updateCredential(Credential credential) {
    final value = jsonEncode(credential.toJson());
    return storage.write(
        key: IAccountLocalDataSource.CREDENTIAL_KEY, value: value);
  }

  @override
  Future<Credential?> getCredential() async {
    final string =
        await storage.read(key: IAccountLocalDataSource.CREDENTIAL_KEY);
    if (string == null) return null;
    return Credential.fromJson(jsonDecode(string));
  }

  @override
  Future<void> removeCredential() {
    return storage.delete(key: IAccountLocalDataSource.CREDENTIAL_KEY);
  }

  @override
  Future<String?> getUserId() async => (await getCredential())?.userId;
}
