import 'package:flutter/material.dart';
//import 'package:flutter/services.dart';

import 'components/appbar.dart';
import 'components/buttonlist.dart';

void main() => runApp(const Lab());

class Lab extends StatelessWidget {
  const Lab({Key? key}) : super(key: key);

  static const String name =
      "110 bis, lab d'innovation de l'éducation nationale";
  static const List<String> test = [
    //""];
    "Le 110 bis, pourquoi est-ce pour moi ?",
    "Comment puis-je savoir ce qui se passe au lab, et comment participer ? ",
    "J’ai un projet et je souhaite être accompagné, comment faire ?",
    "button 4"
  ]; //,"button 5", "button 6", "button 7", "button 8", "button 9", "button 10", "button 11", "button 12", "button 13", "button 14", "button 15", "button 16", "button 17", "button 18", "button 19", "button 20"];
  static const List<String> test1 = [
    //""];
    "Vous êtes un agent de l’Education nationale, de l’Enseignement supérieur, d’une autre institution publique, un partenaire de l’école ou un citoyen, et vous souhaitez venir discuter d’un projet, solliciter notre offre d'accompagnement ou tout simplement participer et contribuer aux activités du lab 110 bis ? On vous explique !\n\nLa première question à vous poser en entrant au 110 bis : en quoi mon idée, mon projet, ma démarche est-elle différente des façons de faire habituelles de l’administration ? En quoi la session que je souhaite organiser au lab sera différente de celle que j’aurais organisée dans une salle de réunion ? En quoi les ressources disponibles au lab (compétences, méthodes, outils, etc.) peuvent me permettre d’appréhender mon projet ou mon dossier autrement ?\n\nEntrer au lab 110 bis, pour 1h, 1 jour ou 6 mois, c’est accepter de faire un pas de côté par rapport à la culture de l’administration, aux rapports hiérarchiques, aux cloisonnements des sujets et des expertises. C’est accepter d’explorer de nouvelles idées et d’être confronté à des points de vue différents. C’est aussi être dans une posture de “contributeur” : chaque usager du lab contribue à la vie du lieu et à la vie des projets de la communauté qui s’enrichissent mutuellement des compétences, idées et connaissances de chacun.",
    "Plusieurs manières de s’informer et de nous rencontrer : \n\n- Participez à la présentation mensuelle du lab ! Tous les troisièmes lundis du mois, de 9h30 à 10h30, le 110 bis vous accueille pour une présentation ouverte à tous (en présentiel ou en visio, une fois sur deux, pour permettre à tous de nous rencontrer). C’est l’occasion de venir découvrir le lab et poser toutes vos questions !\n- Consultez l’agenda du lab sur Openagenda et inscrivez-vous aux sessions ouvertes à tous et / ou ouvertes aux agents.\n- Abonnez-vous à nos actualités sur Twitter, Instagram, Facebook, Linkedin.\n- Inscrivez-vous à notre liste de diffusion.\n- Retrouvez toutes nos actualités, nos projets incubés, nos événements à travers nos billets sur notre page médium\n- Ecrivez-nous à 110bis@education.gouv.fr, toute l’équipe a accès à cette adresse et se fera un plaisir de répondre à votre demande",
    "Les projets ayant vocation à être accompagnés par le lab répondent aux critères suivants :\n\n✓ transversalité : le projet mobilise plusieurs parties prenantes (internes et / ou externes), croise plusieurs champs de compétences et propose des modalités de collaboration originales ;\n✓ centré sur les besoins usagers : le projet a pour objectif de résoudre un problème identifié sur le terrain par les usagers (parents, élèves, enseignants, agents...) et de les inclure à tous les niveaux du processus ;\n✓ impact : le projet propose un potentiel de création de valeur élevée pour les acteurs impliqués et un réel potentiel d'essaimage au niveau national ;\n✓ sponsor : le projet bénéficie d’un soutien de haut niveau qui garantit un certain degré de liberté dans l’expérimentation, une suite au travail qui sera effectué, ainsi que la “sécurisation” des porteurs de projet (temps dédié, responsabilisation, autonomie...) ;\n✓ lien avec les politiques publiques éducatives : le projet contribue à répondre à un problème public en lien avec les politiques éducatives.\n\nSans préjuger de la qualité du projet, le lab n’a pas vocation à accueillir ou à accompagner les demandes suivantes :\n\n✖ les réunions / séminaires / copil, etc. au format traditionnel ;\n✖ les événements de valorisation ou de promotion purs ;\n✖ les sessions récurrentes ;\n✖ les sessions nécessitant une logistique lourde ;\n✖ les remises de prix, finales de concours, etc. sans objectifs de production et de collaboration.",
    "coucou 4.png"
  ]; //, "button 5", "button 6", "button 7", "button 8", "button 9", "button 10", "button 11", "button 12", "button 13", "button 14", "button 15", "button 16", "button 17", "button 18", "button 19", "button 20"];

//    splitData(String rep) {
//      List<String> tmp;
//      tmp = rep.split(';');
//      for (var i = 0; i != tmp.length; ++i) {
//        if (i == 0) {
//          test[0]= tmp[i];
//          continue;
//        } else if (i == 1) {
//          test1[0] = tmp[i];
//          continue;
//        }
//        if (i % 2 == 0) {
//          test.add(tmp[i]);
//        } else {
//          test1.add(tmp[i]);
//        }
//      }
//    }
//
//    getData() async {
//      String rep = "";
//      rep = await rootBundle.loadString('assets/docs/data.txt');
//      print(rep);
//      await splitData(rep);
//    }

  @override
  Widget build(BuildContext context) {
    //if (test[0] == "" || test1[0] == "" || test == [] || test1 == []) {
    //  getData();
    //  return const Center(child: CircularProgressIndicator());
    //}
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      title: name,
      home: Scaffold(
        appBar: AppBarPage(),
        body: ButtonList(ask: test, answer: test1),
      ),
    );
  }
}
