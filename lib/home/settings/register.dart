import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class Crear {
  Future<void> registerProfesor(
    String email,
    String password,
    String nombre,
    String grado,
    String grupo,
    List<String> asignaturas,
  ) async {
    try {
      UserCredential userCredential =
          await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );

      String userId = userCredential.user!.uid;

      await FirebaseFirestore.instance
          .collection('profesores')
          .doc(userId)
          .set({
        'id': userId,
        'nombre': nombre,
        'grado': grado,
        'grupo': grupo,
        'asignaturas': asignaturas,
        'permiso': 'profesor',
      });

      print('Profesor registrado exitosamente.');
    } catch (e) {
      print('Error al registrar profesor: $e');
    }
  }

  Future<void> registerDirector(
      String email, String password, String nombre, String correo) async {
    try {
      UserCredential userCredential =
          await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );

      String userId = userCredential.user!.uid;

      await FirebaseFirestore.instance
          .collection('directores')
          .doc(userId)
          .set({
        'id': userId,
        'nombre': nombre,
        'correo': correo,
        'permiso': 'director',
      });

      print('Director registrado exitosamente.');
    } catch (e) {
      print('Error al registrar director: $e');
    }
  }

  Future<void> registerNino(
      String email,
      String password,
      String nombre,
      String diagnostico,
      String fechaNacimiento,
      int gradoEscolar,
      String grupos,
      String gravedad,
      [String? userId]) async {
    try {
      UserCredential userCredential =
          await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );

      String userId = userCredential.user!.uid;

      await FirebaseFirestore.instance.collection('niños').doc(userId).set({
        'id': userId,
        'nombre': nombre,
        'diagnostico': diagnostico,
        'fecha_nacimiento': fechaNacimiento,
        'grado_escolar': gradoEscolar,
        'grupo': grupos,
        'gravedad': gravedad,
        'permiso': 'nino',
      });

      print('Niño registrado exitosamente.');
    } catch (e) {
      print('Error al registrar niño: $e');
    }
  }

  Future<void> registerPadre(
      String email, String password, String nombre, List<String> hijos) async {
    try {
      UserCredential userCredential =
          await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );

      String userId = userCredential.user!.uid;

      await FirebaseFirestore.instance.collection('padres').doc(userId).set({
        'id': userId,
        'nombre': nombre,
        'hijos': hijos,
        'permiso': 'padre',
      });

      print('Padre registrado exitosamente.');
    } catch (e) {
      print('Error al registrar padre: $e');
    }
  }

  Future<void> registerPsicologo(String email, String password, String nombre,
      String especialidad, String gradoGrupoAsignado) async {
    try {
      UserCredential userCredential =
          await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );

      String userId = userCredential.user!.uid;

      await FirebaseFirestore.instance
          .collection('psicologos')
          .doc(userId)
          .set({
        'id': userId,
        'nombre': nombre,
        'especialidad': especialidad,
        'grado_grupo_asignado': gradoGrupoAsignado,
      });

      print('Psicólogo registrado exitosamente.');
    } catch (e) {
      print('Error al registrar psicólogo: $e');
    }
  }

  Future<void> registerAdmin(String email, String password) async {
    try {
      UserCredential userCredential =
          await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );

      String userId = userCredential.user!.uid;

      await FirebaseFirestore.instance.collection('admins').doc(userId).set({
        'id': userId,
        'email': email,
        'permiso': 'admin',
      });

      print('Admin registrado exitosamente.');
    } catch (e) {
      print('Error al registrar admin: $e');
    }
  }
}
