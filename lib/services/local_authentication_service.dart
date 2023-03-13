import 'package:flutter/services.dart';
import 'package:local_auth/local_auth.dart';

class LocalAuthenticationService {
  static Future<bool> authWithBiometrics() async {
  
    final LocalAuthentication localAuthentication = LocalAuthentication();
    bool isBiometricSupported = await localAuthentication.isDeviceSupported();
    bool canCheckBiometrics = await localAuthentication.canCheckBiometrics;

    bool isAuthenticated = false;

    if (isBiometricSupported && canCheckBiometrics) {
      try {
        isAuthenticated = await localAuthentication.authenticate(
            localizedReason: 'Verify the biometrics to proceed.',
            options: const AuthenticationOptions(biometricOnly: true));
      } on PlatformException catch (e) {
        print(e);
      }
    }

    return isAuthenticated;
  }
}
