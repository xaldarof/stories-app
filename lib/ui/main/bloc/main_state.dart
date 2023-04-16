part of 'main_bloc.dart';

class MainState extends Equatable {
  final AppState appState;

  @override
  List<Object?> get props => [
        appState,
      ];

  const MainState({
    this.appState = AppState.initial,
  });

  MainState copyWith({
    AppState? appState,
  }) {
    return MainState(
      appState: appState ?? this.appState,
    );
  }
}
