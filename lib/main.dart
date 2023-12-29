import 'package:bloc_api_test/bloc/api_bloc.dart';
import 'package:bloc_api_test/resources/api_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final ApiBloc _dataBloc = ApiBloc();

  @override
  void initState() {
    _dataBloc.add(GetDataList());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('BLOC API INTEGRATION')),
      body: _buildBody(),
    );
  }

  Widget _buildBody() {
    return Container(
      margin: EdgeInsets.all(8.0),
      child: BlocProvider(
        create: (_) => _dataBloc,
        child: BlocListener<ApiBloc, ApiState>(
          listener: (context, state) {
            if (state is DataError) {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: Text(state.message!),
                ),
              );
            }
          },
          child: BlocBuilder<ApiBloc, ApiState>(
            builder: (context, state) {
              if (state is InitialData) {
                return _buildLoading();
              } else if (state is LoadingData) {
                return _buildLoading();
              } else if (state is LoadedData) {
                return ListView.builder(
                  itemCount: state.apiModel.length,
                  itemBuilder: (context, index) {
                    ApiModel apiModel = state.apiModel[index];
                    return Container(
                      margin: EdgeInsets.all(8.0),
                      child: Card(
                        child: Container(
                          margin: EdgeInsets.all(8.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  CircleAvatar(
                                    radius: 50,
                                    backgroundImage:
                                        NetworkImage(apiModel.url.toString()),
                                  ),
                                  SizedBox(
                                      width: 200,
                                      height: 100,
                                      child: Image.network(
                                          apiModel.url.toString()))
                                ],
                              ),
                              Text(" albumId: ${apiModel.albumId.toString()}"),
                              Text(" Id: ${apiModel.id.toString()}"),
                              Text(" title: ${apiModel.title.toString()}"),
                            ],
                          ),
                        ),
                      ),
                    );
                  },
                );
                ;
              } else if (state is DataError) {
                return Container();
              } else {
                return Container();
              }
            },
          ),
        ),
      ),
    );
  }

  Widget _buildLoading() => Center(child: CircularProgressIndicator());
}
