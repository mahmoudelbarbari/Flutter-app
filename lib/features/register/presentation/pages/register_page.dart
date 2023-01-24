import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:order/features/register/domain/entities/register_entities.dart';
import 'package:order/features/register/presentation/cubit/register_cubit.dart';
import 'package:order/features/register/presentation/cubit/register_state.dart';
import 'package:order/features/register/presentation/pages/register_widget.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  RegisterAccountEntity registerAccountEntity = RegisterAccountEntity();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Register Page"),
      ),
      body: _buildBody(),
    );
  }

  Widget _buildBody() {
    return BlocProvider<RegisterCubit>(
      create: (_) => RegisterCubit(),
      child: Padding(
        padding: const EdgeInsets.all(10),
        child: BlocConsumer<RegisterCubit, RegisterState>(
          listener: (context, state) {
            if (state is CreateUserSuccessfully) {
              registerAccountEntity = state.registerAccountEntity;
              ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                  // margin: const EdgeInsets.all(20),
                  backgroundColor: Colors.green,
                  content: Text(
                      state.registerAccountEntity.message ?? "Successfully")));
            }
            if (state is RegisterErrorState) {
              ScaffoldMessenger.of(context)
                  .showSnackBar(SnackBar(content: Text(state.errorMessage)));
            }
          },
          builder: (context, state) {
            return RegisterWidget(registerAccountEntity: registerAccountEntity);
          },
        ),
      ),
    );
  }
}
