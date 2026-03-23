
# eSIM mobile app

Mobile app for purchasing and installing eSIM to mobile device.

## Starting project

To start project you need to do next steps:

1. Install necessary flutter version. This is a Flutter project developed using Flutter 3.29.3, so you need to install it.
   Run this command command to check version.

```bash
flutter --version
```

2. Install required version Java. Recommended Java version: Java 17 (LTS). To check java version run this command:
```bash
java -version 
```

If needed, set JAVA_HOME:
```bash
export JAVA_HOME=/path/to/jdk17
```

3. Install Android Studio (latest stable)
4. Install Android SDK (installed via Android Studio)
5. For IOS you need to install Xcode latest stable and CocoaPods. To install CocoaPods run this command:
```bash
sudo gem install cocoapods 
```

6. After this clone repository:
```bash
git clone <repository-url>
cd <project-folder> 
```

7. Install dependencies

```bash
flutter pub get
```

8. After installing the dependencies you need to run code generators to create API endpoints models, freezed classe and etc:
```bash
flutter pub run build_runner build --delete-conflicting-outputs 
```