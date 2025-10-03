import 'package:flutter/material.dart';

class NewsScreen extends StatelessWidget {
  const NewsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Заголовок
            const Text(
              'Новости',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.w600,
                color: Color(0xFF212121),
              ),
            ),

            const SizedBox(height: 20),

            // Главная новость
            Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(12),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.05),
                    blurRadius: 5,
                    offset: const Offset(0, 2),
                  ),
                ],
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Картинка главной новости
                  ClipRRect(
                    borderRadius: BorderRadius.circular(8),
                    child: Image.asset(
                      'assets/images/news_main.jpg',
                      width: double.infinity,
                      height: 150,
                      fit: BoxFit.cover,
                    ),
                  ),

                  const SizedBox(height: 12),

                  const Text(
                    'В Волгограде наградили победителей «Зарницы 2.0»',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                      color: Color(0xFF212121),
                    ),
                  ),

                  const SizedBox(height: 8),

                  const Text(
                    'На Мамаевом кургане состоялась торжественная церемония награждения участников.',
                    style: TextStyle(
                      fontSize: 14,
                      color: Color(0xFF757575),
                    ),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 16),

            // Простые новости
            _buildSimpleNewsCard(
              'Открытие лаборатории робототехники',
              'В колледже открылась новая лаборатория.',
              '2 часа назад',
              'assets/images/puJJ5.jpg',
            ),

            const SizedBox(height: 12),

            _buildSimpleNewsCard(
              'Призовые места студентов',
              'Команда заняла 2-е место в конкурсе.',
              '1 день назад',
              'assets/images/news_lab.jpg',
            ),


             const SizedBox(height: 12),

             _buildSimpleNewsCard(
              '30.09.25 в Аэрокосмическом колледже прошла встреча представителя группы компаний «Высокие технологии»',
              'в лице исполнительного директора Андрея Сергеевича Полежаева со студентами 8 отделения.',
              '1 день назад',
              'assets/images/DefVSznj.jpg',
            ),
            const SizedBox(height: 12),

            _buildSimpleNewsCard(
              'Понимаем, что вы и так всё знаете. Но не можем не напомнить!',
              'Мошенники не дремлют, и их схемы становятся всё хитрее 🔑 '
                  'Прежде чем что-то сделать (отправить деньги, сообщить данные) — '
                  'остановитесь и подумайте. Позвоните в официальную поддержку банка '
                  'или сервиса по номеру с их сайта.',
              '1 день назад',
              'assets/images/NCO.jpg',
            ),
            const SizedBox(height: 100),
          ],
        ),
      ),
    );
  }

  Widget _buildSimpleNewsCard(
      String title, String content, String time, String imagePath) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 5,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Row(
        children: [
          // Мини-картинка слева
          ClipRRect(
            borderRadius: BorderRadius.circular(8),
            child: Image.asset(
              imagePath,
              width: 90,
              height: 90,
              fit: BoxFit.cover,
            ),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: const TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w600,
                    color: Color(0xFF212121),
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  content,
                  style: const TextStyle(
                    fontSize: 12,
                    color: Color(0xFF757575),
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  time,
                  style: const TextStyle(
                    fontSize: 11,
                    color: Color(0xFF9E9E9E),
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
