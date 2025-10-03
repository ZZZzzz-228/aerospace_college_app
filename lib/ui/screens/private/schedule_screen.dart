import 'package:flutter/material.dart';

class ScheduleScreen extends StatefulWidget {
  const ScheduleScreen({Key? key}) : super(key: key);

  @override
  _ScheduleScreenState createState() => _ScheduleScreenState();
}

class _ScheduleScreenState extends State<ScheduleScreen> with SingleTickerProviderStateMixin {
  late TabController _tabController;
  DateTime selectedDate = DateTime.now();

  final List<String> weekDays = ['ПН', 'ВТ', 'СР', 'ЧТ', 'ПТ', 'СБ'];
  final List<String> groups = ['ИС-21-1', 'ИС-22-1', 'ИС-23-1', 'АМ-21-1', 'АМ-22-1'];
  String selectedGroup = 'ИС-21-1';

  final Map<String, List<Map<String, dynamic>>> scheduleData = {
    'ИС-21-1': [
      {
        'time': '8:30 - 10:00',
        'subject': 'Основы программирования',
        'teacher': 'Иванов И.И.',
        'room': '204',
        'type': 'lecture',
      },
      {
        'time': '10:10 - 11:40',
        'subject': 'Математика',
        'teacher': 'Петрова М.С.',
        'room': '301',
        'type': 'practice',
      },
      {
        'time': '11:50 - 13:20',
        'subject': 'Базы данных',
        'teacher': 'Сидоров А.В.',
        'room': '205',
        'type': 'lab',
      },
      {
        'time': '14:00 - 15:30',
        'subject': 'Английский язык',
        'teacher': 'Johnson M.',
        'room': '102',
        'type': 'practice',
      },
    ],
    'ИС-22-1': [
      {
        'time': '8:30 - 10:00',
        'subject': 'Web-программирование',
        'teacher': 'Козлов Д.А.',
        'room': '206',
        'type': 'lab',
      },
      {
        'time': '10:10 - 11:40',
        'subject': 'Физика',
        'teacher': 'Морозова Е.П.',
        'room': '304',
        'type': 'lecture',
      },
      {
        'time': '11:50 - 13:20',
        'subject': 'Алгоритмы и структуры данных',
        'teacher': 'Васильев К.Н.',
        'room': '203',
        'type': 'practice',
      },
    ],
    'ИС-23-1': [
      {
        'time': '8:30 - 10:00',
        'subject': 'Введение в IT',
        'teacher': 'Смирнова О.Л.',
        'room': '201',
        'type': 'lecture',
      },
      {
        'time': '10:10 - 11:40',
        'subject': 'Информатика',
        'teacher': 'Николаев С.И.',
        'room': '207',
        'type': 'practice',
      },
      {
        'time': '11:50 - 13:20',
        'subject': 'История',
        'teacher': 'Федорова Н.М.',
        'room': '105',
        'type': 'lecture',
      },
    ],
    'АМ-21-1': [
      {
        'time': '8:30 - 10:00',
        'subject': 'Материаловедение',
        'teacher': 'Кузнецов В.А.',
        'room': '401',
        'type': 'lecture',
      },
      {
        'time': '10:10 - 11:40',
        'subject': 'Техническая механика',
        'teacher': 'Орлов П.Р.',
        'room': '402',
        'type': 'practice',
      },
      {
        'time': '11:50 - 13:20',
        'subject': 'Основы авиастроения',
        'teacher': 'Соколов М.Н.',
        'room': '405',
        'type': 'lab',
      },
    ],
    'АМ-22-1': [
      {
        'time': '8:30 - 10:00',
        'subject': 'Детали машин',
        'teacher': 'Попов А.С.',
        'room': '403',
        'type': 'lecture',
      },
      {
        'time': '10:10 - 11:40',
        'subject': 'Инженерная графика',
        'teacher': 'Белова И.В.',
        'room': '404',
        'type': 'practice',
      },
      {
        'time': '11:50 - 13:20',
        'subject': 'Физика',
        'teacher': 'Морозова Е.П.',
        'room': '304',
        'type': 'lecture',
      },
    ],
  };

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 6, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  Color _getTypeColor(String type) {
    switch (type) {
      case 'lecture':
        return const Color(0xFF2196F3);
      case 'practice':
        return const Color(0xFF4CAF50);
      case 'lab':
        return const Color(0xFF9C27B0);
      default:
        return Colors.grey;
    }
  }

  String _getTypeText(String type) {
    switch (type) {
      case 'lecture':
        return 'Лекция';
      case 'practice':
        return 'Практика';
      case 'lab':
        return 'Лаб. работа';
      default:
        return 'Занятие';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        // Header with gradient
        Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: [Color(0xFF2196F3), Color(0xFF1976D2)],
            ),
          ),
          child: SafeArea(
            bottom: false,
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Расписание',
                    style: TextStyle(
                      fontSize: 28,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    'Учебное расписание на неделю',
                    style: TextStyle(
                      fontSize: 16,
                      color: Colors.white.withOpacity(0.9),
                    ),
                  ),
                  const SizedBox(height: 20),
                  // Group selector
                  Container(
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(12),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.1),
                          blurRadius: 8,
                          offset: const Offset(0, 2),
                        ),
                      ],
                    ),
                    child: DropdownButtonFormField<String>(
                      value: selectedGroup,
                      decoration: InputDecoration(
                        labelText: 'Группа',
                        labelStyle: const TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w600,
                          color: Color(0xFF0E0202),
                        ),
                        prefixIcon: const Icon(Icons.group, color: Color(0xFF2196F3), size: 24),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12),
                          borderSide: BorderSide.none,
                        ),
                        filled: true,
                        fillColor: Colors.white,
                        contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
                      ),
                      style: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                        color: Color(0xFF1A1A1A),
                      ),
                      items: groups.map((group) {
                        return DropdownMenuItem(
                          value: group,
                          child: Text(
                            group,
                            style: const TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        );
                      }).toList(),
                      onChanged: (value) {
                        if (value != null) {
                          setState(() {
                            selectedGroup = value;
                          });
                        }
                      },
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
        // Week tabs
        Container(
          color: Colors.white,
          child: TabBar(
            controller: _tabController,
            isScrollable: true,
            indicatorColor: const Color(0xFF2196F3),
            labelColor: const Color(0xFF2196F3),
            unselectedLabelColor: Colors.grey[600],
            labelStyle: const TextStyle(fontWeight: FontWeight.w600),
            tabs: weekDays.map((day) => Tab(text: day)).toList(),
          ),
        ),
        // Schedule content
        Expanded(
          child: TabBarView(
            controller: _tabController,
            children: weekDays.map((day) => _buildScheduleDay()).toList(),
          ),
        ),
      ],
    );
  }

  Widget _buildScheduleDay() {
    final lessons = scheduleData[selectedGroup] ?? [];

    if (lessons.isEmpty) {
      return Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              Icons.free_breakfast,
              size: 64,
              color: Colors.grey[400],
            ),
            const SizedBox(height: 16),
            Text(
              'Занятий нет',
              style: TextStyle(
                fontSize: 18,
                color: Colors.grey[600],
                fontWeight: FontWeight.w500,
              ),
            ),
            const SizedBox(height: 8),
            Text(
              'Свободный день для самоподготовки',
              style: TextStyle(
                fontSize: 14,
                color: Colors.grey[500],
              ),
            ),
          ],
        ),
      );
    }

    return ListView.builder(
      padding: const EdgeInsets.all(20),
      itemCount: lessons.length,
      itemBuilder: (context, index) {
        final lesson = lessons[index];
        return _buildLessonCard(lesson, index);
      },
    );
  }

  Widget _buildLessonCard(Map<String, dynamic> lesson, int index) {
    final typeColor = _getTypeColor(lesson['type']);

    return Container(
      margin: const EdgeInsets.only(bottom: 16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.08),
            blurRadius: 12,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: IntrinsicHeight(
        child: Row(
          children: [
            // Time indicator
            Container(
              width: 4,
              decoration: BoxDecoration(
                color: typeColor,
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(16),
                  bottomLeft: Radius.circular(16),
                ),
              ),
            ),
            // Content
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Header with time and type
                    Row(
                      children: [
                        Container(
                          padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                          decoration: BoxDecoration(
                            color: typeColor.withOpacity(0.1),
                            borderRadius: BorderRadius.circular(6),
                          ),
                          child: Text(
                            lesson['time'],
                            style: TextStyle(
                              fontSize: 12,
                              fontWeight: FontWeight.w600,
                              color: typeColor,
                            ),
                          ),
                        ),
                        const Spacer(),
                        Container(
                          padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                          decoration: BoxDecoration(
                            color: typeColor.withOpacity(0.1),
                            borderRadius: BorderRadius.circular(6),
                          ),
                          child: Text(
                            _getTypeText(lesson['type']),
                            style: TextStyle(
                              fontSize: 12,
                              fontWeight: FontWeight.w500,
                              color: typeColor,
                            ),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 12),
                    // Subject
                    Text(
                      lesson['subject'],
                      style: const TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: Color(0xFF1A1A1A),
                      ),
                    ),
                    const SizedBox(height: 8),
                    // Teacher
                    Row(
                      children: [
                        Icon(
                          Icons.person,
                          size: 16,
                          color: Colors.grey[500],
                        ),
                        const SizedBox(width: 6),
                        Text(
                          lesson['teacher'],
                          style: TextStyle(
                            fontSize: 14,
                            color: Colors.grey[600],
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 6),
                    // Room
                    Row(
                      children: [
                        Icon(
                          Icons.room,
                          size: 16,
                          color: Colors.grey[500],
                        ),
                        const SizedBox(width: 6),
                        Text(
                          'Аудитория ${lesson['room']}',
                          style: TextStyle(
                            fontSize: 14,
                            color: Colors.grey[600],
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
