import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';
import 'package:jokes_app/common/utils/printer.dart';
import 'package:meta/meta.dart';

import '../../../domain/models/common/domain_result.dart';
import '../../../domain/models/ui/category.dart';
import '../../../domain/repositories/publish_repository.dart';

part 'publish_event.dart';

part 'publish_state.dart';

class PublishBloc extends Bloc<PublishEvent, PublishState> {
  final PublishRepository _repository;
  final TextEditingController bodyController = TextEditingController();
  final TextEditingController titleController = TextEditingController();

  int selectedCategoryIndex = -1;

  PublishBloc(
    this._repository,
  ) : super(const PublishState()) {
    on<PublishStory>(_publishStory);
    on<GetCategories>(_getCategories);
  }

  Future<void> _publishStory(PublishStory event, Emitter emitter) async {
    return emitter.forEach(
      _repository.publishStory(
          bodyController.text, titleController.text, event.categoryId),
      onData: (data) {
        printMessage(data);
        if (data is DomainLoading) {
          bodyController.clear();
          titleController.clear();
          selectedCategoryIndex = -1;
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

  Future<void> _getCategories(GetCategories event, Emitter emitter) async {
    return emitter.forEach(
      _repository.getCategories(),
      onData: (data) {
        printMessage(data);
        if (data is DomainLoading) {
          bodyController.clear();
          titleController.clear();
          return state.copyWith();
        }
        if (data is DomainFail) {
          return state.copyWith();
        }
        if (data is DomainSuccess) {
          return state.copyWith(categories: data.data);
        }
        return state;
      },
    );
  }
}
