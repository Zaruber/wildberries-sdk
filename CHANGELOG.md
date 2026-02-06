# Changelog

## Unreleased
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
