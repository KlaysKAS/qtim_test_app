## Задача
Нужно реализовать функциональность экранов: список новостей и просмотр одной новости

## Функционал:
При открытии страницы с новостями данные загружаются из подготовленного мокового репозитория  
На экране списка новостей должны показываться:
- [x] Карусель с Featured новостями (горизонтальный скролл)
- [x] Список Latest news c последними новостями (вертикальный скролл)
- [x] AppBar с кнопкой Mark all read
- [x] Кнопка Mark all read при нажатии "читает все записи" помечает все записи, как прочтенные
- [x] При нажатии на новость из Featured или Latest news списка должна открыться страница с подробностями новости (Страница одной новости)


### Требования и примечания:
Логика экранов должна быть обязательно организована при помощи BLoC.