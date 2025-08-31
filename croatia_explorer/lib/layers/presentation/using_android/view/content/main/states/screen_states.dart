
sealed class ScreenState {}

class SightsMain extends ScreenState {

  SightsMain();
}

class FavouritesMain extends ScreenState {

  FavouritesMain();

}

class ProfileMain extends ScreenState {
  ProfileMain();
}

class SocialMain extends ScreenState{
  SocialMain();
}

class ErrorMain extends ScreenState {
  String error;

  ErrorMain(this.error);
}
