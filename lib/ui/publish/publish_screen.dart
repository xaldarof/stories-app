import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:jokes_app/common/utils/printer.dart';
import 'package:jokes_app/common/utils/size.dart';
import 'package:jokes_app/common/widgets/button.dart';
import 'package:jokes_app/common/widgets/input_widget.dart';
import 'package:jokes_app/di/app_di.dart';
import 'package:jokes_app/ui/publish/bloc/publish_bloc.dart';

import '../../common/resource/decorations.dart';
import '../../generated/locale_keys.g.dart';
import '../stories/story_category_item.dart';

class PublishScreen extends StatefulWidget {
  const PublishScreen({super.key});

  @override
  State<PublishScreen> createState() => _PublishScreenState();
}

class _PublishScreenState extends State<PublishScreen> {
  bool publishButtonEnabled = false;
  Timer? _debounce;

  _onInputValueChanged(PublishBloc bloc) {
    if (_debounce?.isActive ?? false) _debounce?.cancel();
    _debounce = Timer(const Duration(milliseconds: 500), () {
      setState(() {
        publishButtonEnabled = bloc.bodyController.text.trim().isNotEmpty &&
            bloc.titleController.text.trim().isNotEmpty &&
            bloc.selectedCategoryIndex != -1;
      });
    });
  }

  @override
  void dispose() {
    _debounce?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider<PublishBloc>(
      create: (_) => PublishBloc(
        injector.get(),
      )..add(
          GetCategories(),
        ),
      child: BlocBuilder<PublishBloc, PublishState>(
        builder: (context, state) {
          final bloc = context.read<PublishBloc>();
          return MultiBlocListener(
            listeners: [
              BlocListener<PublishBloc, PublishState>(
                listener: (context, state) {
                  if (state.publishStatus == PublishStatus.fail) {
                    context.showSnackBar(Strings.somethingWentWrong);
                  }
                  if (state.publishStatus == PublishStatus.success) {
                    context.showSnackBar(Strings.published);
                  }
                },
                listenWhen: (prev, curr) =>
                    prev.publishStatus != curr.publishStatus,
              )
            ],
            child: Scaffold(
              body: Container(
                height: context.height,
                decoration: const DefaultBackgroundDecoration(),
                child: SingleChildScrollView(
                  physics: const BouncingScrollPhysics(),
                  controller: ScrollController(),
                  child: Column(
                    children: [
                      Input(
                        controller: bloc.titleController,
                        hint: Strings.title,
                        margin: const EdgeInsets.only(
                            left: 24, right: 24, top: 24, bottom: 0),
                        multiLine: false,
                      ),
                      SizedBox(
                        height: 72,
                        child: ListView.builder(
                          padding: const EdgeInsets.only(
                              left: 12, right: 12, top: 12, bottom: 12),
                          itemCount: state.categories.length,
                          physics: const BouncingScrollPhysics(),
                          scrollDirection: Axis.horizontal,
                          itemBuilder: (e, i) {
                            final item = (state.categories ?? [])[i];
                            return StoryCategoryItem(
                              value: item,
                              selected: bloc.selectedCategoryIndex == i,
                              onTap: () {
                                setState(
                                  () {
                                    _onInputValueChanged(bloc);
                                    bloc.selectedCategoryIndex = i;
                                  },
                                );
                              },
                            );
                          },
                        ),
                      ),
                      Input(
                        controller: bloc.bodyController,
                        hint: Strings.body,
                        onChange: (text) {
                          _onInputValueChanged(bloc);
                        },
                        margin: const EdgeInsets.all(24),
                        multiLine: true,
                      ),
                      Button(
                        animate: state.publishStatus == PublishStatus.loading,
                        enabled: publishButtonEnabled,
                        height: 52,
                        onTap: () {
                          bloc.add(PublishStory(
                              categoryId: state
                                  .categories[bloc.selectedCategoryIndex].id));
                        },
                        text: Strings.published,
                        margin: const EdgeInsets.all(24),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
