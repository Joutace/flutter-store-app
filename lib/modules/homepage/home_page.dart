import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_challange/di/app_providers.dart';
import 'package:flutter_challange/domain/models/user.dart';
import 'package:flutter_challange/modules/homepage/home_bloc.dart';
import 'package:flutter_challange/modules/homepage/home_states.dart';
import 'package:flutter_challange/modules/user_drawer/user_drawer.dart';
import 'package:flutter_challange/shared/resources/app_images.dart';
import 'package:flutter_challange/shared/themes/app_colors.dart';
import 'package:flutter_challange/shared/themes/app_text_styles.dart';
import 'package:flutter_challange/shared/widgets/app_scaffold.dart';

class HomePage extends StatefulWidget {
  Function()? onRefresh;

  HomePage({
    super.key,
  });

  void refresh() {
    onRefresh?.call();
  }

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final _bloc = getIt.get<HomeBloc>();

  @override
  void initState() {
    _bloc.init();
    widget.onRefresh = () {
      _bloc.init();
    };
    super.initState();
  }

  Widget _header(
    User user,
  ) {
    return Padding(
      padding: const EdgeInsets.only(left: 20, right: 20, top: 24, bottom: 20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        mainAxisSize: MainAxisSize.max,
        children: <Widget>[
          Row(
            children: [
              Builder(
                builder: (BuildContext context) {
                  return GestureDetector(
                    onTap: () => Scaffold.of(context).openDrawer(),
                    child: CircleAvatar(
                      radius: 28,
                      backgroundImage: user.avatar != null
                          ? NetworkImage(user.avatar!)
                          : const AssetImage(AppImages.profilePlaceholder)
                              as ImageProvider,
                    ),
                  );
                },
              ),
              Padding(
                padding: const EdgeInsets.only(left: 16),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      user.name,
                      style: AppTextStyles.h6.copyWith(
                          color: AppColors.darkGrey,
                          fontWeight: FontWeight.w700),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<HomeBloc, HomeState>(
      bloc: _bloc,
      listener: (_, __) {},
      child: BlocBuilder<HomeBloc, HomeState>(
        bloc: _bloc,
        builder: (context, state) {
          return AppScaffold(
            drawer: const UserDrawer(),
            body: Column(
              children: [
                _header(
                  state.user,
                ),
                Expanded(
                  child: ListView(
                    shrinkWrap: true,
                    children: [
                      state is SuccessHomeState
                          ? Padding(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 20, vertical: 4),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Text(state.user.first_name),
                                  Text(state.user.last_name),
                                  Text(state.user.email ?? ''),
                                  Text(state.user.year)
                                ],
                              ),
                            )
                          : Container(),
                    ],
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
