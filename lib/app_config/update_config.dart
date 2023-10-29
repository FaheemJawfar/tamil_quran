import '../utils/shared_preferences.dart';

class UpdateAppConfig {


  static void updatePreferencesForUsersUpdatingFromV1(){
    String? selectedTranslation = AppPreferences.getString('selectedTranslation');

    if(selectedTranslation == 'mJohn' || selectedTranslation == 'm_john'){
      AppPreferences.setString('selectedTranslation', 'john_trust');
    }
    else if(selectedTranslation == 'kingFahd'){
      AppPreferences.setString('selectedTranslation', 'king_fahd');
    }
    else if(selectedTranslation == 'abdulHameed'){
      AppPreferences.setString('selectedTranslation', 'abdul_hameed');
    }
  }
}