import 'package:flutter/material.dart';

class VacanciesScreen extends StatefulWidget {
  const VacanciesScreen({Key? key}) : super(key: key);

  @override
  _VacanciesScreenState createState() => _VacanciesScreenState();
}

class _VacanciesScreenState extends State<VacanciesScreen> {
  String searchQuery = '';
  String selectedFilter = 'Все';

  final List<String> filters = ['Все', 'IT', 'Образование', 'Производство', 'Сервис'];

  final List<Map<String, dynamic>> vacancies = [
    {
      'title': 'Flutter Developer',
      'company': 'ТехноСофт ООО',
      'salary': '80 000 - 120 000 ₽',
      'location': 'Новосибирск',
      'type': 'Полная занятость',
      'description': 'Разработка мобильных приложений на Flutter. Опыт работы от 2 лет.',
      'requirements': ['Flutter/Dart', 'REST API', 'Git', 'Figma'],
      'category': 'IT',
    },
    {
      'title': 'Преподаватель информатики',
      'company': 'Аэрокосмический колледж СибГУ',
      'salary': '45 000 - 65 000 ₽',
      'location': 'Новосибирск',
      'type': 'Полная занятость',
      'description': 'Преподавание дисциплин по информатике и программированию.',
      'requirements': ['Высшее образование', 'Знание программирования', 'Опыт преподавания'],
      'category': 'Образование',
    },
    {
      'title': 'Системный администратор',
      'company': 'ИТ-Центр Сибири',
      'salary': '60 000 - 90 000 ₽',
      'location': 'Новосибирск',
      'type': 'Полная занятость',
      'description': 'Администрирование серверов, настройка сетевого оборудования, техническая поддержка пользователей.',
      'requirements': ['Windows Server', 'Linux', 'Active Directory', 'Cisco/Mikrotik'],
      'category': 'IT',
    },
    {
      'title': 'Python Developer',
      'company': 'DataTech Solutions',
      'salary': '70 000 - 110 000 ₽',
      'location': 'Новосибирск',
      'type': 'Полная занятость',
      'description': 'Разработка backend-решений на Python. Работа с базами данных и API.',
      'requirements': ['Python', 'Django/Flask', 'PostgreSQL', 'Docker'],
      'category': 'IT',
    },
    {
      'title': 'DevOps Engineer',
      'company': 'CloudTech НСК',
      'salary': '90 000 - 140 000 ₽',
      'location': 'Новосибирск',
      'type': 'Полная занятость',
      'description': 'Настройка CI/CD процессов, управление облачной инфраструктурой, мониторинг систем.',
      'requirements': ['Docker/Kubernetes', 'AWS/Azure', 'Jenkins/GitLab CI', 'Terraform'],
      'category': 'IT',
    },
    {
      'title': 'Frontend Developer',
      'company': 'WebStudio Новосибирск',
      'salary': '65 000 - 95 000 ₽',
      'location': 'Новосибирск',
      'type': 'Полная занятость',
      'description': 'Разработка пользовательских интерфейсов на React/Vue.js. Верстка адаптивных веб-сайтов.',
      'requirements': ['HTML/CSS/JS', 'React/Vue.js', 'SASS/SCSS', 'Webpack'],
      'category': 'IT',
    },
    {
      'title': 'Сетевой администратор',
      'company': 'СибТелеком',
      'salary': '55 000 - 75 000 ₽',
      'location': 'Новосибирск',
      'type': 'Полная занятость',
      'description': 'Обслуживание и настройка сетевого оборудования, мониторинг сетевой инфраструктуры.',
      'requirements': ['CCNA/CCNP', 'TCP/IP', 'VLAN', 'Опыт работы с коммутаторами'],
      'category': 'IT',
    },
    {
      'title': 'Java Developer',
      'company': 'Enterprise Solutions',
      'salary': '85 000 - 125 000 ₽',
      'location': 'Новосибирск',
      'type': 'Полная занятость',
      'description': 'Разработка корпоративных приложений на Java. Работа с микросервисной архитектурой.',
      'requirements': ['Java', 'Spring Framework', 'Maven/Gradle', 'MySQL/PostgreSQL'],
      'category': 'IT',
    },
  ];

  List<Map<String, dynamic>> get filteredVacancies {
    return vacancies.where((vacancy) {
      final matchesSearch = vacancy['title'].toLowerCase().contains(searchQuery.toLowerCase()) ||
          vacancy['company'].toLowerCase().contains(searchQuery.toLowerCase());
      final matchesFilter = selectedFilter == 'Все' || vacancy['category'] == selectedFilter;
      return matchesSearch && matchesFilter;
    }).toList();
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
                    'Вакансии',
                    style: TextStyle(
                      fontSize: 28,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    'Найдите работу своей мечты',
                    style: TextStyle(
                      fontSize: 16,
                      color: Colors.white.withOpacity(0.9),
                    ),
                  ),
                  const SizedBox(height: 20),
                  // Search field
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
                    child: TextField(
                      onChanged: (value) {
                        setState(() {
                          searchQuery = value;
                        });
                      },
                      decoration: InputDecoration(
                        hintText: 'Поиск вакансий...',
                        prefixIcon: const Icon(Icons.search, color: Color(0xFF2196F3)),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12),
                          borderSide: BorderSide.none,
                        ),
                        filled: true,
                        fillColor: Colors.white,
                        contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
        // Filter chips
        Container(
          color: Colors.grey[50],
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
          child: SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              children: filters.map((filter) {
                final isSelected = selectedFilter == filter;
                return Padding(
                  padding: const EdgeInsets.only(right: 12),
                  child: FilterChip(
                    label: Text(filter),
                    selected: isSelected,
                    onSelected: (selected) {
                      setState(() {
                        selectedFilter = filter;
                      });
                    },
                    backgroundColor: Colors.white,
                    selectedColor: const Color(0xFF2196F3).withOpacity(0.2),
                    checkmarkColor: const Color(0xFF2196F3),
                    labelStyle: TextStyle(
                      color: isSelected ? const Color(0xFF2196F3) : Colors.grey[700],
                      fontWeight: isSelected ? FontWeight.w600 : FontWeight.normal,
                    ),
                    side: BorderSide(
                      color: isSelected ? const Color(0xFF2196F3) : Colors.grey[300]!,
                      width: 1,
                    ),
                  ),
                );
              }).toList(),
            ),
          ),
        ),
        // Vacancies list
        Expanded(
          child: filteredVacancies.isEmpty
              ? Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  Icons.work_off,
                  size: 64,
                  color: Colors.grey[400],
                ),
                const SizedBox(height: 16),
                Text(
                  'Вакансии не найдены',
                  style: TextStyle(
                    fontSize: 18,
                    color: Colors.grey[600],
                    fontWeight: FontWeight.w500,
                  ),
                ),
                const SizedBox(height: 8),
                Text(
                  'Попробуйте изменить критерии поиска',
                  style: TextStyle(
                    fontSize: 14,
                    color: Colors.grey[500],
                  ),
                ),
              ],
            ),
          )
              : ListView.builder(
            padding: const EdgeInsets.all(20),
            itemCount: filteredVacancies.length,
            itemBuilder: (context, index) {
              final vacancy = filteredVacancies[index];
              return _buildVacancyCard(vacancy);
            },
          ),
        ),
      ],
    );
  }

  Widget _buildVacancyCard(Map<String, dynamic> vacancy) {
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
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Header
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Company logo placeholder
                Container(
                  width: 48,
                  height: 48,
                  decoration: BoxDecoration(
                    gradient: const LinearGradient(
                      colors: [Color(0xFF2196F3), Color(0xFF1976D2)],
                    ),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: const Icon(
                    Icons.business,
                    color: Colors.white,
                    size: 24,
                  ),
                ),
                const SizedBox(width: 12),
                // Job info
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        vacancy['title'],
                        style: const TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: Color(0xFF1A1A1A),
                        ),
                      ),
                      const SizedBox(height: 4),
                      Text(
                        vacancy['company'],
                        style: TextStyle(
                          fontSize: 14,
                          color: Colors.grey[600],
                        ),
                      ),
                    ],
                  ),
                ),
                // Bookmark icon
                IconButton(
                  onPressed: () {},
                  icon: const Icon(
                    Icons.bookmark_border,
                    color: Color(0xFF2196F3),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 16),
            // Salary
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
              decoration: BoxDecoration(
                color: const Color(0xFF4CAF50).withOpacity(0.1),
                borderRadius: BorderRadius.circular(8),
              ),
              child: Text(
                vacancy['salary'],
                style: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                  color: Color(0xFF4CAF50),
                ),
              ),
            ),
            const SizedBox(height: 12),
            // Location and type
            Row(
              children: [
                Icon(
                  Icons.location_on,
                  size: 16,
                  color: Colors.grey[500],
                ),
                const SizedBox(width: 4),
                Text(
                  vacancy['location'],
                  style: TextStyle(
                    fontSize: 14,
                    color: Colors.grey[600],
                  ),
                ),
                const SizedBox(width: 16),
                Icon(
                  Icons.access_time,
                  size: 16,
                  color: Colors.grey[500],
                ),
                const SizedBox(width: 4),
                Text(
                  vacancy['type'],
                  style: TextStyle(
                    fontSize: 14,
                    color: Colors.grey[600],
                  ),
                ),
              ],
            ),
            const SizedBox(height: 12),
            // Description
            Text(
              vacancy['description'],
              style: TextStyle(
                fontSize: 14,
                color: Colors.grey[700],
                height: 1.4,
              ),
            ),
            const SizedBox(height: 12),
            // Requirements
            Wrap(
              spacing: 8,
              runSpacing: 8,
              children: (vacancy['requirements'] as List<String>).map((req) {
                return Container(
                  padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                  decoration: BoxDecoration(
                    color: const Color(0xFF9C27B0).withOpacity(0.1),
                    borderRadius: BorderRadius.circular(6),
                  ),
                  child: Text(
                    req,
                    style: const TextStyle(
                      fontSize: 12,
                      color: Color(0xFF9C27B0),
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                );
              }).toList(),
            ),
            const SizedBox(height: 16),
            // Apply button
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: Text('Отклик на вакансию "${vacancy['title']}" отправлен!'),
                      backgroundColor: const Color(0xFF4CAF50),
                    ),
                  );
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFF2196F3),
                  foregroundColor: Colors.white,
                  padding: const EdgeInsets.symmetric(vertical: 12),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                  elevation: 0,
                ),
                child: const Text(
                  'Откликнуться',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}