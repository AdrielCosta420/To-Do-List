import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class PreferenciasConfig {
  Future<void> salvarEscolhaCor(Color value) async {
    final prefs = await SharedPreferences.getInstance();
    prefs.setString('color', value.value.toString());
  }

  Future<void> salvarEscolhaFoto(String value) async {
    final prefs = await SharedPreferences.getInstance();
    prefs.setString('photo', value);
  }

  Future<void> buscarEscolhaCor() async {
    final prefs = await SharedPreferences.getInstance();
    prefs.getInt('color');
  }

  Future<void> buscarEscolhaFoto() async {
    final prefs = await SharedPreferences.getInstance();
    prefs.getString('photo');
  }

  Future<void> buscarEscolhaTheme() async {
    final prefs = await SharedPreferences.getInstance();
    prefs.getInt('theme');
  }

  Future<void> salvaEscolhaTheme(int value) async {
    final prefs = await SharedPreferences.getInstance();
    prefs.setInt('theme', value);
  }
}
