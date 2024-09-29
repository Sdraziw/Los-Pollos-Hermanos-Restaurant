// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:preojeto/model/user_model.dart';

class CadastroView extends StatefulWidget {
  const CadastroView({super.key});

  @override
  State<CadastroView> createState() => _CadastroViewState();
}

class _CadastroViewState extends State<CadastroView> {
  _CadastroViewState();
  final formKey = GlobalKey<FormState>();

  bool _obscureText = true;
  bool _obscureText2 = true;

  final txtValor1 = TextEditingController();
  final txtValor2 = TextEditingController();
  final txtValor3 = TextEditingController();
  final txtValor4 = TextEditingController();
  final txtValor5 = TextEditingController();
  final txtValor6 = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
            backgroundColor: Color(0xFFFFD600),
        
            appBar: AppBar(
              backgroundColor: Color(0xFFFFD600),
            ),

            body: Container(

              color: const Color(0xFFFFD600),
              child: Form(
                  key: formKey,
                  child: Padding(
                      padding: const EdgeInsets.fromLTRB(50, 60, 50, 60),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [

                        // Nome Completo
                        TextFormField(
                          controller: txtValor1,
                          style: const TextStyle(fontSize: 18),
                          decoration: InputDecoration(
                            filled: true,
                            fillColor: Colors.white,
                            labelText: 'Nome Completo',
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(12),
                            ),
                          ),
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Informe seu nome completo';
                            }
                            return null;
                          },
                        ),

                        SizedBox(height: 20),

                        // Usuário
                        TextFormField(
                          controller: txtValor2,
                          style: const TextStyle(fontSize: 18),
                          decoration: InputDecoration(
                            filled: true,
                            fillColor: Colors.white,
                            labelText: 'Usuário',
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(12),
                            ),
                          ),
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Informe seu usuário';
                            }
                            return null;
                          },
                        ),
                        
                        SizedBox(height: 20),

                        // E-mail
                        TextFormField(
                          controller: txtValor3,
                          style: const TextStyle(fontSize: 18),
                          decoration: InputDecoration(
                            filled: true,
                            fillColor: Colors.white,
                            labelText: 'E-mail',
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(12),
                            ),
                          ),
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Informe seu e-mail';
                            }
                            return null;
                          },
                        ),
                        
                        SizedBox(height: 20),

                        // Confirmar e-mail
                        TextFormField(
                          controller: txtValor4,
                          style: const TextStyle(fontSize: 18),
                          decoration: InputDecoration(
                            filled: true,
                            fillColor: Colors.white,
                            labelText: 'Confirmar e-mail',
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(12),
                            ),
                          ),
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Informe seu usuário';
                            }
                            return null;
                          },
                        ),
                        
                        SizedBox(height: 20),

                        // Senha
                        TextFormField(
                          controller: txtValor5,
                          style: const TextStyle(fontSize: 18),
                          obscureText: _obscureText,
                          decoration: InputDecoration(
                            filled: true,
                            fillColor: Colors.white,
                            labelText: 'Senha',
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(12),
                            ),
                            suffixIcon: IconButton(
                              icon: Icon(
                                _obscureText ? Icons.visibility_off : Icons.visibility,
                              ),
                            onPressed: () {
                              setState(() {
                                _obscureText = !_obscureText;
                              });
                            },
                          ),
                          ),
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Informe seu usuário';
                            }
                            return null;
                          },
                        ),
                        
                        SizedBox(height: 20),

                        // Confirmar Senha
                        TextFormField(
                          controller: txtValor6,
                          style: const TextStyle(fontSize: 18),
                          obscureText: _obscureText2,
                          decoration: InputDecoration(
                            filled: true,
                            fillColor: Colors.white,
                            labelText: 'Confirmar Senha',
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(12),
                            ),
                            suffixIcon: IconButton(
                              icon: Icon(
                                _obscureText2 ? Icons.visibility_off : Icons.visibility,
                              ),
                              onPressed: () {
                              setState(() {
                                _obscureText2 = !_obscureText2;
                                });
                              },
                            ),
                          ),
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Informe seu usuário';
                            }
                            return null;
                          },
                        ),

                        SizedBox(height: 50),

                        ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            minimumSize: const Size(300, 50),
                            backgroundColor: const Color.fromARGB(255, 0, 0, 0),
                            foregroundColor: Colors.white,
                            textStyle: const TextStyle(fontSize: 15),
                          ),
                          onPressed: (){
                            String nome = txtValor1.text;
                            String email = txtValor3.text;
                            String senha = txtValor5.text;

                            Usuario.adicionarUser(nome, email, senha);

                            Navigator.pop(context);
                          }, 
                          child: Text('Cadastrar')),
                        
                      ]))),
            ));
  }
}
