{ androidsdk, jdk17 }:
let
  envvars = {
    ANDROID_HOME = "${androidsdk}/libexec/android-sdk";
    ANDROID_SDK_ROOT = "${androidsdk}/libexec/android-sdk";
    ANDROID_NDK_ROOT = "${androidsdk}/libexec/android-sdk/ndk-bundle";
    JAVA_HOME = "${jdk17.home}";
    ORG_GRADLE_PROJECT_ANDROID_KEY_ALIAS = "";
    ORG_GRADLE_PROJECT_ANDROID_KEYSTORE_PASSWORD = "";
    ORG_GRADLE_PROJECT_ANDROID_KEY_PASSWORD = "";
    MATCH_GIT_BASIC_AUTHORIZATION = "";
    MATCH_PASSWORD = "";
    APP_STORE_CONNECT_API_KEY_KEY_ID = "";
    APP_STORE_CONNECT_API_KEY_ISSUER_ID = "";
    APP_STORE_CONNECT_API_KEY_KEY = "";
    PLAYSTORE_JSON_KEY_DATA = "";
  };
in
envvars
