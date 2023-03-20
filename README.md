# Flutter and AWS Amplify

A Flutter project to learn to integrate the AWS Amplify in Flutter projects. 
The project is based on the [Flutter and AWS Amplify](https://docs.amplify.aws/start/getting-started/installation/q/integration/flutter) tutorial.

## Getting Started

This project is a starting point for a Flutter application.
You just need to create an amplify project on Amplify Studio and add the auth module and a simple todo data model to it.
Then you can run the project and see the result.

Don't forget to run the following commands to the root of the project:

```bash
flutter pub get
amplify pull --appId <YOUR_APP_ID> --envName <YOUR_ENV_NAME>
flutter pub run amplify-flutter-codegen models
```

When you run the pull command then the amplify backend, models and config file will be generated to your project.

You can find the presentation of this topic by following this
[Flutter and AWS Amplify - Flutter Forward Extended Presentation](https://cutt.ly/34kB45Z)

To understand the steps to integrate, I have created a step by step todos list in the source code.

