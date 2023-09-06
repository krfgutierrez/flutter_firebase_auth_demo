# flutter_firebase_auth_demo

A Flutter demo project with Firebase Authentication integration.

## Getting Started

### Prerequisite
This project utilizes Firebase CLI and FlutterFire to manage Firebase integration within the project. It is advisable to use these tools to replicate the same setup that was used when developing this demo project.

1. [Install Firebase CLI](https://firebase.google.com/docs/cli#setup_update_cli)
2. Execute the command: dart pub global activate flutterfire_cli. This will globally install the FlutterFire CLI, enabling you to use the flutterfire command in the terminal.

### Firebase Project Setup
**Step 1: Initalize Firebase Project through Firebase CLI**
1. Begin by executing the command: firebase init.
2. When prompted to select the Firebase feature to set up in the project, choose the Emulator option and press Enter to proceed.
3. The Firebase CLI will request the Firebase project to be used; select the project you intend to use for this demo.
4. After project selection, Firebase will inquire about which Firebase Emulators to set up; opt for the Authentication Emulator and continue.
5. You'll have the option to set a port for the Authentication Emulator, or you can leave it blank to use the default port.
   - Take note of the port you selected, as this will be used to instruct Firebase to utilize the Authentication Emulator.
6. Following the port configuration, Firebase will ask if you want to enable the Emulator UI. Type 'y' and press Enter, then specify the port for the Emulator UI. Enabling this feature allows you to access the Emulator page.
7. Firebase will inquire if you'd like to download the emulators; type 'Y' and press 

**Step 2: Generate Firebase Project Configuration File through FlutterFire**
1. Execute the command: flutterfire configure.
2. Choose the Firebase project you wish to use for this demo.
Upon completing this step, files related to Firebase project configuration will be generated.

