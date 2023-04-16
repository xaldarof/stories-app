import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:jokes_app/common/utils/printer.dart';
import 'package:jokes_app/common/utils/size.dart';
import 'package:jokes_app/common/widgets/button.dart';
import 'package:jokes_app/common/widgets/input_widget.dart';
import 'package:jokes_app/di/app_di.dart';
import 'package:jokes_app/ui/publish/bloc/publish_bloc.dart';

import '../../common/resource/decorations.dart';

class PublishScreen extends StatelessWidget {
  const PublishScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider<PublishBloc>(
      create: (_) => PublishBloc(injector.get()),
      child: BlocBuilder<PublishBloc, PublishState>(
        builder: (context, state) {
          final bloc = context.read<PublishBloc>();
          return MultiBlocListener(
            listeners: [
              BlocListener<PublishBloc, PublishState>(
                listener: (context, state) {
                  if (state.publishStatus == PublishStatus.fail) {
                    context.showSnackBar('Ooops, something went wrong');
                  }
                  if (state.publishStatus == PublishStatus.success) {
                    context.showSnackBar('Sent to review');
                  }
                },
                listenWhen: (prev, curr) =>
                    prev.publishStatus != curr.publishStatus,
              )
            ],
            child: Container(
              height: context.height,
              decoration: DefaultBackgroundDecoration(),
              child: SingleChildScrollView(
                physics: const BouncingScrollPhysics(),
                controller: ScrollController(),
                child: Column(
                  children: [
                    Input(
                      controller: bloc.titleController,
                      hint: 'Title...',
                      margin: const EdgeInsets.only(
                          left: 24, right: 24, top: 24, bottom: 0),
                      multiLine: false,
                    ),
                    Input(
                      controller: bloc.bodyController,
                      hint: 'Body...',
                      margin: const EdgeInsets.all(24),
                      multiLine: true,
                    ),
                    Button(
                      loading: state.publishStatus == PublishStatus.loading,
                      height: 52,
                      onTap: () {
                        bloc.add(PublishStory());
                      },
                      text: 'Send to review',
                      margin: const EdgeInsets.all(24),
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
