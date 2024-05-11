import 'package:flutter/material.dart';
import 'package:team_draw/model/team_shield.dart';

const String imageInitialPath = "assets/images";

TeamShield barcelona = getAllShields[0];
TeamShield flamengo = getAllShields[1];
TeamShield avai = getAllShields[2];
TeamShield figueirense = getAllShields[3];
TeamShield palmeiras = getAllShields[4];
TeamShield dortmund = getAllShields[5];
TeamShield redBullBragantino = getAllShields[6];
TeamShield atleticoMineiro = getAllShields[7];
TeamShield atleticoParanaense = getAllShields[8];
TeamShield bahia = getAllShields[9];
TeamShield botafogo = getAllShields[10];
TeamShield cruzeiro = getAllShields[11];
TeamShield fluminense = getAllShields[12];
TeamShield santos = getAllShields[13];
TeamShield saoPaulo = getAllShields[14];
TeamShield vascoDaGama = getAllShields[15];
TeamShield vitoria = getAllShields[16];

List<TeamShield> getAllShields = [
  TeamShield(
      resourcePath: "$imageInitialPath/logo-barcelona-256.png",
      primaryColor: Colors.deepPurple,
      secondaryColor: Colors.red),
  TeamShield(
      resourcePath: "$imageInitialPath/logo-flamengo-256.png",
      primaryColor: Colors.redAccent,
      secondaryColor: Colors.black),
  TeamShield(
      resourcePath: "$imageInitialPath/logo-avai-256.png",
      primaryColor: Colors.blue,
      secondaryColor: Colors.white),
  TeamShield(
      resourcePath: "$imageInitialPath/logo-figueirense-256.png",
      primaryColor: Colors.black,
      secondaryColor: Colors.white),
  TeamShield(
      resourcePath: "$imageInitialPath/logo-palmeiras-256.png",
      primaryColor: Colors.greenAccent,
      secondaryColor: Colors.white),
  TeamShield(
      resourcePath: "$imageInitialPath/logo-dortmund-256.png",
      primaryColor: Colors.yellow,
      secondaryColor: Colors.black),
  TeamShield(
      resourcePath: "$imageInitialPath/logo-red-bull-bragantino-256.png",
      primaryColor: Colors.black,
      secondaryColor: Colors.white),
  TeamShield(
      resourcePath: "$imageInitialPath/logo-atletico-mineiro-256.png",
      primaryColor: Colors.black,
      secondaryColor: Colors.white),
  TeamShield(
      resourcePath: "$imageInitialPath/logo-atletico-paranaense-256.png",
      primaryColor: Colors.red,
      secondaryColor: Colors.black),
  TeamShield(
      resourcePath: "$imageInitialPath/logo-bahia-256.png",
      primaryColor: Colors.white,
      secondaryColor: Colors.white),
  TeamShield(
      resourcePath: "$imageInitialPath/logo-botafogo-256.png",
      primaryColor: Colors.black,
      secondaryColor: Colors.white),
  TeamShield(
      resourcePath: "$imageInitialPath/logo-cruzeiro-256.png",
      primaryColor: Colors.blue,
      secondaryColor: Colors.white),
  TeamShield(
      resourcePath: "$imageInitialPath/logo-fluminense-256.png",
      primaryColor: Colors.white,
      secondaryColor: Colors.green),
  TeamShield(
      resourcePath: "$imageInitialPath/logo-santos-256.png",
      primaryColor: Colors.white,
      secondaryColor: Colors.black),
  TeamShield(
      resourcePath: "$imageInitialPath/logo-sao-paulo-256.png",
      primaryColor: Colors.white,
      secondaryColor: Colors.red),
  TeamShield(
      resourcePath: "$imageInitialPath/logo-vasco-da-gama-256.png",
      primaryColor: Colors.white,
      secondaryColor: Colors.black),
  TeamShield(
      resourcePath: "$imageInitialPath/logo-vitoria-256.png",
      primaryColor: Colors.red,
      secondaryColor: Colors.black),
];
