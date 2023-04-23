part of 'profile_bloc.dart';

abstract class ProfileEvent {}

class GetProfile extends ProfileEvent {}

class GetProfileStats extends ProfileEvent {}

class LogOut extends ProfileEvent {}
