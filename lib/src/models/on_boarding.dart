class OnBoarding {
  String image;
  String description;

  OnBoarding({this.image, this.description});
}

class OnBoardingList {
  List<OnBoarding> _list;

  List<OnBoarding> get list => _list;

  OnBoardingList() {
    _list = [
      new OnBoarding(
          image: 'img/onboarding0.png', description: 'Don\'t cry because it\'s over, smile because it happened.'),
      new OnBoarding(image: 'img/onboarding1.png', description: 'Be yourself, everyone else is already taken.'),
      new OnBoarding(image: 'img/onboarding2.png', description: 'So many books, so little time.'),
      new OnBoarding(image: 'img/onboarding3.png', description: 'A room without books is like a body without a soul.'),
    ];
  }
}
