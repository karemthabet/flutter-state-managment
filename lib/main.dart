import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:practice/bussiness_logic/cubit/cubit/counter_cubit.dart';

void main() {
  runApp(CounterApp());
}

class CounterApp extends StatelessWidget {
  const CounterApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: BlocProvider(
        create: (context) => CounterCubit(),
        child: Scaffold(
          body: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                BlocBuilder<CounterCubit, CounterState>(
                  builder: (context, state) {
                    log("text");
                    return Text(
                      state.counter.toString(),
                      style: TextStyle(
                        fontSize: 50,
                        fontWeight: FontWeight.bold,
                      ),
                    );
                  },
                ),
                SizedBox(height: 20),
                BlocBuilder<CounterCubit, CounterState>(
                  builder: (context, state) {
                    return ElevatedButton(
                      onPressed: () {
                        context.read<CounterCubit>().increment();
                      },
                      child: Text('Increment'),
                    );
                  },
                ),

                BlocBuilder<CounterCubit, CounterState>(
                  builder: (context, state) {
                    log("elevete");

                    return ElevatedButton(
                      onPressed: () {
                        context.read<CounterCubit>().decrement();
                      },
                      child: Text('decrement'),
                    );
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
