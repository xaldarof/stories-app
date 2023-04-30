import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:jokes_app/common/resource/decorations.dart';
import 'package:jokes_app/common/utils/navigator.dart';
import 'package:jokes_app/common/utils/size.dart';
import 'package:jokes_app/common/widgets/loading.dart';
import 'package:jokes_app/di/app_di.dart';
import 'package:jokes_app/ui/global/bloc/global_bloc.dart';
import 'package:jokes_app/ui/global/user_item.dart';
import 'package:jokes_app/ui/profile/user_stories_screen.dart';

class GlobalScreen extends StatelessWidget {
  const GlobalScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => GlobalBloc(injector.get())
        ..add(
          GetTopUsers(),
        ),
      child: BlocBuilder<GlobalBloc, GlobalState>(
        builder: (context, state) {
          return Scaffold(
            body: Container(
              height: context.height,
              width: context.width,
              decoration: const DefaultBackgroundDecoration(),
              child: state.topUsers.isEmpty
                  ? const Loading()
                  : ListView.builder(
                      physics: const BouncingScrollPhysics(),
                      itemCount: state.topUsers.length,
                      itemBuilder: (e, i) {
                        final item = state.topUsers[i];
                        return UserItem(
                          user: item,
                          index: i + 1,
                          onTap: () {
                            context.navigateTo(UserStoriesScreen(
                                userId: item.id, username: item.username));
                          },
                        );
                      },
                    ),
            ),
          );
        },
      ),
    );
  }
}
