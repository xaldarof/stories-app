import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:jokes_app/common/utils/printer.dart';
import 'package:jokes_app/domain/models/common/domain_result.dart';
import 'package:meta/meta.dart';

import '../../../domain/models/ui/profile.dart';
import '../../../domain/repositories/global_repository.dart';

part 'global_event.dart';

part 'global_state.dart';

class GlobalBloc extends Bloc<GlobalEvent, GlobalState> {
  final GlobalRepository _repository;

  GlobalBloc(
    this._repository,
  ) : super(const GlobalState()) {
    on<GetTopUsers>(_getTopUsers);
  }

  Future<void> _getTopUsers(GetTopUsers event, Emitter emitter) {
    return emitter.forEach(
      _repository.getTopUsers(),
      onData: (data) {
        printMessage('Status : ${data}');
        if (data is DomainLoading) {
          return state.copyWith(topUsersStatus: GlobalStatus.loading);
        }
        if (data is DomainSuccess<List<User>>) {
          return state.copyWith(
              topUsersStatus: GlobalStatus.success, topUsers: data.data);
        }
        if (data is DomainFail) {
          return state.copyWith(topUsersStatus: GlobalStatus.fail);
        }
        return state;
      },
    );
  }
}
