#!/bin/zsh#
 appMode='development'
 appName='awesomeApp1'
 appSuffix='.dev'

echo Hello
export APP_MODE=$appMode
echo $APP_MODE
export APP_NAME=$appName
echo $APP_NAME
export APP_SUFFIX=$appSuffix
echo $APP_SUFFIX

export ENV_ARGS='--dart-define=APP_MODE=$appMode --dart-define=APP_NAME=$appName --dart-define=APP_SUFFIX=$appSuffix'
# export ENV_ARGS='--dart-define=APP_MODE=APP_MODE --dart-define=APP_NAME=APP_NAME --dart-define=APP_SUFFIX=APP_SUFFIX'
echo $ENV_ARGS

flutter run --dart-define=APP_MODE=$appMode --dart-define=APP_NAME=$appName --dart-define=APP_SUFFIX=$appSuffix
# alias tree='colorls --tree --dark'
# alias run-app='fvm flutter'
