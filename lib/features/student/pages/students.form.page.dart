import 'package:app_academico/features/carrer/providers/career.provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../models/student.model.dart';
import '../providers/student.provider.dart';

class StudentsFormPage extends StatefulWidget {
  final Student? student;

  const StudentsFormPage({
    super.key,
    this.student,
  });

  @override
  State<StudentsFormPage> createState() =>
      _StudentsFormPageState();
}

class _StudentsFormPageState
    extends State<StudentsFormPage> {

  final _formKey =
      GlobalKey<FormState>();

  late final TextEditingController
      _codeCtrl;

  late final TextEditingController
      _firstNameCtrl;

  late final TextEditingController
      _lastNameCtrl;

  /// RELACIÓN
  int? _selectedCareerId;

  bool get isEdit =>
      widget.student != null;

  @override
  void initState() {
    super.initState();

    final s = widget.student;

    _codeCtrl = TextEditingController(
      text: s?.code ?? '',
    );

    _firstNameCtrl =
        TextEditingController(
      text: s?.firstName ?? '',
    );

    _lastNameCtrl =
        TextEditingController(
      text: s?.lastName ?? '',
    );

    /// SI EDITA → PRECARGA CAREER
    _selectedCareerId =
        s?.careerId;
  }

  @override
  void dispose() {
    _codeCtrl.dispose();
    _firstNameCtrl.dispose();
    _lastNameCtrl.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {

    final careerProvider =
        context.watch<CareerProvider>();

    return Scaffold(

      appBar: AppBar(
        title: Text(
          isEdit
              ? 'Editar estudiante'
              : 'Nuevo estudiante',
        ),
      ),

      body: SafeArea(
        child: Padding(
          padding:
              const EdgeInsets.all(16),

          child: SingleChildScrollView(
            child: Form(
              key: _formKey,

              child: Column(
                crossAxisAlignment:
                    CrossAxisAlignment
                        .stretch,

                children: [

                  /// ======================
                  /// INFO ACADÉMICA
                  /// ======================
                  const _SectionTitle(
                    title:
                        'Información Académica',
                  ),

                  _buildTextField(
                    _codeCtrl,
                    'Código',
                    Icons.badge,
                    required: true,
                  ),

                  /// DROPDOWN CARRERA
                  DropdownButtonFormField<int>(

                    value:
                        _selectedCareerId,

                    decoration:
                        const InputDecoration(
                      labelText:
                          'Carrera',

                      prefixIcon:
                          Icon(Icons.school),

                      border:
                          OutlineInputBorder(),
                    ),

                    items:
                        careerProvider
                            .careers
                            .map(
                              (career) =>
                                  DropdownMenuItem(
                                value:
                                    career.id,

                                child: Text(
                                  career.name,
                                ),
                              ),
                            )
                            .toList(),

                    onChanged: (value) {

                      setState(() {

                        _selectedCareerId =
                            value;
                      });
                    },

                    validator: (value) =>
                        value == null
                            ? 'Seleccione una carrera'
                            : null,
                  ),

                  const SizedBox(
                    height: 20,
                  ),

                  /// ======================
                  /// DATOS PERSONALES
                  /// ======================
                  const _SectionTitle(
                    title:
                        'Datos Personales',
                  ),

                  _buildTextField(
                    _firstNameCtrl,
                    'Nombres',
                    Icons.person,
                    required: true,
                  ),

                  _buildTextField(
                    _lastNameCtrl,
                    'Apellidos',
                    Icons.person_outline,
                    required: true,
                  ),

                  const SizedBox(
                    height: 20,
                  ),

                  _SaveButton(
                    onPressed:
                        _handleSave,
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  /// ======================
  /// INPUT GENERICO
  /// ======================
  Widget _buildTextField(
    TextEditingController ctrl,
    String label,
    IconData icon, {

    bool required = false,
    TextInputType? type,
  }) {

    return Padding(
      padding:
          const EdgeInsets.only(
        bottom: 16,
      ),

      child: TextFormField(

        controller: ctrl,

        keyboardType: type,

        decoration: InputDecoration(
          labelText: label,

          prefixIcon: Icon(icon),

          border:
              const OutlineInputBorder(),
        ),

        validator: required
            ? (v) =>
                (v == null || v.isEmpty)
                    ? 'Campo requerido'
                    : null
            : null,
      ),
    );
  }

  /// ======================
  /// GUARDAR
  /// ======================
  void _handleSave() {

    if (!_formKey.currentState!
        .validate()) {
      return;
    }

    final provider =
        context.read<StudentProvider>();

    final student = Student(

      id: widget.student?.id ??
          DateTime.now()
              .millisecondsSinceEpoch,

      code:
          _codeCtrl.text.trim(),

      firstName:
          _firstNameCtrl.text.trim(),

      lastName:
          _lastNameCtrl.text.trim(),

      /// RELACIÓN GUARDADA
      careerId:
          _selectedCareerId!,

      /// OTROS CAMPOS DEMO
      gender: "F",

      birthDate:
          DateTime(2000, 6, 9),

      email:
          "correo@gmail.com",

      phone: "1800",

      photoUrl: "",
    );

    if (isEdit) {

      provider.updateStudent(
        student,
      );

    } else {

      provider.addStudent(
        student,
      );
    }

    Navigator.pop(
      context,
      true,
    );
  }
}

/// ======================
/// UI COMPONENTS
/// ======================

class _SectionTitle
    extends StatelessWidget {

  final String title;

  const _SectionTitle({
    required this.title,
  });

  @override
  Widget build(BuildContext context) {

    return Padding(

      padding:
          const EdgeInsets.only(
        bottom: 12,
      ),

      child: Text(
        title,

        style: Theme.of(context)
            .textTheme
            .titleMedium
            ?.copyWith(
              fontWeight:
                  FontWeight.bold,

              color:
                  Colors.blueGrey,
            ),
      ),
    );
  }
}

class _SaveButton
    extends StatelessWidget {

  final VoidCallback onPressed;

  const _SaveButton({
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {

    return SizedBox(

      height: 50,

      child: FilledButton.icon(

        onPressed: onPressed,

        icon: const Icon(
          Icons.save,
        ),

        label: const Text(
          'GUARDAR ESTUDIANTE',

          style: TextStyle(
            fontWeight:
                FontWeight.bold,
          ),
        ),
      ),
    );
  }
}