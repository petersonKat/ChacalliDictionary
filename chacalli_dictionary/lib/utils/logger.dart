import 'dart:developer';

class Logger {
  static void info(String message) {
    log("[INFO]: $message");
  }

  static void warn(String message) {
    log("!![WARN]: $message !!");
  }
}