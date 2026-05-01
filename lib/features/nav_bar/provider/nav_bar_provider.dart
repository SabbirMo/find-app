import 'package:flutter_riverpod/flutter_riverpod.dart';

class NavBarProvider extends Notifier<int> {
  @override
  int build() => 0;

  void updateIndex(int index) {
    state = index;
  }
}

final navBarProviderIndex = NotifierProvider<NavBarProvider, int>(
  NavBarProvider.new,
);
