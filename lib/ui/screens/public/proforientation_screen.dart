import 'package:flutter/material.dart';

class ProforientationScreen extends StatelessWidget {
  const ProforientationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF5F5F5),
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Color(0xFF212121)),
          onPressed: () => Navigator.pop(context),
        ),
        title: Row(
          children: [
            // Логотип на картинку
            Container(
              width: 40,
              height: 40,
              decoration: const BoxDecoration(
                shape: BoxShape.circle,
                gradient: LinearGradient(
                  colors: [
                    Color(0xFF4CAF50),
                    Color(0xFF2196F3),
                    Color(0xFF9C27B0),
                  ],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                ),
              ),
              child: ClipOval(
                child: Image.asset(
                  'assets/images/popa.jpg', // путь к твоему логотипу
                  fit: BoxFit.cover,
                ),
              ),
            ),
            const SizedBox(width: 8),
            const Text(
              'Профориентация',
              style: TextStyle(
                color: Color(0xFF212121),
                fontSize: 18,
                fontWeight: FontWeight.w600,
              ),
            ),
          ],
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Заголовок с логотипом на картинку
            Row(
              children: [
                Container(
                  width: 60,
                  height: 60,
                  decoration: const BoxDecoration(
                    shape: BoxShape.circle,
                    gradient: LinearGradient(
                      colors: [
                        Color(0xFF4CAF50),
                        Color(0xFF2196F3),
                        Color(0xFF9C27B0),
                      ],
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                    ),
                  ),
                  child: ClipOval(
                    child: Image.asset(
                      'assets/images/popa.jpg', // путь к твоему логотипу
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                const SizedBox(width: 12),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: const [
                    Text(
                      'ЦЕНТР КАРЬЕРЫ',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                        color: Color(0xFF2196F3),
                      ),
                    ),
                    Text(
                      'АК СИБГУ',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                        color: Color(0xFF2196F3),
                      ),
                    ),
                  ],
                ),
              ],
            ),

            const SizedBox(height: 24),

            // Описание
            const Text(
              'Пройдите интерактивные мини-игры, чтобы узнать, какая профессия подходит именно вам. После каждой игры вы увидите диаграмму соответствия вашим способностям.',
              style: TextStyle(
                fontSize: 14,
                color: Color(0xFF757575),
                height: 1.5,
              ),
            ),

            const SizedBox(height: 24),

            // Карточки профессий
            Row(
              children: [
                Expanded(
                  child: _buildProfessionCard(
                    context,
                    'Программист',
                    'Проверьте свои навыки решения логических задач',
                    'assets/images/programmer.jpg',
                    const Color(0xFF2196F3),
                    Icons.computer,
                  ),
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: _buildProfessionCard(
                    context,
                    'Сетевой инженер',
                    'Тест на умение проектировать и настраивать сети',
                    'assets/images/network.jpg',
                    const Color(0xFF4CAF50),
                    Icons.cable,
                  ),
                ),
              ],
            ),

            const SizedBox(height: 16),

            // Дополнительные карточки
            Row(
              children: [
                Expanded(
                  child: _buildProfessionCard(
                    context,
                    'Специалист по ИИ',
                    'Оцените свои способности к машинному обучению',
                    'assets/images/ai.jpg',
                    const Color(0xFF9C27B0),
                    Icons.psychology,
                  ),
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: _buildProfessionCard(
                    context,
                    'Робототехник',
                    'Проверьте навыки работы с автоматизированными системами',
                    'assets/images/robotics.jpg',
                    const Color(0xFFFF9800),
                    Icons.precision_manufacturing,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildProfessionCard(
      BuildContext context,
      String title,
      String description,
      String imagePath,
      Color color,
      IconData icon,
      ) {
    return Container(
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
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Изображение/иконка профессии
          Container(
            width: double.infinity,
            height: 80,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8),
              image: DecorationImage(
                image: AssetImage(imagePath),
                fit: BoxFit.cover,
              ),
            ),
          ),

          const SizedBox(height: 12),

          // Название профессии
          Row(
            children: [
              Icon(icon, size: 16, color: color),
              const SizedBox(width: 4),
              Expanded(
                child: Text(
                  title,
                  style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w600,
                    color: color,
                  ),
                ),
              ),
            ],
          ),

          const SizedBox(height: 8),

          // Описание
          Text(
            description,
            style: const TextStyle(
              fontSize: 11,
              color: Color(0xFF757575),
              height: 1.3,
            ),
          ),

          const SizedBox(height: 12),

          // Кнопка
          SizedBox(
            width: double.infinity,
            height: 32,
            child: ElevatedButton(
              onPressed: () {
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(content: Text('Начинаем тест: $title')),
                );
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: color,
                foregroundColor: Colors.white,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(6),
                ),
                elevation: 0,
              ),
              child: const Text(
                'Начать игру',
                style: TextStyle(
                  fontSize: 12,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
