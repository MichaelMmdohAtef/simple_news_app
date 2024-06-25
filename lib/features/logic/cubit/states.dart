abstract class NewsStates {}

class NewsInitialStates extends NewsStates{}

class GetNewsBusinessSuccessStates extends NewsStates{}
class GetNewsBusinessLoadingStates extends NewsStates{}
class GetNewsBusinessErrorStates extends NewsStates{
  String errorMessage;
  GetNewsBusinessErrorStates(this.errorMessage);
}

class OnChangeThemeMode extends NewsStates{}
