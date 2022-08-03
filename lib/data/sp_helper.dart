import 'package:shared_preferences/shared_preferences.dart';
import 'session.dart';
import 'dart:convert';

class SPHelper {
  static const COUNTER_KEY = 'counter';
  static late SharedPreferences prefs;

  Future init() async {
    prefs = await SharedPreferences.getInstance();
  }

  Future writeSession(Session session) async {
    prefs.setString(session.id.toString(), json.encode(session.toJson()));
  }

  List<Session> getSessions() {
    List<Session> sessions = [];
    Set<String> keys = prefs.getKeys();

    keys.forEach((String key) {
      if (key != COUNTER_KEY) {
        String sessionRaw = prefs.getString(key) ?? '';
        Map<String, dynamic> sessionJson = json.decode(sessionRaw);
        Session session = Session.fromJson(sessionJson);
        sessions.add(session);
      }
    });

    return sessions;
  }

  Future setCounter() async {
    int counter = prefs.getInt(COUNTER_KEY) ?? 0;
    counter++;
    await prefs.setInt(COUNTER_KEY, counter);
  }

  int getCounter() {
    return prefs.getInt(COUNTER_KEY) ?? 0;
  }

  Future deleteSession(int id) async {
    prefs.remove(id.toString());
  }
}