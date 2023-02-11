import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:reqres_in_clean_architecture/features/user/presentation/cubit/user_cubit.dart';

class UserPage extends StatelessWidget {
  const UserPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          centerTitle: true,
          title: const Text(
            "Users",
          )),
      body: BlocBuilder<UserCubit, UserState>(
        builder: (context, state) {
          if (state is UserLoading) {
            return const Center(child: CupertinoActivityIndicator());
          } else if (state is UserSuccess) {
            return ListView.builder(
              physics: const BouncingScrollPhysics(),
              itemCount: state.result.length,
              itemBuilder: (context, index) {
                return Column(
                  children: [
                    const SizedBox(height: 30),
                    ListTile(
                      leading: CircleAvatar(
                        backgroundImage: NetworkImage(state.result[index].avatar),
                      ),
                      title: Text('${state.result[index].firstName} '),
                      subtitle: Text(state.result[index].email),
                    ),
                    if (index == state.result.length - 1)
                      TextButton(
                          onPressed: () {
                            context.read<UserCubit>().pagination();
                          },
                          child: const Text("Fetch"))
                  ],
                );
              },
            );
          } else if (state is UserFailure) {
            return Text(state.message);
          }
          return const SizedBox.shrink();
        },
      ),
    );
  }
}
