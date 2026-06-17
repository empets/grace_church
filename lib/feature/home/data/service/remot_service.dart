
import 'package:grace_church/core/data_process/success.dart';
import 'package:grace_church/feature/home/data/model/home_model.dart';
import 'package:grace_church/feature/home/data/service/repository_remote_service.dart';
import 'package:grace_church/feature/home/domaine/entities/request/home_request.dart'
    hide EmptyRequest;
import 'package:injectable/injectable.dart';
import 'package:firebase_database/firebase_database.dart' as databaseReference;

@LazySingleton(as: DomaineServiceRepository)
class ImpDomaineServiceRepository implements DomaineServiceRepository {
  ImpDomaineServiceRepository({required this.db});

  final databaseReference.DatabaseReference db;
 
/// -------------------------- Methode:[getProfile] ---------------------------
/// context:
/// * Récupère le profil d'un membre à partir de son identifiant dans
/// Firebase Realtime Database.
/// * Cette méthode effectue une lecture sur le nœud
/// `menber/{numberId}` afin de rechercher les informations associées
/// au membre correspondant à l'identifiant fourni.
///
/// * Lorsque les données sont trouvées, elles sont désérialisées en
/// [ProfileResponseModel] puis retournées dans un objet
/// [FirebaseSuccess].
///
/// * Si aucun profil n'est trouvé pour l'identifiant demandé ou si une
/// erreur survient lors de la récupération ou de la conversion des
/// données, un objet [FirebaseError] est retourné contenant le détail
/// de l'erreur.
///
/// Paramètres :
/// * [notParms] : Contient l'identifiant unique du membre à rechercher.
///
/// Retourne :
/// * [FirebaseSuccess<ProfileResponseModel>] lorsque le profil est
///   récupéré avec succès.
/// * [FirebaseError] lorsque le profil est introuvable ou qu'une
///   erreur survient lors du traitement.
///
/// Gestion des erreurs :
/// * Profil inexistant dans la base de données.
/// * Données invalides ou incompatibles avec le modèle attendu.
/// * Erreurs de communication avec Firebase.
/// * Toute exception levée durant l'exécution est interceptée et
///   encapsulée dans un [FirebaseError].
  @override
  Future<FirebaseResult<ProfileResponseModel>> getProfile(
    RequestGetProfile notParms,
  ) async {
    try {
      final response = await db.child('menber/${notParms.numberId}').get();
      final data = Map<String, dynamic>.from(response.value as Map);
      if (response.exists) {
        final firebaseResult = ProfileResponseModel.fromJson(data);
        return FirebaseSuccess(firebaseResult);
      } else {
        return FirebaseError("une erreur est survenue");
      }
    } catch (e) {
      return FirebaseError('${e.toString()}');
    }
  }




}

