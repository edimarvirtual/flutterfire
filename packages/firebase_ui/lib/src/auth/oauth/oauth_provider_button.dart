import 'package:flutter/material.dart';

import 'package:firebase_ui/firebase_ui.dart';
import 'package:firebase_ui/src/auth/oauth/oauth_flow.dart';

import 'oauth_providers.dart';
import 'provider_resolvers.dart';

class ProviderButton<T extends OAuthProvider> extends StatefulWidget {
  final IconData? icon;

  const ProviderButton({Key? key, this.icon}) : super(key: key);

  static ProviderButton<Google> google({Key? key}) =>
      ProviderButton<Google>(key: key);
  static ProviderButton<Apple> apple({Key? key}) =>
      ProviderButton<Apple>(key: key);
  static ProviderButton<Twitter> twitter({Key? key}) =>
      ProviderButton<Twitter>(key: key);
  static ProviderButton<Facebook> facebook({Key? key}) =>
      ProviderButton<Facebook>(key: key);

  @override
  _ProviderButtonState<T> createState() => _ProviderButtonState<T>();
}

class _ProviderButtonState<T extends OAuthProvider>
    extends State<ProviderButton> {
  void signIn() {
    final ctrl = AuthController.of(context) as OAuthController;
    ctrl.signInWithProvider<T>();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(8),
      child: IconButton(
        icon: Icon(widget.icon ?? providerIcon<T>()),
        onPressed: signIn,
      ),
    );
  }
}