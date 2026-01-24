# Changelog

## Unreleased
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
