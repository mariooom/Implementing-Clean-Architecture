import 'package:clean_arch/core/cubit/task/user_cubit.dart';
import 'package:clean_arch/presentaion/widgets/custom_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class UserScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text(
          'Users',
          style: TextStyle(
            color: Colors.white,
            fontSize: 24,
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
        backgroundColor: Colors.deepPurple,
      ),
      body: BlocBuilder<UserCubit, UserState>(
        builder: (context, state) {
          if (state is UserInitial) {
            return Center(
              child: CustomButton(
                text: 'Load Users',
                onPressed: () {
                  context.read<UserCubit>().loadUsers();
                },
              ),
            );
          } else if (state is UserLoading) {
            return Center(child: CircularProgressIndicator());
          } else if (state is UserLoaded) {
            return ListView.builder(
              itemCount: state.users.length,
              itemBuilder: (context, index) {
                final user = state.users[index];
                return ListTile(
                  horizontalTitleGap: 12.0,
                  leading: CircleAvatar(
                    backgroundImage: NetworkImage(user.image),
                  ),
                  trailing: IconButton(
                    icon: Icon(
                      size: 20,
                      Icons.delete,
                      color: const Color.fromARGB(255, 149, 143, 164),
                    ),
                    onPressed: () {
                      showDialog(
                        context: context,
                        builder: (context) => AlertDialog(
                          title: Text('Delete User'),
                          content: Text(
                              'Are you sure you want to delete ${user.firstName} ${user.lastName}?'),
                          actions: [
                            TextButton(
                              onPressed: () => Navigator.pop(context),
                              child: Text('Cancel'),
                            ),
                            TextButton(
                              onPressed: () {
                                context.read<UserCubit>().removeUser(user);
                                Navigator.pop(context);
                              },
                              child: Text('Delete'),
                            ),
                          ],
                        ),
                      );
                    },
                  ),
                  title: Text('${user.firstName} ${user.lastName}'),
                  subtitle: Text(user.email),
                );
              },
            );
          } else if (state is UserError) {
            return Center(child: Text('Error: ${state.message}'));
          }
          return Container();
        },
      ),
    );
  }
}