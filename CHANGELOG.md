# Changelog

## Unreleased
### Changed (2026.02.22)
- Orders DBS: для метода получения стикеров сборочных заданий с доставкой в ПВЗ добавлено явное требование авторизации — использовать персональный и сервисный токены категории «Маркетплейс» (обновлено описание, без изменений в контракте/параметрах).

### Changed (2026.02.20)
- Products: ужесточены лимиты запросов для двух методов раздела — с 100 запросов/мин (интервал 600 мс) до 3 запросов/мин (интервал 20 сек), всплеск без изменений (5 запросов)
- Orders DBS: добавлен новый endpoint `POST /api/marketplace/v3/dbs/orders/stickers` для получения PDF-стикеров (только `type=pdf`, `width=58`, `height=40`; до 100 `orderId` в запросе) для сборочных заданий с доставкой в ПВЗ в статусах `confirm` и `deliver`; ответ содержит `stickers[]` с `orderId`, `partA`, `partB`, `barcode`, `file` (base64)
- Orders DBS: расширен enum `deliveryType` — добавлено значение `dbsPickupPoint` (доставка силами продавца в ПВЗ)
- Orders DBS: уточнено поле `address` в моделях заказов — при доставке в ПВЗ возвращается адрес ПВЗ
- Orders DBS: добавлены поля, специфичные для ПВЗ: `wbStickerId` (ID стикера, только для заказов в ПВЗ) и `scanPrice` (цена приёмки в ПВЗ, в копейках, nullable; только для заказов в ПВЗ)
- Analytics: в CSV-аналитике добавлен новый тип отчёта `STOCK_HISTORY_DAILY_CSV` (схема запроса `InventoryHistoryReportReq`, пример ответа `InventoryHistoryReportRes`) для отчёта по истории остатков по дням
- Analytics: переименована/уточнена модель запроса для `STOCK_HISTORY_REPORT_CSV`: `StocksReportReq` → `InventoryMetricsReportReq`, описание изменено с «истории остатков» на «статистике остатков»; обновлены соответствующие примеры ответа (`StocksReportRes` → `InventoryMetricsReportRes`)
- Analytics: заменён компонент периода `PeriodSt` → `PeriodInv` во всех связанных схемах фильтров остатков
- Analytics: обновлены тексты документации/ограничений: отчёты за период до года привязаны к типам `DETAIL_HISTORY_REPORT` и `GROUPED_HISTORY_REPORT` и доступны только по подписке «Джем»; отчёты по остаткам без подписки — типы `STOCK_HISTORY_REPORT_CSV` и `STOCK_HISTORY_DAILY_CSV`
- Analytics: параметр `skipDeletedNm` переописан как «Скрыть удалённые товары» (вместо «карточки товаров»/«nmID»); уточнены описания `stockType` (приведение к нижнему регистру в тексте) и пример сообщения о старте генерации отчёта (было `Created`, стало «Началось формирование файла/отчета»)

### Changed (2026.02.19)
- Products: в ответах ошибок для метода управления остатками/складом удалены примеры `SubjectDBSRestriction` и `SubjectFBSRestriction`; добавлены новые примеры ошибок `ProductPropertyConflict` (оптовый товар доступен только по схеме DBS) и `DeliveryTypeRestriction` (категория недоступна для выбранного типа доставки, возвращает `data` со `sku/chrtId/amount`).
- Orders FBW (Поставки): удалён (ранее `deprecated`) endpoint `GET /api/v1/acceptance/coefficients` на домене `supplies-api.wildberries.ru` (коэффициенты приёмки; в описании был указан перенос в Tariffs API).

### Changed (2026.02.18)
- Сборочные задания Самовывоз: добавлены batch-эндпоинты смены статуса (POST) с телом `api.OrdersRequestV2(ordersIds[])` и ответом `api.StatusSetResponses`: `/api/marketplace/v3/click-collect/orders/status/confirm` (new→confirm), `/status/prepare` (confirm→prepare), `/status/receive` (prepare→receive), `/status/reject` (prepare→reject), `/status/cancel` (new|confirm|prepare→cancel); лимит для этих методов изменён на 1 запрос/сек (burst 10), при 409 запрос считается за 10
- Сборочные задания Самовывоз: добавлен новый метод получения статусов по списку ID — `POST /api/marketplace/v3/click-collect/orders/status/info` (request `api.OrdersRequestV2`, response `api.OrderStatusesV2`); лимит 1 запрос/сек (burst 10), 409=10 запросов
- Сборочные задания Самовывоз: помечены как устаревшие и запланированы к удалению 19 мая старые single-order методы (PATCH): `/api/v3/click-collect/orders/{orderId}/confirm`, `/prepare`, `/receive`, `/reject`, а также `POST /api/v3/click-collect/orders/status`
- Метаданные Самовывоз: добавлены batch-эндпоинты (POST) — `/api/marketplace/v3/click-collect/orders/meta/info` (получение метаданных, response `api.OrdersMetaResponse`) и `/meta/delete` (удаление метаданных по `key` для списка `ordersIds`, request `api.OrdersMetaDeleteRequest`, response `api.OrdersResponses`); общий лимит для получения/удаления метаданных: 150 запросов/мин (интервал 400 мс, burst 20), 409=10 запросов
- Метаданные Самовывоз: добавлены batch-эндпоинты закрепления метаданных (POST) — `/meta/sgtin` (`api.OrdersSGTINsSetRequest`), `/meta/uin` (`api.OrdersUINSetRequest`), `/meta/imei` (`api.OrdersIMEISetRequest`), `/meta/gtin` (`api.OrdersGTINSetRequest`), ответы `api.MetaSetResponses`; лимит для закрепления метаданных: 20 запросов/мин (интервал 3 сек, burst 500), 409=10 запросов
- Метаданные Самовывоз: помечены как устаревшие и запланированы к удалению 19 мая старые single-order методы: `GET /api/v3/click-collect/orders/{orderId}/meta`, `DELETE /api/v3/click-collect/orders/{orderId}/meta`, `PATCH /api/v3/click-collect/orders/{orderId}/meta/sgtins`, `/meta/uin`, `/meta/imei`, `/meta/gtin`
- Схемы/контракты: добавлены новые модели для batch-операций и ошибок (`api.OrdersRequestV2`, `api.StatusSetResponses`, `api.OrderStatusesV2`, `api.OrdersMetaResponse`, `api.OrdersMetaDeleteRequest`, `api.MetaSetResponses`, `api.BatchError*`, `api.*ErrorResponse`) и новые ответы `IncorrectRequest` и `AccessDeniedBatch` (для batch-методов)
- Схемы/примеры: обновлены примеры `api.GTINRequest`, `api.IMEIRequest`, `api.UINRequest` — значения больше не массивы, а строки (`gtin`, `imei`, `uin`)

### Changed (2026.02.17)
- Самовывоз: в методе обновления IMEI для сборочного задания уточнено ограничение по статусам — теперь IMEI можно добавлять только для заданий в статусе `confirm` (ранее `confirm` и `prepare`) при доставке силами WB
- Самовывоз: описание поля `availableMeta` упрощено — удалено примечание про обязательность IMEI для предмета «Смартфоны» (`subjectId: 515`) и ссылки на связанные методы/разделы

- Коммуникации (Отзывы): в ответах/моделях отзыва добавлено новое поле `orderStatus` со значениями `buyout` / `rejected` / `returned` / `notSpecified`
- Коммуникации (Отзывы): в схеме отзыва скорректирован порядок/расположение полей — `text` и `userName` переразмещены (семантика сохранена: `text` — текст отзыва, `userName` — имя автора, `nullable: false`)
- Коммуникации (Отзывы): обновлены описания перечислений и булевых полей (типографика в `matchingSize`, `isAbleSupplierFeedbackValuation`) без изменения значений/типов

### Changed (2026.02.14)
- Самовывоз: в методе закрепления IMEI за сборочным заданием расширены допустимые статусы задания для добавления IMEI — теперь `confirm` и `prepare` (было только `confirm`); уточнено, что для предмета «Смартфоны» (`subjectId: 515`) указание IMEI обязательно (добавлено в описание списка доступных метаданных).
- Продвижение: для методов получения списков активных/неактивных поисковых кластеров и статистики по кластерам с детализацией по дням добавлены лимиты запросов (соответственно 5 rps, интервал 200 мс, всплеск 10; и 10 rpm, интервал 6 сек, всплеск 20).
- Аналитика: для отчётов «Воронка продаж» и связанных отчётов/таблиц (в т.ч. по поисковым запросам и остаткам) добавлено уточнение, что данные обновляются 1 раз в час; дополнено описание задержек появления данных и правила атрибуции выкупов/отмен/возвратов к дате заказа, с рекомендацией сверять финальные итоги через financial reports.
- Аналитика: в CSV-описании и моделях данных переопределена семантика `cancelCount`/`cancelSum` — теперь это «отменили и вернули» (включая динамики и блок `wbClub.*`); обновлены соответствующие описания в перечислениях полей сортировки/выбора метрик.
- Аналитика: уточнено описание поля `balanceSum` — «сумма остатков на складах на текущий день, шт.» (ранее без привязки ко дню и единицам).

### Changed (2026.02.13)
- Продвижение → Поисковые кластеры: добавлен POST `/adv/v0/normquery/list` — получение списков активных и неактивных поисковых кластеров (только кластеры с ≥100 показов); запрос `items[]` (max 100) с `advertId`, `nmId`, ответ `normQueries.active[]`/`normQueries.excluded[]` (оба nullable).
- Продвижение → Статистика: добавлен POST `/adv/v1/normquery/stats` — статистика по поисковым кластерам за период с детализацией по дням; запрос `from`, `to` (date) + `items[]` (max 100) с `advertId`, `nmId`, ответ `dailyStats[]` с `date` и метриками (`views`, `clicks`, `atbs`, `orders`, `ctr`, `cpc`, `cpm`, `avgPos`, `shks`, `spend`, `normQuery`).
- Продвижение → Статистика поисковых кластеров (существующий метод): уточнено описание — «метод формирует статистику…» вместо «возвращает статистику…».
- Продвижение → Статистика: в схеме статистики по поисковым кластерам добавлены поля `shks` (кол-во заказанных товаров, шт.) и `spend` (затраты на продвижение в кластере).

### Changed (2026.02.12)
- Orders FBS: поле `scanPrice` (number, uint32) помечено как `nullable: true` — теперь может возвращаться `null` до фактической приёмки заказа.

### Changed (2026.02.11)
- Продвижение / Кампании: удалены устаревшие методы получения информации о кампаниях `/adv/v1/promotion/adverts` (POST) и `/adv/v0/auction/adverts` (GET) (ранее помечены deprecated)
- Продвижение / Создание кампаний: удалён устаревший конфиг-метод `/adv/v0/config` (GET)
- Продвижение / Создание кампаний: метод минимальных ставок перенесён и актуализирован — вместо `/adv/v0/bids/min` теперь `/api/advert/v1/bids/min` (POST); уточнено, что значения ставок в копейках; добавлены лимиты: 20 запросов/мин (интервал 3 сек, всплеск 5)
- Продвижение / Управление кампаниями: удалён устаревший метод изменения ставок `/adv/v0/bids` (PATCH)
- Продвижение / Управление кампаниями: удалён устаревший `/adv/v0/auction/bids` (PATCH); актуальный метод — `/api/advert/v1/bids` (PATCH) без deprecated, изменено поле ставки `bid` → `bid_kopecks` (в запросе и ответе), добавлено описание placement (`combined` для unified; `search`/`recommendations` для manual) и лимит: 5 запросов/сек (200 мс, всплеск 5)
- Продвижение / Управление кампаниями: метод изменения списка товаров `/adv/v0/auction/nms` (PATCH) переведён из тега «Параметры кампаний» в «Управление кампаниями» (без изменения пути/логики)
- Продвижение / Параметры кампаний: полностью удалён раздел/тег «Параметры кампаний» и связанные устаревшие методы (фиксированные фразы, минус-фразы, управление nm для unified): `/adv/v1/search/set-plus` (GET/POST), `/adv/v1/search/set-excluded` (POST), `/adv/v1/auto/set-excluded` (POST), `/adv/v1/auto/getnmtoadd` (GET), `/adv/v1/auto/updatenm` (POST)
- Продвижение / Статистика: удалён deprecated-метод `/adv/v2/fullstats` (POST); актуальный `/adv/v3/fullstats` (GET) с лимитом 3 запроса/мин (интервал 20 сек, всплеск 1)
- Продвижение / Статистика: удалены устаревшие методы статистики по фразам/кластерам и ключевым словам: `/adv/v2/auto/stat-words` (GET), `/adv/v1/stat/words` (GET), `/adv/v0/stats/keywords` (GET)
- Продвижение / Схемы: удалены неиспользуемые схемы/примеры, связанные с удалёнными v0/v1 методами (в т.ч. `GetAuctionAdverts`, `V0GetConfigCategoriesResponse`, `V0AdvertMultibid*`, `ResponseInfoAdvertType8` и примеры ошибок для удалённых эндпоинтов)

### Changed (2026.02.07)
- Аналитика
  - Схема `ProductOrdersTextRes`: удалено поле `currency` (и исключено из `required`), теперь валюта не возвращается на уровне объекта ответа
  - CSV-ответы отчётов: в примерах добавлен/восстановлен столбец `Currency` (значение `RUB`) в строках `SalesFunnel*`, `SearchReport*` — ранее встречались строки без валюты

- Отчёты (Основные отчёты)
  - Обновлено описание метода получения заказов: вместо ссылки на метод «Продажи» указано получение продаж через «детализации к отчётам реализации» (`/api/v5/supplier/reportDetailByPeriod`)
  - В описание отчёта добавлено уточнение: в ответах могут отсутствовать заказы без подтверждённой оплаты (отложенные платежи/рассрочка) даже при наличии этих заказов в детализациях к отчётам реализации

### Changed (2026.02.06)
- Аналитика: во все CSV-отчёты добавлено поле валюты — в «Воронке продаж» добавлена колонка `currency`, в отчёте по поиску по артикулам WB добавлена колонка `Currency`, в отчёте по текстам поисковых запросов добавлена колонка `Currency`, в отчёте по истории остатков добавлена колонка `Currency` (обновлены примеры CSV).
- Аналитика: в ответы табличных методов добавлено обязательное поле `currency` (schema `Currency`, пример `RUB`): `TableResponse` (required), `TableDetailsResponse` (required), `TableProductResponse` (required), `ProductSearchTextsResponse` (required), `ProductOrdersTextResponse` (required), `TableGroupsResponse` (required), `TableSizeResponse` (required), `TableShippingOfficeResponse` (required), а также в `ProductHistoryResponse` и `GroupedHistoryResponse` (required на уровне элемента массива).

### Changed (2026.02.04)
- Orders DBS: сокращены единицы времени в таблице rate-лимитов (`1 минута` → `1 мин`, `200 миллисекунд` → `200 мс`).

### Changed (2026.01.31)
- Сборочные задания DBS: добавлен новый readonly-метод `POST /api/marketplace/v3/dbs/orders/b2b/info` для получения B2B-данных покупателя по ID сборочных заданий (ИНН, КПП, наименование организации); лимит: 300 запросов/мин, интервал 200 мс, всплеск 20
- Сборочные задания DBS: изменён путь метода закрепления ГТД — `POST /api/marketplace/v3/dbs/meta/customs-declaration` → `POST /api/marketplace/v3/dbs/orders/meta/customs-declaration` (старый путь фактически удалён/заменён)
- Сборочные задания DBS: для метода ГТД обновлено описание допустимого статуса сборочного задания: `delivery` → `deliver`
- Сборочные задания DBS: для методов закрепления метаданных (в т.ч. ГТД) обновлены лимиты — было 20 запросов/мин (интервал 3 сек, всплеск 500), стало 500 запросов/мин (интервал 120 мс, всплеск 20)
- Сборочные задания DBS: добавлены схемы ответов для B2B-информации `api.B2bClientInfoResponses`, `api.B2bClientInfoResponse`, `api.B2bClientInfo` (batch-результаты по `orderId` с `isError`, `errors` и `data`)

### Changed (2026.01.30)
- Orders FBS: Уточнена логика добавления сборочных заданий в пустую поставку — допускаются задания любого типа (кроссбордер/не кроссбордер), тип поставки фиксируется по первому добавленному заданию (`crossBorderType`), далее можно добавлять только задания того же типа.
- Orders FBS: Добавлено поле `crossBorderType` (int32, enum `0|1`) для сущностей сборочного задания (не nullable) — признак кроссбордера.
- Orders FBS: Добавлено поле `crossBorderType` (int32, enum `0|1`, nullable) для сущности поставки — тип поставки (возможен `null`, если тип отсутствует).
- Communications: Для query-параметров фильтрации по наличию ответа/обработанности добавлены явные значения по умолчанию `default: true` (ранее только в описании).
- Communications: В примере ответа удалено поле `size` из объекта товара.
- Communications: Уточнены часовые пояса для полей дат `dt` и `dt_update` — теперь явно указано `UTC+3`.
- Communications: Для параметров пагинации `limit` и `offset` добавлены явные `default` (50 и 0 соответственно); описание больше не содержит текст “по умолчанию …”.
- Reports: Уточнено ожидаемое максимальное количество строк в выгрузке при `flag=0` — “примерно 80000” вместо “примерно 100000”.
- Finances: Расширен enum `report_type`: добавлены значения `3` и `4` (отчёты для уведомления о выкупе для Грузии); обновлено описание типов отчёта.

### Changed (2026.01.29)
- Все API: сокращены единицы измерения времени в таблицах rate-лимитов (минута → мин, секунда → сек, миллисекунд → мс) — изменения без влияния на функциональность

### Changed (2026.01.28)
- Products: в примерах запросов для выгрузки карточек (/content/v2/get/cards/list) и карточек из корзины (/content/v2/get/cards/trash) добавлена поддержка сортировки `"sort":{"ascending":true}` для инкрементальной выгрузки (получение только новых/обновлённых или недавно перемещённых в корзину по сохранённому `cursor.updatedAt|trashedAt` + `cursor.nmID`)
- Products: ужесточён rate limit для одного из методов (таблица лимитов в описании): было 50 запросов/мин (интервал 1200 мс), стало 10 запросов/мин (интервал 6 секунд), всплеск без изменений (2); запрос с HTTP 409 по-прежнему считается как 10 запросов
- Products: изменены примеры текстов ошибок в схемах ответов (например, `Response403`/`responseContentError`): `errorText`/`additionalErrors` теперь на английском (“Access denied”, “Error text”) вместо русского
- Orders FBS: в ответе со стикерами изменён тип полей `partA` и `partB` со `string` на `integer` (примеры значений также переведены в числовой формат)
- Communications: поле `statusID` помечено как `deprecated` и будет отключено 10 февраля (ссылка на release notes id=469)
- Reports: удалён (фактически выведен из спецификации) deprecated endpoint `GET /api/v1/analytics/warehouse-measurements` (отчёты “Занижение габаритов упаковки”)
- Reports: в моделях возвратов убран формат `date-time` у полей `completedDt`, `expiredDt`, `readyToReturnDt` (остались строками без явного формата)

### Changed (2026.01.27)
- Общие: для ответов с ошибками 401 (Не авторизован) и 429 (Слишком много запросов) изменён `Content-Type` с `application/json` на `application/problem+json`.
- Products: для ответов с ошибками 401 и 429 изменён `Content-Type` с `application/json` на `application/problem+json`.
- Orders DBW: для ответов с ошибками 401 и 429 изменён `Content-Type` с `application/json` на `application/problem+json`.
- Orders DBS: для ответов с ошибками 401 и 429 изменён `Content-Type` с `application/json` на `application/problem+json`.
- In-store pickup: для ответов с ошибками 401 и 429 изменён `Content-Type` с `application/json` на `application/problem+json`.
- Orders FBW: для ответов с ошибками 401 и 429 изменён `Content-Type` с `application/json` на `application/problem+json`.
- Promotion: для ответов с ошибками 401 и 429 изменён `Content-Type` с `application/json` на `application/problem+json`.
- Communications: для ответов с ошибками 401 и 429 изменён `Content-Type` с `application/json` на `application/problem+json`.
- Tariffs: для ответов с ошибками 401 и 429 изменён `Content-Type` с `application/json` на `application/problem+json`.
- Analytics: для ответов с ошибками 401 и 429 изменён `Content-Type` с `application/json` на `application/problem+json`.
- Reports: для ответов с ошибками 401 и 429 изменён `Content-Type` с `application/json` на `application/problem+json`.
- Finances: для ответов с ошибками 401 и 429 изменён `Content-Type` с `application/json` на `application/problem+json`.

### Changed (2026.01.24)
- Products: уточнено описание `charcType=4` в методе «Характеристики предмета» — теперь явно указано, что число может быть целым или с десятичной дробью
- Products: обновлены ссылки в описании поля «Значения характеристики» (в нескольких местах) — вместо упоминания «Характеристики предмета» текстом добавлена явная ссылка на `GET /content/v2/object/charcs/{subjectId}`
- Products: правки форматирования/типографики в описаниях (`"charcType":1/4` — добавлены пробелы вокруг тире); функциональных изменений API нет

### Changed (2026.01.22)
- Поставки FBS: удалён устаревший endpoint `GET /api/v3/supplies/{supplyId}/orders` (получение сборочных заданий в поставке)
- Поставки FBS: удалена схема `SupplyOrder`, использовавшаяся в ответе `GET /api/v3/supplies/{supplyId}/orders`
- Отчёты (Отчёты об удержаниях): удалён устаревший endpoint `GET /api/v1/analytics/incorrect-attachments` (подмена товара); вместе с ним удалён response `SuccessIncorrectProductsResponse` и пример ошибки `IncorrectDateFrom`
- Отчёты (Отчёты об удержаниях): удалён устаревший endpoint `GET /api/v1/analytics/characteristics-change` (смена характеристик); вместе с ним удалён response `SuccessCharacteristicsTaskResponse`

### Changed (2026.01.21)
- Products: поле `x-category` изменено с массива на строку для эндпоинтов получения карточек и списка карточек в корзине.
- Orders DBS: обновлены rate limits для эндпоинта передачи данных СГ.
- Finances: добавлены поля `uuid_promocode` (ID промокода) и `sale_price_promocode_discount_prc` (скидка за промокод, %).

### Changed (2026.01.20)
- Orders DBS: значительно снижены rate limits для эндпоинтов передачи/удаления статусов и метаданных (с 100 req/min до 1 req/sec); уменьшены лимиты для эндпоинтов получения статусов и метаданных (с 1000 до 500 req/min, с 300 до 150 req/min).
- Communications: поле `clientID` помечено как deprecated и будет отключено 2 февраля.

### Changed (2026.01.17)
- Products/Orders DBW/DBS: исправлено написание «Доступ запрещён» в описаниях ошибок и `AccessDenied`.
- Orders FBS: обновлены ссылки на раздел сборочных заданий и метаданные.
- In-store pickup: актуализирована ссылка на список новых сборочных заданий в описании метаданных.
- Analytics: обновлена ссылка на отчёты по поисковым запросам.

### Changed (2026.01.16)
- Orders FBS: добавлен `customsDeclaration` (номер ГТД) в метаданные, расширены допустимые ключи и добавлен новый endpoint `/api/marketplace/v3/orders/{orderId}/meta/customs-declaration`.
- Communications: в методе подсчета отзывов/вопросов убрано обещание возвращать среднюю оценку.

### Changed (2026.01.15)
- Orders DBS: эндпоинты статусов и метаданных перенесены на `/api/marketplace/v3/...` и работают пачками через `api.OrdersRequestV2`; ответы и ошибки переведены на батч-форматы (`api.OrderStatusesV2`, `api.StatusSetResponses`, `api.BatchError`).
- Reports: уточнены описания отчетов по складам/заказам/продажам (задержки обновления, предварительный характер данных, возможное отсутствие неоплаченных заказов); `priceWithDisc` теперь включает скидку WB Клуба.

### Changed (2026.01.14)
- Finances: добавлены поля скидки лояльности продавца `loyalty_id` и `loyalty_discount`.
- Products: для создания/редактирования карточек и габаритов добавлено предупреждение о синхронизации до 30 минут, когда нельзя менять остатки и цены.
