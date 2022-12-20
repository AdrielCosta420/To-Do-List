import 'package:date_picker_timeline/date_picker_timeline.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:to_do_app/app/modules/tasks/domain/entities/task.dart';
import 'package:to_do_app/app/modules/tasks/domain/usecases/save_task_uc.dart';
import 'package:string_validator/string_validator.dart' as validate;

class CriarTaskPage extends StatefulWidget {
  const CriarTaskPage({Key? key}) : super(key: key);

  @override
  State<CriarTaskPage> createState() => _CriarTaskPageState();
}

class _CriarTaskPageState extends State<CriarTaskPage> {
  final SaveTaskUc saveTaskUc = Modular.get();
  final GlobalKey keyTask = GlobalKey<FormState>();
  final GlobalKey keyDescription = GlobalKey<FormState>();
  final DatePickerController _controller = DatePickerController();
  final TextEditingController _textEditingController = TextEditingController();
  final TextEditingController _textEditingControllerDescription =
      TextEditingController();
  final TextEditingController _controllerStartTime = TextEditingController();
  final TextEditingController _controllerEndTime = TextEditingController();

  DateTime _selectedValue = DateTime.now();
  //DateTime currentDateTime = DateTime.now();

  /* Widget titleView() {
    return Padding(
      padding: const EdgeInsets.fromLTRB(0, 0, 0, 20),
      child: Text(
        DateUtils.addMonthsToMonthDate(monthDate, monthsToAdd)[currentDateTime.month - 1] +
            ' ' +
            currentDateTime.year.toString(),
        style: const TextStyle(
            color: Colors.white, fontWeight: FontWeight.bold, fontSize: 20),
      ),
    );
  }*/

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black,
        centerTitle: true,
        title: Text(
          'Criar nova tarefa',
          style: GoogleFonts.notoSansWarangCiti(color: Colors.white),
        ),
        automaticallyImplyLeading: false,
        leading: IconButton(
          onPressed: () => Navigator.pop(context),
          icon: const Icon(
            Icons.highlight_remove_outlined,
            size: 30,
          ),
        ),
        actions: [
          FloatingActionButton(
            backgroundColor: Colors.black,
            child: const Icon(Icons.replay),
            onPressed: () {
              _controller.animateToSelection();
            },
          )
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              padding: const EdgeInsets.all(12),
              color: Colors.black,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  /*  const Text("You Selected:"),
                  const Padding(
                    padding: EdgeInsets.all(10),
                  ),*/
                  ListTile(
                    title: Center(
                      child: Text(
                        '14 Dez - 19 Dez',
                        style: GoogleFonts.notoSansWarangCiti(
                          fontSize: 20,
                          color: const Color.fromARGB(255, 124, 98, 219),
                        ),
                      ),
                    ),
                    leading: IconButton(
                      onPressed: () {},
                      icon: const Icon(
                        Icons.arrow_back_ios_new_rounded,
                        color: Color.fromARGB(255, 157, 140, 219),
                        size: 23.5,
                      ),
                    ),
                    trailing: IconButton(
                      onPressed: () {},
                      icon: const Icon(
                        Icons.arrow_forward_ios_rounded,
                        color: Color.fromARGB(255, 157, 140, 219),
                      ),
                    ),
                  ),
                  const Padding(
                    padding: EdgeInsets.all(7),
                  ),
                  //ContainerPaideDatePicker
                  DatePicker(
                    DateTime.now(),
                    width: 60,
                    height: 80,
                    locale: 'pt_BR',
                    controller: _controller,
                    initialSelectedDate: DateTime.now(),
                    selectionColor: const Color.fromARGB(255, 124, 98, 219),
                    selectedTextColor: Colors.white,
                    dateTextStyle: const TextStyle(color: Colors.white),
                    dayTextStyle: const TextStyle(color: Colors.white),
                    monthTextStyle: const TextStyle(color: Colors.white),
                    inactiveDates: const [
                      // DateTime.now().add(const Duration(days: 7)),
                      //DateTime.now().add(const Duration(days: 7)),
                      //DateTime.now().add(const Duration(days: 7))
                    ],
                    onDateChange: (date) {
                      // New date selected
                      setState(
                        () {
                          _selectedValue = date;
                        },
                      );
                    },
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 8.0, bottom: 30, left: 9),
              child: Row(
                children: [
                  Text(
                    'Cronograma',
                    style: GoogleFonts.notoSansWarangCiti(
                      color: Colors.white70,
                      fontSize: 25,
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 8.0, bottom: 0, left: 30),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: const [
                  Text(
                    'Nome da Tarefa',
                    style: TextStyle(color: Colors.white60),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
              child: Form(
                child: TextFormField(
                  key: keyTask,
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'O campo não pode ser vazio.';
                    }
                  },
                  controller: _textEditingController,
                  style: const TextStyle(
                    color: Colors.white,
                  ),
                  decoration: const InputDecoration(
                    counterStyle: TextStyle(color: Colors.white),
                    focusColor: Colors.yellow,
                    focusedBorder: OutlineInputBorder(
                      gapPadding: 20,
                      borderSide: BorderSide(color: Colors.white),
                      borderRadius: BorderRadius.all(
                        Radius.circular(20),
                      ),
                    ),
                    hintText: 'nome',
                    hintStyle: TextStyle(color: Colors.white30),
                    border: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.white),
                      borderRadius: BorderRadius.all(
                        Radius.circular(10),
                      ),
                    ),
                    enabledBorder: OutlineInputBorder(
                      gapPadding: 20,
                      borderSide: BorderSide(color: Colors.white10),
                      borderRadius: BorderRadius.all(
                        Radius.circular(20),
                      ),
                    ),
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 8.0, bottom: 0, left: 30),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: const [
                  Text(
                    'Descrição da Tarefa',
                    style: TextStyle(color: Colors.white60),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
              child: Form(
                child: TextFormField(
                  key: keyDescription,
                  controller: _textEditingControllerDescription,
                  style: const TextStyle(
                    color: Colors.white,
                  ),
                  decoration: const InputDecoration(
                    counterStyle: TextStyle(color: Colors.white),
                    focusColor: Colors.yellow,
                    focusedBorder: OutlineInputBorder(
                      gapPadding: 20,
                      borderSide: BorderSide(color: Colors.white),
                      borderRadius: BorderRadius.all(
                        Radius.circular(20),
                      ),
                    ),
                    hintText: 'descrição',
                    hintStyle: TextStyle(color: Colors.white30),
                    border: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.white),
                      borderRadius: BorderRadius.all(
                        Radius.circular(10),
                      ),
                    ),
                    enabledBorder: OutlineInputBorder(
                      gapPadding: 20,
                      borderSide: BorderSide(color: Colors.white10),
                      borderRadius: BorderRadius.all(
                        Radius.circular(20),
                      ),
                    ),
                  ),
                ),
              ),
            ),
            Row(
              children: [
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: TextFormField(
                      controller: _controllerStartTime,
                      keyboardType: TextInputType.datetime,
                      style: const TextStyle(color: Colors.white),
                      decoration: InputDecoration(
                        prefixIcon: const Icon(
                          Icons.access_time,
                          color: Color.fromARGB(255, 124, 98, 219),
                        ),
                        label: Text(
                          'Start Time',
                          style: GoogleFonts.notoSansWarangCiti(
                              color: Colors.white54),
                        ),
                        border: const OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.white),
                          borderRadius: BorderRadius.all(
                            Radius.circular(10),
                          ),
                        ),
                        enabledBorder: const OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.white54),
                          borderRadius: BorderRadius.all(
                            Radius.circular(20),
                          ),
                        ),
                        focusedBorder: const OutlineInputBorder(
                          gapPadding: 20,
                          borderSide: BorderSide(color: Colors.white),
                          borderRadius: BorderRadius.all(
                            Radius.circular(20),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: TextFormField(
                      controller: _controllerEndTime,
                      keyboardType: TextInputType.datetime,
                      style: const TextStyle(color: Colors.white),
                      decoration: InputDecoration(
                        prefixIcon: const Icon(
                          Icons.access_time,
                          color: Color.fromARGB(255, 124, 98, 219),
                        ),
                        label: Text(
                          'End Time',
                          style: GoogleFonts.notoSansWarangCiti(
                              color: Colors.white54),
                        ),
                        border: const OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.white),
                          borderRadius: BorderRadius.all(
                            Radius.circular(10),
                          ),
                        ),
                        enabledBorder: const OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.white54),
                          borderRadius: BorderRadius.all(
                            Radius.circular(20),
                          ),
                        ),
                        focusedBorder: const OutlineInputBorder(
                          gapPadding: 20,
                          borderSide: BorderSide(color: Colors.white),
                          borderRadius: BorderRadius.all(
                            Radius.circular(20),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.only(top: 30, bottom: 5, left: 9),
              child: Row(
                children: [
                  Text(
                    'Prioridade',
                    style: GoogleFonts.notoSansWarangCiti(
                      color: Colors.white70,
                      fontSize: 25,
                    ),
                  ),
                ],
              ),
            ),
            Row(
              children: [
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor:
                            const Color.fromARGB(103, 255, 251, 251),
                        elevation: 1,
                        shadowColor: const Color.fromARGB(255, 124, 98, 219),
                      ),
                      onPressed: () {},
                      child: Text(
                        'Alta',
                        style: GoogleFonts.notoSansWarangCiti(
                          fontSize: 15,
                        ),
                      ),
                    ),
                  ),
                ),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor:
                            const Color.fromARGB(103, 255, 251, 251),
                        elevation: 1,
                        shadowColor: const Color.fromARGB(255, 124, 98, 219),
                      ),
                      onPressed: () {},
                      child: Text(
                        'Média',
                        style: GoogleFonts.notoSansWarangCiti(
                          fontSize: 15,
                        ),
                      ),
                    ),
                  ),
                ),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        elevation: 1,
                        shadowColor: const Color.fromARGB(255, 124, 98, 219),
                        backgroundColor:
                            const Color.fromARGB(103, 255, 251, 251),
                      ),
                      onPressed: () {},
                      child: Text(
                        'Baixa',
                        style: GoogleFonts.notoSansWarangCiti(
                          fontSize: 15,
                        ),
                      ),
                    ),
                  ),
                )
              ],
            ),
            Padding(
              padding: const EdgeInsets.only(left: 8.0, top: 20),
              child: Row(
                children: [
                  Expanded(
                    flex: 2,
                    child: Text(
                      'Criar alerta para essa tarefa',
                      style: GoogleFonts.notoSansWarangCiti(
                        color: Colors.white,
                        fontSize: 20,
                      ),
                    ),
                  ),
                  Expanded(
                    flex: 1,
                    child: IconButton(
                      onPressed: () {},
                      icon: const Icon(
                        Icons.access_alarm_outlined,
                        color: Color.fromARGB(255, 212, 197, 54),
                        size: 30,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(20),
        child: Container(
          decoration: const BoxDecoration(
            boxShadow: [
              BoxShadow(
                color: Colors.white,
                blurRadius: 2,
              ),
            ],
            gradient: LinearGradient(
              colors: [
                Color(0xff95baf6),
                Color(0xff95baf6),
                Color(0xffab9eef),
                Color(0xffab9eef),
                Color(0xffbe89ea),
              ],
            ),
            borderRadius: BorderRadius.all(
              Radius.circular(15),
            ),
          ),
          height: 50,
          child: TextButton(
            child: Text(
              'Criar tarefa',
              style: GoogleFonts.notoSansWarangCiti(
                color: Colors.black,
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            onPressed: () {
              if (_textEditingController.text.isEmpty) {
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    behavior: SnackBarBehavior.floating,
                    backgroundColor: Colors.red,
                    action: SnackBarAction(
                      label: '',
                      onPressed: () {},
                    ),
                    content:
                        const Text('Necessário preencher o campo DESCRIÇÃO'),
                  ),
                );
              } else {
                saveTaskUc.call(
                  task: _textEditingController.text,
                  description: _textEditingControllerDescription.text,
                  dataSelecionada: _selectedValue,
                  horaFinal: _controllerEndTime.text,
                  horaInicial: _controllerStartTime.text,
                );
                Modular.to.pop();
                _textEditingController.clear();
                _textEditingControllerDescription.clear();
              }
            },
          ),
        ),
      ),
    );
  }
}
