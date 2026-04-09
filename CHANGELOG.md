# Changelog

## Unreleased
### Changed (2026.04.09)
- Orders FBS: поля `partA` и `partB` в ответе со стикерами изменены с `integer` на `string` (примеры теперь строковые), уточнены описания («…для печати подписи»).
- Orders FBS: в ответ со стикерами добавлены поля `partA`, `partB`, `barcode` (закодированное значение стикера) и обновлён пример ответа (в т.ч. для статуса `awaitingTrackNumber` добавлены пустые значения).
- Orders DBW: обновлены описания полей `partA`/`partB` («…для печати подписи»), изменён пример значения `partB` с `'9753'` на `'97523'`.

### Changed (2026.04.08)
- Finances: в схему ответа добавлены поля `article_substitution` (ID подменного артикула), `sale_price_affiliated_discount_prc` (скидка по подменному артикулу, %), `agency_vat` (удержание агентского НДС, %; только для продавцов из Кыргызстана; возвращается при наличии значения), `sale_price_wholesale_discount_prc` (оптовая скидка для бизнеса, %)

### Changed (2026.04.07)
- Products: в ответе для пакетов ошибок (PublicErrorsOutput) добавлено поле `updatedAt` (string, date-time) — дата/время создания или редактирования пакета; обновлены примеры (в т.ч. `cursor.updatedAt` и `subjects[].updatedAt`).
- Products: для операций изменения цен/скидок добавлен новый ответ `409 Conflict` — ошибка конвертации/смены валюты (`ResponseError`, пример `Result409`: “You can't change prices and discounts while switching to another currency”).

### Changed (2026.04.03)
- Информация о продавце: добавлен GET `/api/common/v1/rating` (feedbacks-api) — получение рейтинга продавца и количества отзывов; доступ только по сервисному токену категории «Вопросы и отзывы»; лимит 1 запрос/мин (всплеск 1)
- Информация о продавце: добавлен GET `/api/common/v1/subscriptions` (common-api) — информация о подписке «Джем» (state/activationSource/level/since/till), при отсутствии подписки возможен пустой ответ `200`; доступ по сервисному токену; лимит 1 запрос/мин (всплеск 10)
- Информация о продавце: обновлено описание/summary метода получения информации о продавце — теперь явно указано, что можно использовать токен любой категории (убрано ограничение про «Тестовый контур»)

- Orders FBS: добавлен статус `cancel_carrier` (отменено перевозчиком) и `wbStatus` `canceled_by_carrier` — только для кроссбордера
- Orders FBS: ужесточены условия для PATCH `/api/v3/supplies/{supplyId}/deliver` — в поставке не должно быть сборочных заданий с отсутствующей обязательной маркировкой или с маркировкой, не прошедшей валидацию
- Orders FBS: для PATCH `/api/v3/supplies/{supplyId}/deliver` изменён формат ошибки `409` — вместо `Error` используется `409SupplyDeliverError`; заменён пример `UinIsNotFilled` на `MetaValidationFail` с деталями по заказам/метаданным
- Orders FBS: добавлена схема `MetaDetails` и поле `metaDetails` (массив) в ответах по метаданным сборочных заданий; поле `meta` помечено как `deprecated`, схема `Meta` помечена как устаревшая и будет отключена 30 апреля

- Продвижение: методы статистики поисковых кластеров теперь поддерживают кампании с моделями оплаты `cpm` и `cpc` (ранее только `cpm`)
- Продвижение: в моделях статистики поисковых кластеров поля `views`, `ctr`, `cpm` сделаны `nullable`; для кампаний `cpc` эти значения возвращаются `null` (обновлены описания)

### Changed (2026.03.27)
- General: в перечисление прав доступа (components.schemas.*.permissions[].code) добавлены новые коды `oldAnalyticsReports` (Отчёты) и `marketplace` (Свой склад); они также появились в примерах ответов для списков пользователей/ролей с `disabled: false`.

### Changed (2026.03.25)
- Orders FBS: в ответе метода получения PDF-стикеров сборочных заданий кроссбордера добавлено поле `status` (enum: `awaitingTrackNumber`, `ready`) — статус генерации стикера; обновлено описание с рекомендацией повторять запрос до `ready`.
- Orders FBS: изменена схема элемента `stickers`: поле `file` (base64 PDF) перемещено ниже (после `parcelId`), добавлен пример ответа, где при `awaitingTrackNumber` поля `parcelId`/`file` могут быть пустыми.

### Changed (2026.03.24)
- Аналитика / История остатков: добавлен новый read-only endpoint `POST /api/analytics/v1/stocks-report/wb-warehouses` (токены: personal, service) для получения текущих остатков по складам WB; обновление данных раз в 30 минут; лимит 3 запроса/мин (интервал 20 сек, всплеск 1 запрос).
- Аналитика / История остатков: добавлены схемы `InventoryRequest` (фильтры `nmIds` до 1000, опционально `chrtIds`, пагинация `limit` до 250000 и `offset`) и `InventoryWbResponse` (поля по размеру и складу: `nmId`, `chrtId`, `warehouseId`, `warehouseName`, `regionName`, `quantity`, `inWayToClient`, `inWayFromClient`).
- Отчёты / Склады: метод «Склады» помечен как `deprecated: true`; в описании указано, что будет удалён 23 июня (ссылка на release notes).

### Changed (2026.03.21)
- Общие: в ответе с данными продавца добавлено поле `tin` (string) — ИНН
- Товары (Контент / Карточки товаров): добавлены новые методы `POST /content/v2/cards/delete/trash` (перенос карточек в корзину) и `POST /content/v2/cards/recover` (восстановление карточек из корзины)
- Товары (Контент / Карточки товаров): поле `updatedAt` в выдаче списка карточек помечено как `nullable: true` (может быть `null`)
- Товары (Контент): обновлено описание лимитов для части методов карточек — убран список «исключений» из общего лимита (теперь формулировка «лимит на один аккаунт продавца» без перечисления исключений)
- Товары (Контент / Медиафайлы): в описании лимитов для загрузки медиа добавлены в список исключений новые методы корзины (`/content/v2/cards/delete/trash`, `/content/v2/cards/recover`)
- Продвижение: метод «Изменение ставок в кампаниях» расширен — теперь явно поддерживает кампании с моделью оплаты `cpc` (за клики) помимо единой/ручной ставки
- Продвижение: метод «Установка и удаление минус-фраз» — изменено описание применимости: теперь для кампаний с единой и ручной ставкой (вместо ограничения на ручную ставку и `cpm`)
- Коммуникации: в примерах `photoLinks` изменены расширения ссылок изображений с `.jpg` на `.webp`
- Коммуникации: удалено поле `clientID` (ранее `deprecated`) из схем/примеров сообщений чата с покупателем
- Коммуникации: удалено поле `statusID` (ранее `deprecated`) из схемы товара в коммуникациях
- Тарифы: уточнены описания — тарифы для коробов совпадают с тарифами для «Суперсейфа», для монопаллет — с тарифами для «Поштучных паллет» (лимиты без изменений: 60/мин)

### Changed (2026.03.19)
- Products: добавлены примеры ошибок 400 для операций с объединёнными карточками — `MissingRequiredCharacteristics` (не заполнены обязательные характеристики) и `NonUniqueCharacteristicsInOneGroup*` (неуникальные характеристики в группе) для методов создания/добавления характеристик
- Orders FBS: переименовано поле опций заказа `isB2b` → `isB2B` (breaking change в схемах)
- Orders DBW: добавлен новый endpoint `POST /api/marketplace/v3/dbw/orders/client` для получения информации о покупателе по ID сборочных заданий; введены схемы ответа `ClientInfoResp`/`ClientInfo` (поля: `replacementPhone`, `phone`, `phoneCode`, `additionalPhones`, `additionalPhoneCodes`, `firstName`, `fullName`, `orderId`); уточнено описание поля ошибки `Error.data`
- Orders DBS: в описаниях лимитов удалено правило «ответ 409 считается как 10 запросов»; расширена модель ошибки — `detail` дополнено значением `ImeiIsNotFilled`, описание `code` уточнено (404/409)
- Orders FBW: добавлено поле `isBoxOnPallet` (boolean) для поставок типа «Поштучная палета», возвращается только при `boxTypeID=2`; расширены/уточнены описания `boxTypeID` и опций доступных типов поставки по складам (добавлен флаг `isBoxOnPallet`)
- Promotion (Маркетинг/Реклама): добавлен endpoint `GET /api/advert/v0/bids/recommendations` (только для кампаний `cpm`) для получения рекомендуемых ставок по карточке (`base`) и поисковым кластерам (`normQueries`); лимит 5 запросов/мин; добавлены схемы `V0BidsRecommendationsResponse` и связанные; добавлены примеры ошибок 400 `IncorrectTypeAdv`, `IncorrectUsingMethods`; в ответах `V0GetNormQueryMinusResponseItem` и `V0GetNormQueryMinusResponse` сняты требования `required` (поля `advert_id`, `nm_id`, `items` больше не обязательны)
- Communications: в модели чата уточнено поле `addTime` (Unix Timestamp в мс, «дата и время создания чата») и добавлено новое поле `sign` (подпись чата)
- Reports: удалён (ранее deprecated) endpoint `GET /api/v1/supplier/incomes` «Поставки» и схема `IncomesItem`; переименован раздел/теги «Платная приёмка» → «Операции при приёмке» (эндпоинты `/api/v1/acceptance_report*` без изменения путей, обновлены ссылки/описания)

### Changed (2026.03.11)
- Orders FBS: уточнены правила добавления коробов в поставку — только в открытую; лимит по количеству коробов: не больше количества товаров в поставке + 1.
- Orders DBW: метод получения стикеров сборочных заданий — расширены допустимые статусы заказов для получения стикеров: `confirm` (на сборке) и `complete` (в доставке) вместо только `confirm`; ограничение «максимум 100 стикеров за запрос» сохранено и вынесено в описание; формулировки по форматам стикеров уточнены («доступные форматы»).

### Changed (2026.03.06)
- Общие: уточнено описание поля `detail` в ошибке (Payment Required) — теперь явно указывает на недостаток средств на балансе сервиса из Каталога бизнес‑решений; правки описания query-параметра `fromDate` (без изменения контракта)
- Товары: в ответах/моделях остатков изменена семантика массива — теперь «массив ID размеров (chrtId) и их остатков» вместо «баркодов и остатков»; удалены deprecated-поля/параметры, связанные с баркодами: `sku` (в элементах массива) и `skus` (массив баркодов) — ранее помечались как отключаемые 9 февраля; в компонентной модели добавлено поле `chrtId` (ID размера товара) рядом с `sku` и `amount`; уточнено описание `detail` для Payment Required
- Заказы FBS: уточнено описание `detail` для ошибки Payment Required (недостаточно средств на балансе сервиса)
- Заказы DBW: в ответе со стикером поле `file` больше не имеет `format: byte` (остается `string` с base64); пример `phone` приведён к строке (в кавычках); уточнено описание `detail` для Payment Required
- Заказы DBS: в ответе со стикером поле `file` больше не имеет `format: byte` (остается `string` с base64); изменён пример ошибки `SGTINIsNotFilled` — `code` теперь строковый (`SGTINIsNotFilled`), `message` пустая строка (вместо `code: 409`, `message: SGTINIsNotFilled`); уточнено описание `detail` для Payment Required
- Заказы FBW: удалена модель `models.AcceptanceCoefficient` и связанные примеры/ответы (`ResponseCoefficients`, `Response400CoefficientsNew`) — из спецификации исключено описание структуры коэффициентов приёмки; уточнено описание `detail` для Payment Required
- Продвижение: для query-параметра `status` убран фиксированный `enum` (остался `string`, пример `-1,4,8`); параметр `promotionIDs` изменён с `string` на `array<integer>`; уточнено описание `detail` для Payment Required
- Коммуникации: уточнено описание `detail` для ошибки Payment Required
- Тарифы: уточнено описание `detail` для ошибки Payment Required
- Аналитика: уточнено описание `detail` для ошибки Payment Required
- Отчёты: правки описаний query-параметров (перенос `description` на уровень параметра) без изменения контракта; уточнено описание `detail` для Payment Required
- Финансы: правки описаний query-параметров (перенос `description` на уровень параметра) без изменения контракта; уточнено описание `detail` для Payment Required
- WBD: поле `path` (список `id`) — заменено `x-nullable: true` на стандартное `nullable: true` (контракт по nullable сохранён)

### Changed (2026.03.05)
- Управление пользователями продавца: для методов `/api/v1/invite` (POST), `/api/v1/users` (GET), `/api/v1/users` (PUT), `/api/v1/users` (DELETE) явно задан тип токена `x-token-types: [personal]` и обновлено описание авторизации (методы доступны только по персональному токену)
- Общие изменения: добавлен новый тип ошибки `402 Payment Required` (components/responses/402, `application/problem+json` с полями `title`, `detail`); `402` добавлен в ответы ряда методов (в т.ч. в 01-general.yaml)
- Products: для множества методов добавлен ответ `402 Payment Required` (ссылка на `#/components/responses/402`), добавлено описание/схема ошибки `402` в components
- Orders FBS: для всех основных методов добавлен ответ `402 Payment Required`, добавлено описание/схема ошибки `402` в components
- Orders DBW: для всех основных методов добавлен ответ `402 Payment Required`, добавлено описание/схема ошибки `402` в components
- Orders DBS: добавлен ответ `402 Payment Required` для методов; для метода получения стикеров для сборочных заданий с доставкой в ПВЗ добавлен `x-token-types: [personal, service]` и обновлён блок описания авторизации (без изменения доступных типов токенов)
- In-store pickup: для методов добавлен ответ `402 Payment Required`, добавлено описание/схема ошибки `402` в components
- Orders FBW: для методов добавлен ответ `402 Payment Required`, добавлено описание/схема ошибки `402` в components
- Promotion: для методов календаря промо добавлен ответ `402 Payment Required`, добавлено описание/схема ошибки `402` в components
- Communications: для методов добавлен ответ `402 Payment Required`; для `/api/v1/seller/download/{id}` дополнительно явно добавлены ответы `401/402/429` (ранее отсутствовали в описании); добавлено описание/схема ошибки `402` в components
- Tariffs: для методов добавлен ответ `402 Payment Required`, добавлено описание/схема ошибки `402` в components
- Analytics: для методов добавлен ответ `402 Payment Required`, добавлено описание/схема ошибки `402` в components; обновлены примеры данных в одном из CSV-ответов (изменены значения в строках примера)
- Reports: для методов добавлен ответ `402 Payment Required`, добавлено описание/схема ошибки `402` в components
- Finances: для методов добавлен ответ `402 Payment Required`, добавлено описание/схема ошибки `402` в components

### Changed (2026.03.03)
- Orders FBS: в схему поставки добавлено поле `isB2b: boolean|null` — признак B2B-продажи (`true/false/null`, где `null` означает отсутствие признака, т.к. сборочные задания не добавлены к поставке).
- Orders DBS: изменён формат ответа для метода обновления статуса/данных (ранее `$ref api.StatusSetResponses`) — теперь явно описан объект с `requestId` и массивом `results[]` (элементы: `orderId`, `isError`, `errors[] {code, detail}`).
- Orders DBS: добавлен новый тип ошибки `SGTINIsNotFilled` (HTTP 409) и пример ответа; ошибка возвращается, если обязательный код маркировки SGTIN не указан.
- Orders DBS: обновлена документация метода закрепления кодов маркировки — уточнено, что статус должен быть `confirm` («на сборке»).
- Orders DBS: унифицированы значения `errors.detail` — вместо `not found/status conflict` теперь `NotFound/StatusMismatch` (обновлены описание и пример).
- Orders DBS: уточнено описание поля `orderId` в результатах обновления — «с успешно обновлёнными данными» вместо «метаданными».

### Changed (2026.02.27)
- Communications / Возвраты покупателями: в ответе по заявкам добавлены поля `origin_id_info` (nullable, результат сверки IMEI для возврата через ПВЗ WB; применимо к Apple/«Смартфоны» subjectId=515 при цене от 40000 с учётом скидки) и `delivery_dt` (дата/время получения заказа покупателем)
- Reports: для ряда отчётных методов добавлен ответ `204 No Content` с описанием «Нет данных» (когда по запросу отсутствуют данные)

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
