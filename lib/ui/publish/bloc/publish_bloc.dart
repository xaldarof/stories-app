import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';
import 'package:jokes_app/common/utils/printer.dart';
import 'package:meta/meta.dart';

import '../../../domain/models/common/domain_result.dart';
import '../../../domain/repositories/publish_repository.dart';

part 'publish_event.dart';

part 'publish_state.dart';

class PublishBloc extends Bloc<PublishEvent, PublishState> {
  final PublishRepository _repository;
  final TextEditingController bodyController = TextEditingController();
  final TextEditingController titleController = TextEditingController();

  PublishBloc(
    this._repository,
  ) : super(const PublishState()) {
    on<PublishStory>(_publishStory);
  }

  Future<void> _publishStory(PublishStory event, Emitter emitter) async {
    return emitter.forEach(
      _repository.publishStory(bodyController.text, titleController.text),
      onData: (data) {
        printMessage(data);
        if (data is DomainLoading) {
          return state.copyWith(publishStatus: PublishStatus.loading);
        }
        if (data is DomainFail) {
          return state.copyWith(publishStatus: PublishStatus.fail);
        }
        if (data is DomainSuccess) {
          return state.copyWith(publishStatus: PublishStatus.success);
        }
        return state;
      },
    );
  }
}
