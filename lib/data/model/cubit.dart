import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

abstract class NavigationState extends Equatable {
  const NavigationState();
  @override
  List<Object> get props => [];
}

class HomeState extends NavigationState {}

class SettingState extends NavigationState {}

class ProfileState extends NavigationState {}

class NavigationCubit extends Cubit<NavigationState> {
  NavigationCubit() : super(HomeState());

  void showHome() => emit(HomeState());
  void showSettings() => emit(SettingState());
  void showProfile() => emit(ProfileState());
}
