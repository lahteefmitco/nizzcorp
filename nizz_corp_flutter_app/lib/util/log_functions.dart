import 'dart:developer';

const String red = '\x1B[31m';
const String green = '\x1B[32m';
const String yellow = '\x1B[33m';
const String blue = '\x1B[34m';
const String magenta = '\x1B[35m';
const String reset = '\x1B[0m';
const String white = '\x1B[37m';

void errorLog({required String functionName, required dynamic error,  String name = 'ERROR'}) {
  log(
    "$functionName:- $red$error$reset",
    name: name,
  );
}

void warningLog({required String functionName, required dynamic message, String name = 'WARNING'}) {
  log(
    "$functionName:- $yellow$message$reset",
    name: name,
  );
}

void debugLog({required String functionName, required dynamic message,String name = 'DEBUG'}) {
  log(
    "$functionName:- $blue$message$reset",
    name: name,
  );
}

void infoLog({required String functionName, required dynamic message,String name = 'INFO'}) {
  log(
    "$functionName:- $white$message$reset",
    name: name,
  );
}
