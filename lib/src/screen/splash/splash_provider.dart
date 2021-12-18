import 'package:insta_animation/src/application.dart';
import 'package:insta_animation/src/screen/splash/local_model/local_models.dart';

class SplashProvider extends ChangeNotifier {
  final post = Post();
  bool showFav = false;

  AnimationController? firstController;
  AnimationController? secondController;

  void switchFav() {
    showFav = true;

    notifyListeners();

    firstController
      ?..reset()
      ..forward();

    Future.delayed(const Duration(milliseconds: 200), () {
      post.isFav = !post.isFav;
      notifyListeners();
      secondController
        ?..reset()
        ..forward();
    });

    Future.delayed(const Duration(milliseconds: 600), () {
      showFav = false;
      notifyListeners();
    });
  }
}
