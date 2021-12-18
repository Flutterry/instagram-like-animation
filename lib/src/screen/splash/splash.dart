import 'package:animate_do/animate_do.dart';
import 'package:insta_animation/src/application.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  late SplashProvider provider;

  @override
  Widget build(BuildContext context) {
    provider = context.watch<SplashProvider>();
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          GestureDetector(
            onDoubleTap: provider.switchFav,
            child: Stack(
              alignment: Alignment.center,
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(16),
                  child: Image.network(
                    provider.post.image,
                    width: getWidth(80),
                    height: getWidth(80),
                    fit: BoxFit.cover,
                    color: Colors.black.withOpacity(0.2),
                    colorBlendMode: BlendMode.darken,
                  ),
                ),
                Opacity(
                  opacity: provider.showFav ? 1 : 0,
                  child: Pulse(
                    duration: const Duration(milliseconds: 400),
                    manualTrigger: true,
                    animate: false,
                    controller: (p0) => provider.firstController = p0,
                    child: const Icon(
                      Icons.favorite,
                      size: 80,
                      color: Colors.white,
                    ),
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 16),
          ListTile(
            leading: Pulse(
              animate: false,
              manualTrigger: true,
              controller: (p0) => provider.secondController = p0,
              duration: const Duration(milliseconds: 200),
              child: Icon(
                provider.post.isFav ? Icons.favorite : Icons.favorite_border,
                color: provider.post.isFav ? Colors.red : null,
              ),
            ),
            title: Text(provider.post.userName),
            subtitle: Text(provider.post.description),
          )
        ],
      ),
    );
  }
}
