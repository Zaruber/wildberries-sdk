# Wildberries SDK-клиенты для Python, Node.js, Go и PHP, постоянно актуальные в соответствии с OpenAPI-спецификациями.

| Язык | Версия | Кол-во скачиваний | README | Репозиторий |
| --- | --- | --- | --- | --- |
| Python | [![PyPI](https://img.shields.io/pypi/v/wildberries-sdk.svg)](https://pypi.org/project/wildberries-sdk/) | [![PyPI Downloads](https://static.pepy.tech/badge/wildberries-sdk)](https://pepy.tech/project/wildberries-sdk) | [docs/python/README.md](docs/python/README.md) | [pypi.org](https://pypi.org/project/wildberries-sdk/) |
| Node.js | [![npm](https://img.shields.io/npm/v/wildberries-sdk.svg)](https://www.npmjs.com/package/wildberries-sdk) | [![NPM Downloads](https://img.shields.io/npm/dt/wildberries-sdk.svg)](https://www.npmjs.com/package/wildberries-sdk) | [docs/npm/README.md](docs/npm/README.md) | [npmjs.com](https://www.npmjs.com/package/wildberries-sdk) |
| PHP | [![Packagist](https://img.shields.io/packagist/v/eslazarev/wildberries-sdk.svg)](https://packagist.org/packages/eslazarev/wildberries-sdk) | [![Packagist Downloads](https://img.shields.io/packagist/dt/eslazarev/wildberries-sdk.svg)](https://packagist.org/packages/eslazarev/wildberries-sdk) | [docs/php/README.md](docs/php/README.md) | [packagist.org](https://packagist.org/packages/eslazarev/wildberries-sdk) |
| Go | [![Go](https://img.shields.io/github/v/tag/eslazarev/wildberries-sdk?label=go)](https://github.com/eslazarev/wildberries-sdk/tags) | — | [docs/go/README.md](docs/go/README.md) | [pkg.go.dev](https://pkg.go.dev/github.com/eslazarev/wildberries-sdk/clients/go) |


Поддерживаются все доступные на текущий момент команды API Wildberries, разделённые по спецификациям.

### Автоматическая клиенты поддерживаются в актуальном состоянии с помощью GitHub Actions при обновлении спецификаций.

Почему это важно?
Посмотрите как часто wildberries обновляет свои OpenAPI спецификации

<img src=".github/images/wildberries-api-changes.png" alt="wildberries-api-changes" width="200">


#### За месяц 14 изменений в спецификациях. 


## В данный момент представлены **все доступные** спецификации:

- Общее: [`specs/01-general.yaml`](#общее-01-generalyaml)
- Работа с товарами: [`specs/02-products.yaml`](#работа-с-товарами-02-productsyaml)
- Заказы FBS: [`specs/03-orders-fbs.yaml`](#заказы-fbs-03-orders-fbsyaml)
- Заказы DBW: [`specs/04-orders-dbw.yaml`](#заказы-dbw-04-orders-dbwyaml)
- Заказы DBS: [`specs/05-orders-dbs.yaml`](#заказы-dbs-05-orders-dbsyaml)
- Заказы Самовывоз: [`specs/06-in-store-pickup.yaml`](#заказы-самовывоз-06-in-store-pickupyaml)
- Поставки FBW: [`specs/07-orders-fbw.yaml`](#поставки-fbw-07-orders-fbwyaml)
- Маркетинг и продвижение: [`specs/08-promotion.yaml`](#маркетинг-и-продвижение-08-promotionyaml)
- Общение с покупателями: [`specs/09-communications.yaml`](#общение-с-покупателями-09-communicationsyaml)
- Тарифы: [`specs/10-tariffs.yaml`](#тарифы-10-tariffsyaml)
- Аналитика и данные: [`specs/11-analytics.yaml`](#аналитика-и-данные-11-analyticsyaml)
- Отчёты: [`specs/12-reports.yaml`](#отчёты-12-reportsyaml)
- Документы и бухгалтерия: [`specs/13-finances.yaml`](#документы-и-бухгалтерия-13-financesyaml)
- Wildberries Цифровой: [`specs/14-wbd.yaml`](#wildberries-цифровой-14-wbdyaml)

<!-- METHODS_LIST_START -->
### Общее (`01-general.yaml`)
- `GET /api/communications/v2/news` — Получение новостей портала продавцов
- `POST /api/v1/invite` — Создать приглашение для нового пользователя
- `GET /api/v1/seller-info` — Получение информации о продавце
- `DELETE /api/v1/user` — Удалить пользователя
- `GET /api/v1/users` — Получить список активных или приглашённых пользователей продавца
- `PUT /api/v1/users/access` — Изменить права доступа пользователей
- `GET /ping` — Проверка подключения

### Работа с товарами (`02-products.yaml`)
- `GET /api/content/v1/brands` — Бренды
- `GET /api/v2/buffer/goods/task` — Детализация необработанной загрузки
- `GET /api/v2/buffer/tasks` — Состояние необработанной загрузки
- `GET /api/v2/history/goods/task` — Детализация обработанной загрузки
- `GET /api/v2/history/tasks` — Состояние обработанной загрузки
- `GET /api/v2/list/goods/filter` — Получить товары с ценами
- `POST /api/v2/list/goods/filter` — Получить товары с ценами по артикулам
- `GET /api/v2/list/goods/size/nm` — Получить размеры товара с ценами
- `GET /api/v2/quarantine/goods` — Получить товары в карантине
- `POST /api/v2/upload/task` — Установить цены и скидки
- `POST /api/v2/upload/task/club-discount` — Установить скидки WB Клуба
- `POST /api/v2/upload/task/size` — Установить цены для размеров
- `GET /api/v3/dbw/warehouses/{warehouseId}/contacts` — Список контактов
- `PUT /api/v3/dbw/warehouses/{warehouseId}/contacts` — Обновить список контактов
- `GET /api/v3/offices` — Получить список складов WB
- `POST /api/v3/stocks/{warehouseId}` — Получить остатки товаров
- `PUT /api/v3/stocks/{warehouseId}` — Обновить остатки товаров
- `DELETE /api/v3/stocks/{warehouseId}` — Удалить остатки товаров
- `GET /api/v3/warehouses` — Получить список складов продавца
- `POST /api/v3/warehouses` — Создать склад продавца
- `PUT /api/v3/warehouses/{warehouseId}` — Обновить склад продавца
- `DELETE /api/v3/warehouses/{warehouseId}` — Удалить склад продавца
- `POST /content/v2/barcodes` — Генерация баркодов
- `POST /content/v2/cards/delete/trash` — Перенос карточек товаров в корзину
- `POST /content/v2/cards/error/list` — Список несозданных карточек товаров с ошибками
- `GET /content/v2/cards/limits` — Лимиты карточек товаров
- `POST /content/v2/cards/moveNm` — Объединение и разъединение карточек товаров
- `POST /content/v2/cards/recover` — Восстановление карточек товаров из корзины
- `POST /content/v2/cards/update` — Редактирование карточек товаров
- `POST /content/v2/cards/upload` — Создание карточек товаров
- `POST /content/v2/cards/upload/add` — Создание карточек товаров с присоединением
- `GET /content/v2/directory/colors` — Цвет
- `GET /content/v2/directory/countries` — Страна производства
- `GET /content/v2/directory/kinds` — Пол
- `GET /content/v2/directory/seasons` — Сезон
- `GET /content/v2/directory/tnved` — ТНВЭД-код
- `GET /content/v2/directory/vat` — Ставка НДС
- `POST /content/v2/get/cards/list` — Список карточек товаров
- `POST /content/v2/get/cards/trash` — Список карточек товаров в корзине
- `GET /content/v2/object/all` — Список предметов
- `GET /content/v2/object/charcs/{subjectId}` — Характеристики предмета
- `GET /content/v2/object/parent/all` — Родительские категории товаров
- `POST /content/v2/tag` — Создание ярлыка
- `POST /content/v2/tag/nomenclature/link` — Управление ярлыками в карточке товара
- `PATCH /content/v2/tag/{id}` — Изменение ярлыка
- `DELETE /content/v2/tag/{id}` — Удаление ярлыка
- `GET /content/v2/tags` — Список ярлыков
- `POST /content/v3/media/file` — Загрузить медиафайл
- `POST /content/v3/media/save` — Загрузить медиафайлы по ссылкам

### Заказы FBS (`03-orders-fbs.yaml`)
- `POST /api/marketplace/v3/orders/meta` — Получить метаданные сборочных заданий
- `GET /api/marketplace/v3/supplies/{supplyId}/order-ids` — Получить ID сборочных заданий поставки
- `PATCH /api/marketplace/v3/supplies/{supplyId}/orders` — Добавить сборочные задания к поставке
- `GET /api/v3/orders` — Получить информацию о сборочных заданиях
- `POST /api/v3/orders/client` — Заказы с информацией по клиенту
- `GET /api/v3/orders/new` — Получить список новых сборочных заданий
- `POST /api/v3/orders/status` — Получить статусы сборочных заданий
- `POST /api/v3/orders/status/history` — История статусов для сборочных заданий кроссбордера
- `POST /api/v3/orders/stickers` — Получить стикеры сборочных заданий
- `POST /api/v3/orders/stickers/cross-border` — Получить стикеры сборочных заданий кроссбордера
- `PATCH /api/v3/orders/{orderId}/cancel` — Отменить сборочное задание
- `DELETE /api/v3/orders/{orderId}/meta` — Удалить метаданные сборочного задания
- `PUT /api/v3/orders/{orderId}/meta/expiration` — Закрепить за сборочным заданием срок годности товара
- `PUT /api/v3/orders/{orderId}/meta/gtin` — Закрепить за сборочным заданием GTIN
- `PUT /api/v3/orders/{orderId}/meta/imei` — Закрепить за сборочным заданием IMEI
- `PUT /api/v3/orders/{orderId}/meta/sgtin` — Закрепить за сборочным заданием код маркировки товара
- `PUT /api/v3/orders/{orderId}/meta/uin` — Закрепить за сборочным заданием УИН
- `GET /api/v3/passes` — Получить список пропусков
- `POST /api/v3/passes` — Создать пропуск
- `GET /api/v3/passes/offices` — Получить список складов, для которых требуется пропуск
- `PUT /api/v3/passes/{passId}` — Обновить пропуск
- `DELETE /api/v3/passes/{passId}` — Удалить пропуск
- `GET /api/v3/supplies` — Получить список поставок
- `POST /api/v3/supplies` — Создать новую поставку
- `GET /api/v3/supplies/orders/reshipment` — Получить все сборочные задания для повторной отгрузки
- `GET /api/v3/supplies/{supplyId}` — Получить информацию о поставке
- `DELETE /api/v3/supplies/{supplyId}` — Удалить поставку
- `GET /api/v3/supplies/{supplyId}/barcode` — Получить QR-код поставки
- `PATCH /api/v3/supplies/{supplyId}/deliver` — Передать поставку в доставку
- `GET /api/v3/supplies/{supplyId}/orders` — Получить сборочные задания в поставке
- `GET /api/v3/supplies/{supplyId}/trbx` — Получить список коробов поставки
- `POST /api/v3/supplies/{supplyId}/trbx` — Добавить короба к поставке
- `DELETE /api/v3/supplies/{supplyId}/trbx` — Удалить короба из поставки
- `POST /api/v3/supplies/{supplyId}/trbx/stickers` — Получить стикеры коробов поставки

### Заказы DBW (`04-orders-dbw.yaml`)
- `GET /api/v3/dbw/orders` — Получить информацию о завершенных сборочных заданиях
- `POST /api/v3/dbw/orders/courier` — Информация о курьере
- `POST /api/v3/dbw/orders/delivery-date` — Дата и время доставки
- `GET /api/v3/dbw/orders/new` — Получить список новых сборочных заданий
- `POST /api/v3/dbw/orders/status` — Получить статусы сборочных заданий
- `POST /api/v3/dbw/orders/stickers` — Получить стикеры сборочных заданий
- `PATCH /api/v3/dbw/orders/{orderId}/assemble` — Перевести в доставку
- `PATCH /api/v3/dbw/orders/{orderId}/cancel` — Отменить сборочное задание
- `PATCH /api/v3/dbw/orders/{orderId}/confirm` — Перевести на сборку
- `GET /api/v3/dbw/orders/{orderId}/meta` — Получить метаданные сборочного задания
- `DELETE /api/v3/dbw/orders/{orderId}/meta` — Удалить метаданные сборочного задания
- `PUT /api/v3/dbw/orders/{orderId}/meta/gtin` — Закрепить за сборочным заданием GTIN
- `PUT /api/v3/dbw/orders/{orderId}/meta/imei` — Закрепить за сборочным заданием IMEI
- `PUT /api/v3/dbw/orders/{orderId}/meta/sgtin` — Закрепить за сборочным заданием код маркировки товара
- `PUT /api/v3/dbw/orders/{orderId}/meta/uin` — Закрепить за сборочным заданием УИН (уникальный идентификационный номер)

### Заказы DBS (`05-orders-dbs.yaml`)
- `POST /api/v3/dbs/groups/info` — Получить информацию о платной доставке
- `GET /api/v3/dbs/orders` — Получить информацию о завершенных сборочных заданиях
- `POST /api/v3/dbs/orders/client` — Информация о покупателе
- `POST /api/v3/dbs/orders/delivery-date` — Дата и время доставки
- `GET /api/v3/dbs/orders/new` — Получить список новых сборочных заданий
- `POST /api/v3/dbs/orders/status` — Получить статусы сборочных заданий
- `PATCH /api/v3/dbs/orders/{orderId}/cancel` — Отменить сборочное задание
- `PATCH /api/v3/dbs/orders/{orderId}/confirm` — Перевести на сборку
- `PATCH /api/v3/dbs/orders/{orderId}/deliver` — Перевести в доставку
- `GET /api/v3/dbs/orders/{orderId}/meta` — Получить метаданные сборочного задания
- `DELETE /api/v3/dbs/orders/{orderId}/meta` — Удалить метаданные сборочного задания
- `PUT /api/v3/dbs/orders/{orderId}/meta/gtin` — Закрепить за сборочным заданием GTIN
- `PUT /api/v3/dbs/orders/{orderId}/meta/imei` — Закрепить за сборочным заданием IMEI
- `PUT /api/v3/dbs/orders/{orderId}/meta/sgtin` — Закрепить за сборочным заданием код маркировки товара
- `PUT /api/v3/dbs/orders/{orderId}/meta/uin` — Закрепить за сборочным заданием УИН (уникальный идентификационный номер)
- `PATCH /api/v3/dbs/orders/{orderId}/receive` — Сообщить, что заказ принят покупателем
- `PATCH /api/v3/dbs/orders/{orderId}/reject` — Сообщить, что покупатель отказался от заказа

### Заказы Самовывоз (`06-in-store-pickup.yaml`)
- `GET /api/v3/click-collect/orders` — Получить информацию о завершённых сборочных заданиях
- `POST /api/v3/click-collect/orders/client` — Информация о покупателе
- `POST /api/v3/click-collect/orders/client/identity` — Проверить, что заказ принадлежит покупателю
- `GET /api/v3/click-collect/orders/new` — Получить список новых сборочных заданий
- `POST /api/v3/click-collect/orders/status` — Получить статусы сборочных заданий
- `PATCH /api/v3/click-collect/orders/{orderId}/cancel` — Отменить сборочное задание
- `PATCH /api/v3/click-collect/orders/{orderId}/confirm` — Перевести на сборку
- `GET /api/v3/click-collect/orders/{orderId}/meta` — Получить метаданные сборочного задания
- `DELETE /api/v3/click-collect/orders/{orderId}/meta` — Удалить метаданные сборочного задания
- `PUT /api/v3/click-collect/orders/{orderId}/meta/gtin` — Закрепить за сборочным заданием GTIN
- `PUT /api/v3/click-collect/orders/{orderId}/meta/imei` — Закрепить за сборочным заданием IMEI
- `PUT /api/v3/click-collect/orders/{orderId}/meta/sgtin` — Закрепить за сборочным заданием код маркировки товара
- `PUT /api/v3/click-collect/orders/{orderId}/meta/uin` — Закрепить за сборочным заданием УИН (уникальный идентификационный номер)
- `PATCH /api/v3/click-collect/orders/{orderId}/prepare` — Сообщить, что сборочное задание готово к выдаче
- `PATCH /api/v3/click-collect/orders/{orderId}/receive` — Сообщить, что заказ принят покупателем
- `PATCH /api/v3/click-collect/orders/{orderId}/reject` — Сообщить, что покупатель отказался от заказа

### Поставки FBW (`07-orders-fbw.yaml`)
- `GET /api/v1/acceptance/coefficients` — Коэффициенты приёмки
- `POST /api/v1/acceptance/options` — Опции приёмки
- `POST /api/v1/supplies` — Список поставок
- `GET /api/v1/supplies/{ID}` — Детали поставки
- `GET /api/v1/supplies/{ID}/goods` — Товары поставки
- `GET /api/v1/supplies/{ID}/package` — Упаковка поставки
- `GET /api/v1/transit-tariffs` — Транзитные направления
- `GET /api/v1/warehouses` — Список складов

### Маркетинг и продвижение (`08-promotion.yaml`)
- `GET /adv/v0/auction/adverts` — Информация о кампаниях с ручной ставкой
- `PATCH /adv/v0/auction/bids` — Изменение ставок в кампаниях
- `PATCH /adv/v0/auction/nms` — Изменение списка карточек товаров в кампаниях
- `PUT /adv/v0/auction/placements` — Изменение мест размещения в кампаниях с ручной ставкой
- `PATCH /adv/v0/bids` — Изменение ставок
- `POST /adv/v0/bids/min` — Минимальные ставки для карточек товаров
- `GET /adv/v0/config` — Конфигурационные значения Продвижения
- `GET /adv/v0/delete` — Удаление кампании
- `POST /adv/v0/normquery/bids` — Установить ставки для поисковых кластеров
- `DELETE /adv/v0/normquery/bids` — Удалить ставки поисковых кластеров
- `POST /adv/v0/normquery/get-bids` — Список ставок поисковых кластеров
- `POST /adv/v0/normquery/get-minus` — Список минус-фраз кампаний
- `POST /adv/v0/normquery/set-minus` — Установка и удаление минус-фраз
- `POST /adv/v0/normquery/stats` — Статистика поисковых кластеров
- `GET /adv/v0/pause` — Пауза кампании
- `POST /adv/v0/rename` — Переименование кампании
- `GET /adv/v0/start` — Запуск кампании
- `GET /adv/v0/stats/keywords` — Статистика по ключевым фразам
- `GET /adv/v0/stop` — Завершение кампании
- `GET /adv/v1/advert` — Информация о медиакампании
- `GET /adv/v1/adverts` — Список медиакампаний
- `GET /adv/v1/auto/getnmtoadd` — Список карточек товаров для кампании с единой ставкой
- `POST /adv/v1/auto/set-excluded` — Установка/удаление минус-фраз для кампании с единой ставкой
- `POST /adv/v1/auto/updatenm` — Изменение списка карточек товаров в кампании с единой ставкой
- `GET /adv/v1/balance` — Баланс
- `GET /adv/v1/budget` — Бюджет кампании
- `POST /adv/v1/budget/deposit` — Пополнение бюджета кампании
- `GET /adv/v1/count` — Количество медиакампаний
- `GET /adv/v1/payments` — Получение истории пополнений счёта
- `POST /adv/v1/promotion/adverts` — Информация о кампаниях
- `GET /adv/v1/promotion/count` — Списки кампаний
- `POST /adv/v1/search/set-excluded` — Установка/удаление минус-фраз в поиске
- `GET /adv/v1/search/set-plus` — Управление активностью фиксированных фраз
- `POST /adv/v1/search/set-plus` — Установка/удаление фиксированных фраз
- `GET /adv/v1/stat/words` — Статистика кампании c ручной ставкой по ключевым фразам
- `POST /adv/v1/stats` — Статистика медиакампаний
- `GET /adv/v1/supplier/subjects` — Предметы для кампаний
- `GET /adv/v1/upd` — Получение истории затрат
- `GET /adv/v2/auto/stat-words` — Статистика кампании с единой ставкой по кластерам фраз
- `POST /adv/v2/fullstats` — Статистика кампаний
- `POST /adv/v2/seacat/save-ad` — Создать кампанию
- `POST /adv/v2/supplier/nms` — Карточки товаров для кампаний
- `GET /adv/v3/fullstats` — Статистика кампаний
- `PATCH /api/advert/v1/bids` — Изменение ставок в кампаниях
- `POST /api/advert/v1/bids/min` — Минимальные ставки для карточек товаров
- `GET /api/advert/v2/adverts` — Информация о кампаниях
- `GET /api/v1/calendar/promotions` — Список акций
- `GET /api/v1/calendar/promotions/details` — Детальная информация об акциях
- `GET /api/v1/calendar/promotions/nomenclatures` — Список товаров для участия в акции
- `POST /api/v1/calendar/promotions/upload` — Добавить товар в акцию

### Общение с покупателями (`09-communications.yaml`)
- `GET /api/feedbacks/v1/pins` — Список закреплённых и откреплённых отзывов
- `POST /api/feedbacks/v1/pins` — Закрепить отзывы
- `DELETE /api/feedbacks/v1/pins` — Открепить отзывы
- `GET /api/feedbacks/v1/pins/count` — Количество закреплённых и откреплённых отзывов
- `GET /api/feedbacks/v1/pins/limits` — Лимиты закреплённых отзывов
- `PATCH /api/v1/claim` — Ответ на заявку покупателя
- `GET /api/v1/claims` — Заявки покупателей на возврат
- `GET /api/v1/feedback` — Получить отзыв по ID
- `GET /api/v1/feedbacks` — Список отзывов
- `POST /api/v1/feedbacks/answer` — Ответить на отзыв
- `PATCH /api/v1/feedbacks/answer` — Отредактировать ответ на отзыв
- `GET /api/v1/feedbacks/archive` — Список архивных отзывов
- `GET /api/v1/feedbacks/count` — Количество отзывов
- `GET /api/v1/feedbacks/count-unanswered` — Необработанные отзывы
- `POST /api/v1/feedbacks/order/return` — Возврат товара по ID отзыва
- `GET /api/v1/new-feedbacks-questions` — Непросмотренные отзывы и вопросы
- `GET /api/v1/question` — Получить вопрос по ID
- `GET /api/v1/questions` — Список вопросов
- `PATCH /api/v1/questions` — Работа с вопросами
- `GET /api/v1/questions/count` — Количество вопросов
- `GET /api/v1/questions/count-unanswered` — Неотвеченные вопросы
- `GET /api/v1/seller/chats` — Список чатов
- `GET /api/v1/seller/download/{id}` — Получить файл из сообщения
- `GET /api/v1/seller/events` — События чатов
- `POST /api/v1/seller/message` — Отправить сообщение

### Тарифы (`10-tariffs.yaml`)
- `GET /api/tariffs/v1/acceptance/coefficients` — Тарифы на поставку
- `GET /api/v1/tariffs/box` — Тарифы для коробов
- `GET /api/v1/tariffs/commission` — Комиссия по категориям товаров
- `GET /api/v1/tariffs/pallet` — Тарифы для монопаллет
- `GET /api/v1/tariffs/return` — Тарифы на возврат

### Аналитика и данные (`11-analytics.yaml`)
- `POST /api/analytics/v3/sales-funnel/grouped/history` — Статистика групп карточек товаров по дням (postSalesFunnelGroupedHistory)
- `POST /api/analytics/v3/sales-funnel/products` — Статистика карточек товаров за период (postSalesFunnelProducts)
- `POST /api/analytics/v3/sales-funnel/products/history` — Статистика карточек товаров по дням (postSalesFunnelProductsHistory)
- `GET /api/v2/nm-report/downloads` — Получить список отчётов
- `POST /api/v2/nm-report/downloads` — Создать отчёт
- `GET /api/v2/nm-report/downloads/file/{downloadId}` — Получить отчёт
- `POST /api/v2/nm-report/downloads/retry` — Сгенерировать отчёт повторно
- `POST /api/v2/search-report/product/orders` — Заказы и позиции по поисковым запросам товара
- `POST /api/v2/search-report/product/search-texts` — Поисковые запросы по товару
- `POST /api/v2/search-report/report` — Основная страница
- `POST /api/v2/search-report/table/details` — Пагинация по товарам в группе
- `POST /api/v2/search-report/table/groups` — Пагинация по группам
- `POST /api/v2/stocks-report/offices` — Данные по складам
- `POST /api/v2/stocks-report/products/groups` — Данные по группам
- `POST /api/v2/stocks-report/products/products` — Данные по товарам
- `POST /api/v2/stocks-report/products/sizes` — Данные по размерам

### Отчёты (`12-reports.yaml`)
- `GET /api/analytics/v1/deductions` — Подмены и неверные вложения (getDeductions)
- `GET /api/analytics/v1/measurement-penalties` — Удержания за занижение габаритов упаковки (getMeasurementPenalties)
- `GET /api/analytics/v1/warehouse-measurements` — Замеры склада (getWarehouseMeasurements)
- `GET /api/v1/acceptance_report` — Создать отчёт
- `GET /api/v1/acceptance_report/tasks/{task_id}/download` — Получить отчёт
- `GET /api/v1/acceptance_report/tasks/{task_id}/status` — Проверить статус
- `GET /api/v1/analytics/antifraud-details` — Самовыкупы
- `GET /api/v1/analytics/banned-products/blocked` — Заблокированные карточки
- `GET /api/v1/analytics/banned-products/shadowed` — Скрытые из каталога
- `GET /api/v1/analytics/brand-share` — Получить отчёт
- `GET /api/v1/analytics/brand-share/brands` — Бренды продавца
- `GET /api/v1/analytics/brand-share/parent-subjects` — Родительские категории бренда
- `GET /api/v1/analytics/characteristics-change` — Смена характеристик
- `POST /api/v1/analytics/excise-report` — Получить отчёт
- `GET /api/v1/analytics/goods-labeling` — Маркировка товара
- `GET /api/v1/analytics/goods-return` — Получить отчёт
- `GET /api/v1/analytics/incorrect-attachments` — Подмена товара
- `GET /api/v1/analytics/region-sale` — Получить отчёт
- `GET /api/v1/analytics/warehouse-measurements` — Занижение габаритов упаковки
- `GET /api/v1/paid_storage` — Создать отчёт
- `GET /api/v1/paid_storage/tasks/{task_id}/download` — Получить отчёт
- `GET /api/v1/paid_storage/tasks/{task_id}/status` — Проверить статус
- `GET /api/v1/supplier/incomes` — Поставки
- `GET /api/v1/supplier/orders` — Заказы
- `GET /api/v1/supplier/sales` — Продажи
- `GET /api/v1/supplier/stocks` — Склады
- `GET /api/v1/warehouse_remains` — Создать отчёт
- `GET /api/v1/warehouse_remains/tasks/{task_id}/download` — Получить отчёт
- `GET /api/v1/warehouse_remains/tasks/{task_id}/status` — Проверить статус

### Документы и бухгалтерия (`13-finances.yaml`)
- `GET /api/v1/account/balance` — Получить баланс продавца
- `GET /api/v1/documents/categories` — Категории документов
- `GET /api/v1/documents/download` — Получить документ
- `POST /api/v1/documents/download/all` — Получить документы
- `GET /api/v1/documents/list` — Список документов
- `GET /api/v5/supplier/reportDetailByPeriod` — Отчёт о продажах по реализации

### Wildberries Цифровой (`14-wbd.yaml`)
- `GET /api/v1/catalog` — Получить категории и их подкатегории (GetCatalog)
- `GET /api/v1/content/author` — Получить список своего контента (contentAuthorGet)
- `GET /api/v1/content/author/{content_id}` — Получить информацию о контенте (contentIdGet)
- `POST /api/v1/content/author/{content_id}` — Редактировать контент (contentUpdate)
- `POST /api/v1/content/delete` — Удалить контент (contentDelete)
- `GET /api/v1/content/download/{uri}` — Скачать контент (contentDownloadGet)
- `POST /api/v1/content/gallery` — Загрузить медиафайлы для предложения (contentGallery)
- `POST /api/v1/content/illustration` — Загрузить обложку контента (contentUploadIllustration)
- `POST /api/v1/content/upload/chunk` — Загрузить контент (файл) (contentUploadChunk)
- `POST /api/v1/content/upload/init` — Инициализировать новый контент (contentUploadInit)
- `POST /api/v1/keys-api/keys` — Добавить ключи активации (LoadKeys)
- `DELETE /api/v1/keys-api/keys` — Удалить ключи активации (DeleteKeysByIDs)
- `GET /api/v1/keys-api/keys/redeemed` — Получить купленные ключи (GetRedeemedKeys)
- `GET /api/v1/offer/keys/{offer_id}` — Получить количество ключей для предложения (offerKeysCountGet)
- `GET /api/v1/offer/keys/{offer_id}/list` — Получить список ключей (offerKeysGet)
- `POST /api/v1/offer/price/{offer_id}` — Обновить цену (offerUpdatePrice)
- `POST /api/v1/offer/{offer_id}` — Обновить статус (offerUpdateStatus)
- `POST /api/v1/offers` — Создать новое предложение (offerCreate)
- `GET /api/v1/offers/author` — Получить список своих предложений (offersAuthorGet)
- `POST /api/v1/offers/thumb` — Добавить или обновить обложку предложения (offersUploadThumbnail)
- `GET /api/v1/offers/{offer_id}` — Получить информацию о предложении (offerGet)
- `POST /api/v1/offers/{offer_id}` — Редактировать предложение (offerUpdate)
<!-- METHODS_LIST_END -->
