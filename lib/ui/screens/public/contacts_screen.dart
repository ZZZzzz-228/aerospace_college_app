import 'package:flutter/material.dart';

class ContactsScreen extends StatelessWidget {
  const ContactsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: const Color(0xFFF5F5F5),
      child: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Заголовок
              const Text(
                'Контакты',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w600,
                  color: Color(0xFF212121),
                ),
              ),
              const SizedBox(height: 20),

              // Основная информация о центре карьеры
              Container(
                width: double.infinity,
                padding: const EdgeInsets.all(20),
                decoration: BoxDecoration(
                  color: const Color(0xFFE3F2FD),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    const Text(
                      'ЦЕНТР КАРЬЕРЫ',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: Color(0xFF212121),
                      ),
                    ),
                    const SizedBox(height: 8),
                    const Text(
                      'Сибирский государственный университет науки и технологий имени академика М.Ф. Решетнёва, аэрокосмический колледж',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 13,
                        color: Color(0xFF757575),
                        height: 1.4,
                      ),
                    ),
                    const SizedBox(height: 20),

                    // Контактные данные
                    _buildContactRow(Icons.phone, '+7 (391) 264-06-59', const Color(0xFF2196F3)),
                    const SizedBox(height: 12),
                    _buildContactRow(Icons.phone, '+7 (391) 264-57-35', const Color(0xFF2196F3)),
                    const SizedBox(height: 12),
                    _buildContactRow(Icons.phone, '+7 (391) 264-15-88', const Color(0xFF2196F3)),
                    const SizedBox(height: 12),
                    _buildContactRow(Icons.email, 'ak@sibsau.ru', const Color(0xFF2196F3)),
                    const SizedBox(height: 12),
                    _buildContactRow(Icons.language, 'sibsau.ru', const Color(0xFF2196F3)),
                    const SizedBox(height: 12),
                    _buildContactRow(Icons.language, 'sibgu.ru', const Color(0xFF2196F3)),
                    const SizedBox(height: 20),

                    // Дополнительная информация
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        _buildInfoItem(Icons.access_time, '08:00-17:00'),
                        _buildInfoItem(Icons.people, '500+ студентов'),
                        _buildInfoItem(Icons.support_agent, 'Онлайн поддержка'),
                      ],
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 20),

              // Заголовок сотрудников
              const Text(
                'Сотрудники',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w600,
                  color: Color(0xFF212121),
                ),
              ),
              const SizedBox(height: 16),

              // Список сотрудников
              _buildStaffCard(
                'Тимошев Павел Викторович',
                'Директор Аэрокосмического Колледжа',
                'ak@sibsau.ru',
                '2919115',
                'Часы приёма: вторник, четверг с 14:00 до 16:00',
                'assets/images/timoshev.jpg', // картинка для Тимошева
              ),
              const SizedBox(height: 12),

              _buildStaffCard(
                'Иванова Елена Сергеевна',
                'Заместитель директора по учебной работе',
                'ivanova@sibsau.ru',
                '+7 (391) 264-12-34',
                'Понедельник, среда 10:00-16:00',
                null,
              ),
              const SizedBox(height: 12),

              _buildStaffCard(
                'Петров Александр Николаевич',
                'Заведующий отделением информационных технологий',
                'petrov@sibsau.ru',
                '+7 (391) 264-56-78',
                'Вторник, четверг 9:00-15:00',
                null,
              ),
              const SizedBox(height: 12),

              _buildStaffCard(
                'Сидорова Мария Владимировна',
                'Заведующая отделением аэрокосмических технологий',
                'sidorova@sibsau.ru',
                '+7 (391) 264-90-12',
                'Понедельник, пятница 11:00-17:00',
                null,
              ),
              const SizedBox(height: 12),

              _buildStaffCard(
                'Козлов Дмитрий Андреевич',
                'Заведующий отделением машиностроения',
                'kozlov@sibsau.ru',
                '+7 (391) 264-34-56',
                'Среда, пятница 10:00-16:00',
                null,
              ),
              const SizedBox(height: 12),

              _buildStaffCard(
                'Морозова Анна Игоревна',
                'Специалист по трудоустройству',
                'morozova@sibsau.ru',
                '+7 (391) 264-78-90',
                'Ежедневно 9:00-17:00',
                null,
              ),
              const SizedBox(height: 100), // Отступ для навигации
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildContactRow(IconData icon, String text, Color color) {
    return Row(
      children: [
        Icon(icon, size: 18, color: color),
        const SizedBox(width: 8),
        Text(
          text,
          style: TextStyle(
            fontSize: 14,
            color: color,
          ),
        ),
      ],
    );
  }

  Widget _buildInfoItem(IconData icon, String text) {
    return Column(
      children: [
        Icon(icon, color: const Color(0xFF757575), size: 20),
        const SizedBox(height: 4),
        Text(
          text,
          style: const TextStyle(
            fontSize: 10,
            color: Color(0xFF757575),
          ),
          textAlign: TextAlign.center,
        ),
      ],
    );
  }

  Widget _buildStaffCard(
      String name,
      String position,
      String email,
      String phone,
      String workingHours,
      String? photoPath,
      ) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 10,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Фото сотрудника
          Container(
            width: 60,
            height: 60,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
            ),
            child: ClipOval(
              child: photoPath != null
                  ? Image.asset(photoPath, fit: BoxFit.cover)
                  : Container(
                color: const Color(0xFFBDBDBD).withOpacity(0.3),
                child: const Icon(Icons.person, size: 30, color: Color(0xFF757575)),
              ),
            ),
          ),
          const SizedBox(width: 16),

          // Информация о сотруднике
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  name,
                  style: const TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w600,
                    color: Color(0xFF212121),
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  position,
                  style: const TextStyle(
                    fontSize: 12,
                    color: Color(0xFF2196F3),
                    fontWeight: FontWeight.w500,
                  ),
                ),
                const SizedBox(height: 8),
                _buildContactRow(Icons.email_outlined, email, const Color(0xFF757575)),
                const SizedBox(height: 4),
                _buildContactRow(Icons.phone_outlined, phone, const Color(0xFF757575)),
                const SizedBox(height: 8),
                Text(
                  workingHours,
                  style: const TextStyle(
                    fontSize: 11,
                    color: Color(0xFF9E9E9E),
                    fontStyle: FontStyle.italic,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
