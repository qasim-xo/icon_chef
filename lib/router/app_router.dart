import 'package:auto_route/auto_route.dart';
import 'package:icon_chef/router/app_router.gr.dart';

@AutoRouterConfig(replaceInRouteName: 'Screen,Route')
class AppRouter extends RootStackRouter {
  @override
  // TODO: implement routes
  List<AutoRoute> get routes {
    return [AutoRoute(page: IconEditorRoute.page, initial: true)];
  }
}
