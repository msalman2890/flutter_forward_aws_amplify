
import 'package:amplify_api/amplify_api.dart';
import 'package:amplify_auth_cognito/amplify_auth_cognito.dart';
import 'package:amplify_datastore/amplify_datastore.dart';
import 'package:amplify_flutter/amplify_flutter.dart';

import '../models/ModelProvider.dart';

class AWSAmplify{

  // Todo 2: Configure the AWS Amplify plugin
  static Future<void> configureAmplify() async {
    try{
      await Amplify.addPlugins([AmplifyAuthCognito(), AmplifyDataStore(modelProvider: ModelProvider.instance), AmplifyAPI()]);
      //the following config file will be generated in the lib folder when you run the amplify pull command after amplify app creation on amplify studio
      await Amplify.configure("<amplifyconfig>");
    } catch(e){
      print('Could not add plugins');
    }
  }

}