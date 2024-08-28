import 'package:flutter/foundation.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'logger.dart';

class MainObserver extends ProviderObserver {
  const MainObserver();


  @override
  void didUpdateProvider(
      ProviderBase provider,
      Object? previousValue,
      Object? newValue,
      ProviderContainer container)
  {
    logger.d('''
    {
      "provider": "${provider.name ?? provider.runtimeType}",
      "newValue": "$newValue",
      "container:" "$container"
    }
    ''');
  }

  @override
  void providerDidFail(
    ProviderBase<Object?> provider,
    Object error,
    StackTrace stackTrace,
    ProviderContainer container,
  ) {
    logger.d('''
    {
      "provider:" "${provider.name ?? provider.runtimeType}",
      "value": "$error"
    }
    ''');

  }
}
