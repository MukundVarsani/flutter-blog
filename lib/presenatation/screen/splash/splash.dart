part of 'splash_imports.dart';

@RoutePage()
class Splash extends StatefulWidget {
  const Splash({super.key});

  @override
  State<Splash> createState() => _SplashState();
}

class _SplashState extends State<Splash> {
  @override
  void initState() {
    moveToBoard();
    super.initState();
  }

  moveToBoard() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();

    await Future.delayed(const Duration(seconds: 3), () {
      if (preferences.getString('token') != null) {
        Navigator.popUntil(context, (route) => false);
        AutoRouter.of(context).push(const GeneralRoute());
      } else {
        AutoRouter.of(context).replace(const OnBoardRoute());
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: MyColors.primaryColor,
      body: Center(
        child: FadedScaleAnimation(
          child: Image.asset(
            'assets/images/Journo.png',
            height: 42,
            width: 139,
          ),
        ),
      ),
    );
  }
}
