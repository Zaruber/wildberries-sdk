# wildberries-sdk (Go)

Сгенерированные Go-клиенты находятся в `clients/go/<module>`.
Модульный путь: `github.com/eslazarev/wildberries-sdk/clients/go/<module>`.

## Использование

Каждая спецификация - отдельный пакет. Подключайте нужный пакет через `go.mod` и импортируйте его по пути модуля.

<!-- GO_METHODS_LIST_START -->
## Методы API

### general (`general`)
- `general.DefaultApiService.ApiV1InvitePost` — `POST /api/v1/invite` — Создать приглашение для нового пользователя
- `general.DefaultApiService.ApiV1SellerInfoGet` — `GET /api/v1/seller-info` — Получение информации о продавце
- `general.DefaultApiService.ApiV1UserDelete` — `DELETE /api/v1/user` — Удалить пользователя
- `general.DefaultApiService.ApiV1UsersAccessPut` — `PUT /api/v1/users/access` — Изменить права доступа пользователей
- `general.DefaultApiService.ApiV1UsersGet` — `GET /api/v1/users` — Получить список активных или приглашённых пользователей продавца
- `general.APIAPIService.ApiCommunicationsV2NewsGet` — `GET /api/communications/v2/news` — Получение новостей портала продавцов
- `general.WBAPIAPIService.PingGet` — `GET /ping` — Проверка подключения

### products (`products`)
- `products.DefaultApiService.ApiContentV1BrandsGet` — `GET /api/content/v1/brands` — Бренды
- `products.DefaultApiService.ApiV2BufferGoodsTaskGet` — `GET /api/v2/buffer/goods/task` — Детализация необработанной загрузки
- `products.DefaultApiService.ApiV2BufferTasksGet` — `GET /api/v2/buffer/tasks` — Состояние необработанной загрузки
- `products.DefaultApiService.ApiV2HistoryGoodsTaskGet` — `GET /api/v2/history/goods/task` — Детализация обработанной загрузки
- `products.DefaultApiService.ApiV2HistoryTasksGet` — `GET /api/v2/history/tasks` — Состояние обработанной загрузки
- `products.DefaultApiService.ApiV2ListGoodsFilterGet` — `GET /api/v2/list/goods/filter` — Получить товары с ценами
- `products.DefaultApiService.ApiV2ListGoodsFilterPost` — `POST /api/v2/list/goods/filter` — Получить товары с ценами по артикулам
- `products.DefaultApiService.ApiV2ListGoodsSizeNmGet` — `GET /api/v2/list/goods/size/nm` — Получить размеры товара с ценами
- `products.DefaultApiService.ApiV2QuarantineGoodsGet` — `GET /api/v2/quarantine/goods` — Получить товары в карантине
- `products.DefaultApiService.ApiV2UploadTaskClubDiscountPost` — `POST /api/v2/upload/task/club-discount` — Установить скидки WB Клуба
- `products.DefaultApiService.ApiV2UploadTaskPost` — `POST /api/v2/upload/task` — Установить цены и скидки
- `products.DefaultApiService.ApiV2UploadTaskSizePost` — `POST /api/v2/upload/task/size` — Установить цены для размеров
- `products.DefaultApiService.ApiV3DbwWarehousesWarehouseIdContactsGet` — `GET /api/v3/dbw/warehouses/{warehouseId}/contacts` — Список контактов
- `products.DefaultApiService.ApiV3DbwWarehousesWarehouseIdContactsPut` — `PUT /api/v3/dbw/warehouses/{warehouseId}/contacts` — Обновить список контактов
- `products.DefaultApiService.ApiV3OfficesGet` — `GET /api/v3/offices` — Получить список складов WB
- `products.DefaultApiService.ApiV3StocksWarehouseIdDelete` — `DELETE /api/v3/stocks/{warehouseId}` — Удалить остатки товаров
- `products.DefaultApiService.ApiV3StocksWarehouseIdPost` — `POST /api/v3/stocks/{warehouseId}` — Получить остатки товаров
- `products.DefaultApiService.ApiV3StocksWarehouseIdPut` — `PUT /api/v3/stocks/{warehouseId}` — Обновить остатки товаров
- `products.DefaultApiService.ApiV3WarehousesGet` — `GET /api/v3/warehouses` — Получить список складов продавца
- `products.DefaultApiService.ApiV3WarehousesPost` — `POST /api/v3/warehouses` — Создать склад продавца
- `products.DefaultApiService.ApiV3WarehousesWarehouseIdDelete` — `DELETE /api/v3/warehouses/{warehouseId}` — Удалить склад продавца
- `products.DefaultApiService.ApiV3WarehousesWarehouseIdPut` — `PUT /api/v3/warehouses/{warehouseId}` — Обновить склад продавца
- `products.DefaultApiService.ContentV2BarcodesPost` — `POST /content/v2/barcodes` — Генерация баркодов
- `products.DefaultApiService.ContentV2CardsDeleteTrashPost` — `POST /content/v2/cards/delete/trash` — Перенос карточек товаров в корзину
- `products.DefaultApiService.ContentV2CardsErrorListPost` — `POST /content/v2/cards/error/list` — Список несозданных карточек товаров с ошибками
- `products.DefaultApiService.ContentV2CardsLimitsGet` — `GET /content/v2/cards/limits` — Лимиты карточек товаров
- `products.DefaultApiService.ContentV2CardsMoveNmPost` — `POST /content/v2/cards/moveNm` — Объединение и разъединение карточек товаров
- `products.DefaultApiService.ContentV2CardsRecoverPost` — `POST /content/v2/cards/recover` — Восстановление карточек товаров из корзины
- `products.DefaultApiService.ContentV2CardsUpdatePost` — `POST /content/v2/cards/update` — Редактирование карточек товаров
- `products.DefaultApiService.ContentV2CardsUploadAddPost` — `POST /content/v2/cards/upload/add` — Создание карточек товаров с присоединением
- `products.DefaultApiService.ContentV2CardsUploadPost` — `POST /content/v2/cards/upload` — Создание карточек товаров
- `products.DefaultApiService.ContentV2DirectoryColorsGet` — `GET /content/v2/directory/colors` — Цвет
- `products.DefaultApiService.ContentV2DirectoryCountriesGet` — `GET /content/v2/directory/countries` — Страна производства
- `products.DefaultApiService.ContentV2DirectoryKindsGet` — `GET /content/v2/directory/kinds` — Пол
- `products.DefaultApiService.ContentV2DirectorySeasonsGet` — `GET /content/v2/directory/seasons` — Сезон
- `products.DefaultApiService.ContentV2DirectoryTnvedGet` — `GET /content/v2/directory/tnved` — ТНВЭД-код
- `products.DefaultApiService.ContentV2DirectoryVatGet` — `GET /content/v2/directory/vat` — Ставка НДС
- `products.DefaultApiService.ContentV2GetCardsListPost` — `POST /content/v2/get/cards/list` — Список карточек товаров
- `products.DefaultApiService.ContentV2GetCardsTrashPost` — `POST /content/v2/get/cards/trash` — Список карточек товаров в корзине
- `products.DefaultApiService.ContentV2ObjectAllGet` — `GET /content/v2/object/all` — Список предметов
- `products.DefaultApiService.ContentV2ObjectCharcsSubjectIdGet` — `GET /content/v2/object/charcs/{subjectId}` — Характеристики предмета
- `products.DefaultApiService.ContentV2ObjectParentAllGet` — `GET /content/v2/object/parent/all` — Родительские категории товаров
- `products.DefaultApiService.ContentV2TagIdDelete` — `DELETE /content/v2/tag/{id}` — Удаление ярлыка
- `products.DefaultApiService.ContentV2TagIdPatch` — `PATCH /content/v2/tag/{id}` — Изменение ярлыка
- `products.DefaultApiService.ContentV2TagNomenclatureLinkPost` — `POST /content/v2/tag/nomenclature/link` — Управление ярлыками в карточке товара
- `products.DefaultApiService.ContentV2TagPost` — `POST /content/v2/tag` — Создание ярлыка
- `products.DefaultApiService.ContentV2TagsGet` — `GET /content/v2/tags` — Список ярлыков
- `products.DefaultApiService.ContentV3MediaFilePost` — `POST /content/v3/media/file` — Загрузить медиафайл
- `products.DefaultApiService.ContentV3MediaSavePost` — `POST /content/v3/media/save` — Загрузить медиафайлы по ссылкам

### orders_fbs (`orders_fbs`)
- `orders_fbs.FBSAPIService.ApiMarketplaceV3OrdersMetaPost` — `POST /api/marketplace/v3/orders/meta` — Получить метаданные сборочных заданий
- `orders_fbs.FBSAPIService.ApiMarketplaceV3SuppliesSupplyIdOrderIdsGet` — `GET /api/marketplace/v3/supplies/{supplyId}/order-ids` — Получить ID сборочных заданий поставки
- `orders_fbs.FBSAPIService.ApiMarketplaceV3SuppliesSupplyIdOrdersPatch` — `PATCH /api/marketplace/v3/supplies/{supplyId}/orders` — Добавить сборочные задания к поставке
- `orders_fbs.FBSAPIService.ApiV3OrdersClientPost` — `POST /api/v3/orders/client` — Заказы с информацией по клиенту
- `orders_fbs.FBSAPIService.ApiV3OrdersGet` — `GET /api/v3/orders` — Получить информацию о сборочных заданиях
- `orders_fbs.FBSAPIService.ApiV3OrdersNewGet` — `GET /api/v3/orders/new` — Получить список новых сборочных заданий
- `orders_fbs.FBSAPIService.ApiV3OrdersOrderIdCancelPatch` — `PATCH /api/v3/orders/{orderId}/cancel` — Отменить сборочное задание
- `orders_fbs.FBSAPIService.ApiV3OrdersOrderIdMetaDelete` — `DELETE /api/v3/orders/{orderId}/meta` — Удалить метаданные сборочного задания
- `orders_fbs.FBSAPIService.ApiV3OrdersOrderIdMetaExpirationPut` — `PUT /api/v3/orders/{orderId}/meta/expiration` — Закрепить за сборочным заданием срок годности товара
- `orders_fbs.FBSAPIService.ApiV3OrdersOrderIdMetaGtinPut` — `PUT /api/v3/orders/{orderId}/meta/gtin` — Закрепить за сборочным заданием GTIN
- `orders_fbs.FBSAPIService.ApiV3OrdersOrderIdMetaImeiPut` — `PUT /api/v3/orders/{orderId}/meta/imei` — Закрепить за сборочным заданием IMEI
- `orders_fbs.FBSAPIService.ApiV3OrdersOrderIdMetaSgtinPut` — `PUT /api/v3/orders/{orderId}/meta/sgtin` — Закрепить за сборочным заданием код маркировки товара
- `orders_fbs.FBSAPIService.ApiV3OrdersOrderIdMetaUinPut` — `PUT /api/v3/orders/{orderId}/meta/uin` — Закрепить за сборочным заданием УИН
- `orders_fbs.FBSAPIService.ApiV3OrdersStatusHistoryPost` — `POST /api/v3/orders/status/history` — История статусов для сборочных заданий кроссбордера
- `orders_fbs.FBSAPIService.ApiV3OrdersStatusPost` — `POST /api/v3/orders/status` — Получить статусы сборочных заданий
- `orders_fbs.FBSAPIService.ApiV3OrdersStickersCrossBorderPost` — `POST /api/v3/orders/stickers/cross-border` — Получить стикеры сборочных заданий кроссбордера
- `orders_fbs.FBSAPIService.ApiV3OrdersStickersPost` — `POST /api/v3/orders/stickers` — Получить стикеры сборочных заданий
- `orders_fbs.FBSAPIService.ApiV3PassesGet` — `GET /api/v3/passes` — Получить список пропусков
- `orders_fbs.FBSAPIService.ApiV3PassesOfficesGet` — `GET /api/v3/passes/offices` — Получить список складов, для которых требуется пропуск
- `orders_fbs.FBSAPIService.ApiV3PassesPassIdDelete` — `DELETE /api/v3/passes/{passId}` — Удалить пропуск
- `orders_fbs.FBSAPIService.ApiV3PassesPassIdPut` — `PUT /api/v3/passes/{passId}` — Обновить пропуск
- `orders_fbs.FBSAPIService.ApiV3PassesPost` — `POST /api/v3/passes` — Создать пропуск
- `orders_fbs.FBSAPIService.ApiV3SuppliesGet` — `GET /api/v3/supplies` — Получить список поставок
- `orders_fbs.FBSAPIService.ApiV3SuppliesOrdersReshipmentGet` — `GET /api/v3/supplies/orders/reshipment` — Получить все сборочные задания для повторной отгрузки
- `orders_fbs.FBSAPIService.ApiV3SuppliesPost` — `POST /api/v3/supplies` — Создать новую поставку
- `orders_fbs.FBSAPIService.ApiV3SuppliesSupplyIdBarcodeGet` — `GET /api/v3/supplies/{supplyId}/barcode` — Получить QR-код поставки
- `orders_fbs.FBSAPIService.ApiV3SuppliesSupplyIdDelete` — `DELETE /api/v3/supplies/{supplyId}` — Удалить поставку
- `orders_fbs.FBSAPIService.ApiV3SuppliesSupplyIdDeliverPatch` — `PATCH /api/v3/supplies/{supplyId}/deliver` — Передать поставку в доставку
- `orders_fbs.FBSAPIService.ApiV3SuppliesSupplyIdGet` — `GET /api/v3/supplies/{supplyId}` — Получить информацию о поставке
- `orders_fbs.FBSAPIService.ApiV3SuppliesSupplyIdOrdersGet` — `GET /api/v3/supplies/{supplyId}/orders` — Получить сборочные задания в поставке
- `orders_fbs.FBSAPIService.ApiV3SuppliesSupplyIdTrbxDelete` — `DELETE /api/v3/supplies/{supplyId}/trbx` — Удалить короба из поставки
- `orders_fbs.FBSAPIService.ApiV3SuppliesSupplyIdTrbxGet` — `GET /api/v3/supplies/{supplyId}/trbx` — Получить список коробов поставки
- `orders_fbs.FBSAPIService.ApiV3SuppliesSupplyIdTrbxPost` — `POST /api/v3/supplies/{supplyId}/trbx` — Добавить короба к поставке
- `orders_fbs.FBSAPIService.ApiV3SuppliesSupplyIdTrbxStickersPost` — `POST /api/v3/supplies/{supplyId}/trbx/stickers` — Получить стикеры коробов поставки

### orders_dbw (`orders_dbw`)
- `orders_dbw.DBWAPIService.ApiV3DbwOrdersCourierPost` — `POST /api/v3/dbw/orders/courier` — Информация о курьере
- `orders_dbw.DBWAPIService.ApiV3DbwOrdersDeliveryDatePost` — `POST /api/v3/dbw/orders/delivery-date` — Дата и время доставки
- `orders_dbw.DBWAPIService.ApiV3DbwOrdersGet` — `GET /api/v3/dbw/orders` — Получить информацию о завершенных сборочных заданиях
- `orders_dbw.DBWAPIService.ApiV3DbwOrdersNewGet` — `GET /api/v3/dbw/orders/new` — Получить список новых сборочных заданий
- `orders_dbw.DBWAPIService.ApiV3DbwOrdersOrderIdAssemblePatch` — `PATCH /api/v3/dbw/orders/{orderId}/assemble` — Перевести в доставку
- `orders_dbw.DBWAPIService.ApiV3DbwOrdersOrderIdCancelPatch` — `PATCH /api/v3/dbw/orders/{orderId}/cancel` — Отменить сборочное задание
- `orders_dbw.DBWAPIService.ApiV3DbwOrdersOrderIdConfirmPatch` — `PATCH /api/v3/dbw/orders/{orderId}/confirm` — Перевести на сборку
- `orders_dbw.DBWAPIService.ApiV3DbwOrdersOrderIdMetaDelete` — `DELETE /api/v3/dbw/orders/{orderId}/meta` — Удалить метаданные сборочного задания
- `orders_dbw.DBWAPIService.ApiV3DbwOrdersOrderIdMetaGet` — `GET /api/v3/dbw/orders/{orderId}/meta` — Получить метаданные сборочного задания
- `orders_dbw.DBWAPIService.ApiV3DbwOrdersOrderIdMetaGtinPut` — `PUT /api/v3/dbw/orders/{orderId}/meta/gtin` — Закрепить за сборочным заданием GTIN
- `orders_dbw.DBWAPIService.ApiV3DbwOrdersOrderIdMetaImeiPut` — `PUT /api/v3/dbw/orders/{orderId}/meta/imei` — Закрепить за сборочным заданием IMEI
- `orders_dbw.DBWAPIService.ApiV3DbwOrdersOrderIdMetaSgtinPut` — `PUT /api/v3/dbw/orders/{orderId}/meta/sgtin` — Закрепить за сборочным заданием код маркировки товара
- `orders_dbw.DBWAPIService.ApiV3DbwOrdersOrderIdMetaUinPut` — `PUT /api/v3/dbw/orders/{orderId}/meta/uin` — Закрепить за сборочным заданием УИН (уникальный идентификационный номер)
- `orders_dbw.DBWAPIService.ApiV3DbwOrdersStatusPost` — `POST /api/v3/dbw/orders/status` — Получить статусы сборочных заданий
- `orders_dbw.DBWAPIService.ApiV3DbwOrdersStickersPost` — `POST /api/v3/dbw/orders/stickers` — Получить стикеры сборочных заданий

### orders_dbs (`orders_dbs`)
- `orders_dbs.DBSAPIService.ApiV3DbsGroupsInfoPost` — `POST /api/v3/dbs/groups/info` — Получить информацию о платной доставке
- `orders_dbs.DBSAPIService.ApiV3DbsOrdersClientPost` — `POST /api/v3/dbs/orders/client` — Информация о покупателе
- `orders_dbs.DBSAPIService.ApiV3DbsOrdersDeliveryDatePost` — `POST /api/v3/dbs/orders/delivery-date` — Дата и время доставки
- `orders_dbs.DBSAPIService.ApiV3DbsOrdersGet` — `GET /api/v3/dbs/orders` — Получить информацию о завершенных сборочных заданиях
- `orders_dbs.DBSAPIService.ApiV3DbsOrdersNewGet` — `GET /api/v3/dbs/orders/new` — Получить список новых сборочных заданий
- `orders_dbs.DBSAPIService.ApiV3DbsOrdersOrderIdCancelPatch` — `PATCH /api/v3/dbs/orders/{orderId}/cancel` — Отменить сборочное задание
- `orders_dbs.DBSAPIService.ApiV3DbsOrdersOrderIdConfirmPatch` — `PATCH /api/v3/dbs/orders/{orderId}/confirm` — Перевести на сборку
- `orders_dbs.DBSAPIService.ApiV3DbsOrdersOrderIdDeliverPatch` — `PATCH /api/v3/dbs/orders/{orderId}/deliver` — Перевести в доставку
- `orders_dbs.DBSAPIService.ApiV3DbsOrdersOrderIdMetaDelete` — `DELETE /api/v3/dbs/orders/{orderId}/meta` — Удалить метаданные сборочного задания
- `orders_dbs.DBSAPIService.ApiV3DbsOrdersOrderIdMetaGet` — `GET /api/v3/dbs/orders/{orderId}/meta` — Получить метаданные сборочного задания
- `orders_dbs.DBSAPIService.ApiV3DbsOrdersOrderIdMetaGtinPut` — `PUT /api/v3/dbs/orders/{orderId}/meta/gtin` — Закрепить за сборочным заданием GTIN
- `orders_dbs.DBSAPIService.ApiV3DbsOrdersOrderIdMetaImeiPut` — `PUT /api/v3/dbs/orders/{orderId}/meta/imei` — Закрепить за сборочным заданием IMEI
- `orders_dbs.DBSAPIService.ApiV3DbsOrdersOrderIdMetaSgtinPut` — `PUT /api/v3/dbs/orders/{orderId}/meta/sgtin` — Закрепить за сборочным заданием код маркировки товара
- `orders_dbs.DBSAPIService.ApiV3DbsOrdersOrderIdMetaUinPut` — `PUT /api/v3/dbs/orders/{orderId}/meta/uin` — Закрепить за сборочным заданием УИН (уникальный идентификационный номер)
- `orders_dbs.DBSAPIService.ApiV3DbsOrdersOrderIdReceivePatch` — `PATCH /api/v3/dbs/orders/{orderId}/receive` — Сообщить, что заказ принят покупателем
- `orders_dbs.DBSAPIService.ApiV3DbsOrdersOrderIdRejectPatch` — `PATCH /api/v3/dbs/orders/{orderId}/reject` — Сообщить, что покупатель отказался от заказа
- `orders_dbs.DBSAPIService.ApiV3DbsOrdersStatusPost` — `POST /api/v3/dbs/orders/status` — Получить статусы сборочных заданий

### in_store_pickup (`in_store_pickup`)
- `in_store_pickup.DefaultApiService.ApiV3ClickCollectOrdersClientIdentityPost` — `POST /api/v3/click-collect/orders/client/identity` — Проверить, что заказ принадлежит покупателю
- `in_store_pickup.DefaultApiService.ApiV3ClickCollectOrdersClientPost` — `POST /api/v3/click-collect/orders/client` — Информация о покупателе
- `in_store_pickup.DefaultApiService.ApiV3ClickCollectOrdersGet` — `GET /api/v3/click-collect/orders` — Получить информацию о завершённых сборочных заданиях
- `in_store_pickup.DefaultApiService.ApiV3ClickCollectOrdersNewGet` — `GET /api/v3/click-collect/orders/new` — Получить список новых сборочных заданий
- `in_store_pickup.DefaultApiService.ApiV3ClickCollectOrdersOrderIdCancelPatch` — `PATCH /api/v3/click-collect/orders/{orderId}/cancel` — Отменить сборочное задание
- `in_store_pickup.DefaultApiService.ApiV3ClickCollectOrdersOrderIdConfirmPatch` — `PATCH /api/v3/click-collect/orders/{orderId}/confirm` — Перевести на сборку
- `in_store_pickup.DefaultApiService.ApiV3ClickCollectOrdersOrderIdMetaDelete` — `DELETE /api/v3/click-collect/orders/{orderId}/meta` — Удалить метаданные сборочного задания
- `in_store_pickup.DefaultApiService.ApiV3ClickCollectOrdersOrderIdMetaGet` — `GET /api/v3/click-collect/orders/{orderId}/meta` — Получить метаданные сборочного задания
- `in_store_pickup.DefaultApiService.ApiV3ClickCollectOrdersOrderIdMetaGtinPut` — `PUT /api/v3/click-collect/orders/{orderId}/meta/gtin` — Закрепить за сборочным заданием GTIN
- `in_store_pickup.DefaultApiService.ApiV3ClickCollectOrdersOrderIdMetaImeiPut` — `PUT /api/v3/click-collect/orders/{orderId}/meta/imei` — Закрепить за сборочным заданием IMEI
- `in_store_pickup.DefaultApiService.ApiV3ClickCollectOrdersOrderIdMetaSgtinPut` — `PUT /api/v3/click-collect/orders/{orderId}/meta/sgtin` — Закрепить за сборочным заданием код маркировки товара
- `in_store_pickup.DefaultApiService.ApiV3ClickCollectOrdersOrderIdMetaUinPut` — `PUT /api/v3/click-collect/orders/{orderId}/meta/uin` — Закрепить за сборочным заданием УИН (уникальный идентификационный номер)
- `in_store_pickup.DefaultApiService.ApiV3ClickCollectOrdersOrderIdPreparePatch` — `PATCH /api/v3/click-collect/orders/{orderId}/prepare` — Сообщить, что сборочное задание готово к выдаче
- `in_store_pickup.DefaultApiService.ApiV3ClickCollectOrdersOrderIdReceivePatch` — `PATCH /api/v3/click-collect/orders/{orderId}/receive` — Сообщить, что заказ принят покупателем
- `in_store_pickup.DefaultApiService.ApiV3ClickCollectOrdersOrderIdRejectPatch` — `PATCH /api/v3/click-collect/orders/{orderId}/reject` — Сообщить, что покупатель отказался от заказа
- `in_store_pickup.DefaultApiService.ApiV3ClickCollectOrdersStatusPost` — `POST /api/v3/click-collect/orders/status` — Получить статусы сборочных заданий

### orders_fbw (`orders_fbw`)
- `orders_fbw.DefaultApiService.ApiV1AcceptanceCoefficientsGet` — `GET /api/v1/acceptance/coefficients` — Коэффициенты приёмки
- `orders_fbw.DefaultApiService.ApiV1AcceptanceOptionsPost` — `POST /api/v1/acceptance/options` — Опции приёмки
- `orders_fbw.DefaultApiService.ApiV1SuppliesIDGet` — `GET /api/v1/supplies/{ID}` — Детали поставки
- `orders_fbw.DefaultApiService.ApiV1SuppliesIDGoodsGet` — `GET /api/v1/supplies/{ID}/goods` — Товары поставки
- `orders_fbw.DefaultApiService.ApiV1SuppliesIDPackageGet` — `GET /api/v1/supplies/{ID}/package` — Упаковка поставки
- `orders_fbw.DefaultApiService.ApiV1SuppliesPost` — `POST /api/v1/supplies` — Список поставок
- `orders_fbw.DefaultApiService.ApiV1TransitTariffsGet` — `GET /api/v1/transit-tariffs` — Транзитные направления
- `orders_fbw.DefaultApiService.ApiV1WarehousesGet` — `GET /api/v1/warehouses` — Список складов

### promotion (`promotion`)
- `promotion.DefaultApiService.AdvV0AuctionAdvertsGet` — `GET /adv/v0/auction/adverts` — Информация о кампаниях с ручной ставкой
- `promotion.DefaultApiService.AdvV0AuctionBidsPatch` — `PATCH /adv/v0/auction/bids` — Изменение ставок в кампаниях
- `promotion.DefaultApiService.AdvV0AuctionNmsPatch` — `PATCH /adv/v0/auction/nms` — Изменение списка карточек товаров в кампаниях
- `promotion.DefaultApiService.AdvV0AuctionPlacementsPut` — `PUT /adv/v0/auction/placements` — Изменение мест размещения в кампаниях с ручной ставкой
- `promotion.DefaultApiService.AdvV0BidsMinPost` — `POST /adv/v0/bids/min` — Минимальные ставки для карточек товаров
- `promotion.DefaultApiService.AdvV0BidsPatch` — `PATCH /adv/v0/bids` — Изменение ставок
- `promotion.DefaultApiService.AdvV0ConfigGet` — `GET /adv/v0/config` — Конфигурационные значения Продвижения
- `promotion.DefaultApiService.AdvV0DeleteGet` — `GET /adv/v0/delete` — Удаление кампании
- `promotion.DefaultApiService.AdvV0NormqueryBidsDelete` — `DELETE /adv/v0/normquery/bids` — Удалить ставки поисковых кластеров
- `promotion.DefaultApiService.AdvV0NormqueryBidsPost` — `POST /adv/v0/normquery/bids` — Установить ставки для поисковых кластеров
- `promotion.DefaultApiService.AdvV0NormqueryGetBidsPost` — `POST /adv/v0/normquery/get-bids` — Список ставок поисковых кластеров
- `promotion.DefaultApiService.AdvV0NormqueryGetMinusPost` — `POST /adv/v0/normquery/get-minus` — Список минус-фраз кампаний
- `promotion.DefaultApiService.AdvV0NormquerySetMinusPost` — `POST /adv/v0/normquery/set-minus` — Установка и удаление минус-фраз
- `promotion.DefaultApiService.AdvV0NormqueryStatsPost` — `POST /adv/v0/normquery/stats` — Статистика поисковых кластеров
- `promotion.DefaultApiService.AdvV0PauseGet` — `GET /adv/v0/pause` — Пауза кампании
- `promotion.DefaultApiService.AdvV0RenamePost` — `POST /adv/v0/rename` — Переименование кампании
- `promotion.DefaultApiService.AdvV0StartGet` — `GET /adv/v0/start` — Запуск кампании
- `promotion.DefaultApiService.AdvV0StatsKeywordsGet` — `GET /adv/v0/stats/keywords` — Статистика по ключевым фразам
- `promotion.DefaultApiService.AdvV0StopGet` — `GET /adv/v0/stop` — Завершение кампании
- `promotion.DefaultApiService.AdvV1AdvertGet` — `GET /adv/v1/advert` — Информация о медиакампании
- `promotion.DefaultApiService.AdvV1AdvertsGet` — `GET /adv/v1/adverts` — Список медиакампаний
- `promotion.DefaultApiService.AdvV1AutoGetnmtoaddGet` — `GET /adv/v1/auto/getnmtoadd` — Список карточек товаров для кампании с единой ставкой
- `promotion.DefaultApiService.AdvV1AutoSetExcludedPost` — `POST /adv/v1/auto/set-excluded` — Установка/удаление минус-фраз для кампании с единой ставкой
- `promotion.DefaultApiService.AdvV1AutoUpdatenmPost` — `POST /adv/v1/auto/updatenm` — Изменение списка карточек товаров в кампании с единой ставкой
- `promotion.DefaultApiService.AdvV1BalanceGet` — `GET /adv/v1/balance` — Баланс
- `promotion.DefaultApiService.AdvV1BudgetDepositPost` — `POST /adv/v1/budget/deposit` — Пополнение бюджета кампании
- `promotion.DefaultApiService.AdvV1BudgetGet` — `GET /adv/v1/budget` — Бюджет кампании
- `promotion.DefaultApiService.AdvV1CountGet` — `GET /adv/v1/count` — Количество медиакампаний
- `promotion.DefaultApiService.AdvV1PaymentsGet` — `GET /adv/v1/payments` — Получение истории пополнений счёта
- `promotion.DefaultApiService.AdvV1PromotionAdvertsPost` — `POST /adv/v1/promotion/adverts` — Информация о кампаниях
- `promotion.DefaultApiService.AdvV1PromotionCountGet` — `GET /adv/v1/promotion/count` — Списки кампаний
- `promotion.DefaultApiService.AdvV1SearchSetExcludedPost` — `POST /adv/v1/search/set-excluded` — Установка/удаление минус-фраз в поиске
- `promotion.DefaultApiService.AdvV1SearchSetPlusGet` — `GET /adv/v1/search/set-plus` — Управление активностью фиксированных фраз
- `promotion.DefaultApiService.AdvV1SearchSetPlusPost` — `POST /adv/v1/search/set-plus` — Установка/удаление фиксированных фраз
- `promotion.DefaultApiService.AdvV1StatWordsGet` — `GET /adv/v1/stat/words` — Статистика кампании c ручной ставкой по ключевым фразам
- `promotion.DefaultApiService.AdvV1StatsPost` — `POST /adv/v1/stats` — Статистика медиакампаний
- `promotion.DefaultApiService.AdvV1SupplierSubjectsGet` — `GET /adv/v1/supplier/subjects` — Предметы для кампаний
- `promotion.DefaultApiService.AdvV1UpdGet` — `GET /adv/v1/upd` — Получение истории затрат
- `promotion.DefaultApiService.AdvV2AutoStatWordsGet` — `GET /adv/v2/auto/stat-words` — Статистика кампании с единой ставкой по кластерам фраз
- `promotion.DefaultApiService.AdvV2FullstatsPost` — `POST /adv/v2/fullstats` — Статистика кампаний
- `promotion.DefaultApiService.AdvV2SeacatSaveAdPost` — `POST /adv/v2/seacat/save-ad` — Создать кампанию
- `promotion.DefaultApiService.AdvV2SupplierNmsPost` — `POST /adv/v2/supplier/nms` — Карточки товаров для кампаний
- `promotion.DefaultApiService.AdvV3FullstatsGet` — `GET /adv/v3/fullstats` — Статистика кампаний
- `promotion.DefaultApiService.ApiAdvertV1BidsMinPost` — `POST /api/advert/v1/bids/min` — Минимальные ставки для карточек товаров
- `promotion.DefaultApiService.ApiAdvertV1BidsPatch` — `PATCH /api/advert/v1/bids` — Изменение ставок в кампаниях
- `promotion.DefaultApiService.ApiAdvertV2AdvertsGet` — `GET /api/advert/v2/adverts` — Информация о кампаниях
- `promotion.DefaultApiService.ApiV1CalendarPromotionsDetailsGet` — `GET /api/v1/calendar/promotions/details` — Детальная информация об акциях
- `promotion.DefaultApiService.ApiV1CalendarPromotionsGet` — `GET /api/v1/calendar/promotions` — Список акций
- `promotion.DefaultApiService.ApiV1CalendarPromotionsNomenclaturesGet` — `GET /api/v1/calendar/promotions/nomenclatures` — Список товаров для участия в акции
- `promotion.DefaultApiService.ApiV1CalendarPromotionsUploadPost` — `POST /api/v1/calendar/promotions/upload` — Добавить товар в акцию

### communications (`communications`)
- `communications.DefaultApiService.ApiFeedbacksV1PinsCountGet` — `GET /api/feedbacks/v1/pins/count` — Количество закреплённых и откреплённых отзывов
- `communications.DefaultApiService.ApiFeedbacksV1PinsDelete` — `DELETE /api/feedbacks/v1/pins` — Открепить отзывы
- `communications.DefaultApiService.ApiFeedbacksV1PinsGet` — `GET /api/feedbacks/v1/pins` — Список закреплённых и откреплённых отзывов
- `communications.DefaultApiService.ApiFeedbacksV1PinsLimitsGet` — `GET /api/feedbacks/v1/pins/limits` — Лимиты закреплённых отзывов
- `communications.DefaultApiService.ApiFeedbacksV1PinsPost` — `POST /api/feedbacks/v1/pins` — Закрепить отзывы
- `communications.DefaultApiService.ApiV1ClaimPatch` — `PATCH /api/v1/claim` — Ответ на заявку покупателя
- `communications.DefaultApiService.ApiV1ClaimsGet` — `GET /api/v1/claims` — Заявки покупателей на возврат
- `communications.DefaultApiService.ApiV1FeedbackGet` — `GET /api/v1/feedback` — Получить отзыв по ID
- `communications.DefaultApiService.ApiV1FeedbacksAnswerPatch` — `PATCH /api/v1/feedbacks/answer` — Отредактировать ответ на отзыв
- `communications.DefaultApiService.ApiV1FeedbacksAnswerPost` — `POST /api/v1/feedbacks/answer` — Ответить на отзыв
- `communications.DefaultApiService.ApiV1FeedbacksArchiveGet` — `GET /api/v1/feedbacks/archive` — Список архивных отзывов
- `communications.DefaultApiService.ApiV1FeedbacksCountGet` — `GET /api/v1/feedbacks/count` — Количество отзывов
- `communications.DefaultApiService.ApiV1FeedbacksCountUnansweredGet` — `GET /api/v1/feedbacks/count-unanswered` — Необработанные отзывы
- `communications.DefaultApiService.ApiV1FeedbacksGet` — `GET /api/v1/feedbacks` — Список отзывов
- `communications.DefaultApiService.ApiV1FeedbacksOrderReturnPost` — `POST /api/v1/feedbacks/order/return` — Возврат товара по ID отзыва
- `communications.DefaultApiService.ApiV1NewFeedbacksQuestionsGet` — `GET /api/v1/new-feedbacks-questions` — Непросмотренные отзывы и вопросы
- `communications.DefaultApiService.ApiV1QuestionGet` — `GET /api/v1/question` — Получить вопрос по ID
- `communications.DefaultApiService.ApiV1QuestionsCountGet` — `GET /api/v1/questions/count` — Количество вопросов
- `communications.DefaultApiService.ApiV1QuestionsCountUnansweredGet` — `GET /api/v1/questions/count-unanswered` — Неотвеченные вопросы
- `communications.DefaultApiService.ApiV1QuestionsGet` — `GET /api/v1/questions` — Список вопросов
- `communications.DefaultApiService.ApiV1QuestionsPatch` — `PATCH /api/v1/questions` — Работа с вопросами
- `communications.DefaultApiService.ApiV1SellerChatsGet` — `GET /api/v1/seller/chats` — Список чатов
- `communications.DefaultApiService.ApiV1SellerDownloadIdGet` — `GET /api/v1/seller/download/{id}` — Получить файл из сообщения
- `communications.DefaultApiService.ApiV1SellerEventsGet` — `GET /api/v1/seller/events` — События чатов
- `communications.DefaultApiService.ApiV1SellerMessagePost` — `POST /api/v1/seller/message` — Отправить сообщение

### tariffs (`tariffs`)
- `tariffs.DefaultApiService.ApiTariffsV1AcceptanceCoefficientsGet` — `GET /api/tariffs/v1/acceptance/coefficients` — Тарифы на поставку
- `tariffs.DefaultApiService.ApiV1TariffsBoxGet` — `GET /api/v1/tariffs/box` — Тарифы для коробов
- `tariffs.DefaultApiService.ApiV1TariffsCommissionGet` — `GET /api/v1/tariffs/commission` — Комиссия по категориям товаров
- `tariffs.DefaultApiService.ApiV1TariffsPalletGet` — `GET /api/v1/tariffs/pallet` — Тарифы для монопаллет
- `tariffs.DefaultApiService.ApiV1TariffsReturnGet` — `GET /api/v1/tariffs/return` — Тарифы на возврат

### analytics (`analytics`)
- `analytics.DefaultApiService.ApiV2SearchReportProductOrdersPost` — `POST /api/v2/search-report/product/orders` — Заказы и позиции по поисковым запросам товара
- `analytics.DefaultApiService.ApiV2SearchReportProductSearchTextsPost` — `POST /api/v2/search-report/product/search-texts` — Поисковые запросы по товару
- `analytics.DefaultApiService.ApiV2SearchReportReportPost` — `POST /api/v2/search-report/report` — Основная страница
- `analytics.DefaultApiService.ApiV2SearchReportTableDetailsPost` — `POST /api/v2/search-report/table/details` — Пагинация по товарам в группе
- `analytics.DefaultApiService.ApiV2SearchReportTableGroupsPost` — `POST /api/v2/search-report/table/groups` — Пагинация по группам
- `analytics.DefaultApiService.ApiV2StocksReportOfficesPost` — `POST /api/v2/stocks-report/offices` — Данные по складам
- `analytics.DefaultApiService.ApiV2StocksReportProductsGroupsPost` — `POST /api/v2/stocks-report/products/groups` — Данные по группам
- `analytics.DefaultApiService.ApiV2StocksReportProductsProductsPost` — `POST /api/v2/stocks-report/products/products` — Данные по товарам
- `analytics.DefaultApiService.ApiV2StocksReportProductsSizesPost` — `POST /api/v2/stocks-report/products/sizes` — Данные по размерам
- `analytics.DefaultApiService.PostSalesFunnelGroupedHistory` — `POST /api/analytics/v3/sales-funnel/grouped/history` — Статистика групп карточек товаров по дням
- `analytics.DefaultApiService.PostSalesFunnelProducts` — `POST /api/analytics/v3/sales-funnel/products` — Статистика карточек товаров за период
- `analytics.DefaultApiService.PostSalesFunnelProductsHistory` — `POST /api/analytics/v3/sales-funnel/products/history` — Статистика карточек товаров по дням
- `analytics.CSVAPIService.ApiV2NmReportDownloadsFileDownloadIdGet` — `GET /api/v2/nm-report/downloads/file/{downloadId}` — Получить отчёт
- `analytics.CSVAPIService.ApiV2NmReportDownloadsGet` — `GET /api/v2/nm-report/downloads` — Получить список отчётов
- `analytics.CSVAPIService.ApiV2NmReportDownloadsPost` — `POST /api/v2/nm-report/downloads` — Создать отчёт
- `analytics.CSVAPIService.ApiV2NmReportDownloadsRetryPost` — `POST /api/v2/nm-report/downloads/retry` — Сгенерировать отчёт повторно

### reports (`reports`)
- `reports.DefaultApiService.ApiV1AcceptanceReportGet` — `GET /api/v1/acceptance_report` — Создать отчёт
- `reports.DefaultApiService.ApiV1AcceptanceReportTasksTaskIdDownloadGet` — `GET /api/v1/acceptance_report/tasks/{task_id}/download` — Получить отчёт
- `reports.DefaultApiService.ApiV1AcceptanceReportTasksTaskIdStatusGet` — `GET /api/v1/acceptance_report/tasks/{task_id}/status` — Проверить статус
- `reports.DefaultApiService.ApiV1AnalyticsAntifraudDetailsGet` — `GET /api/v1/analytics/antifraud-details` — Самовыкупы
- `reports.DefaultApiService.ApiV1AnalyticsBannedProductsBlockedGet` — `GET /api/v1/analytics/banned-products/blocked` — Заблокированные карточки
- `reports.DefaultApiService.ApiV1AnalyticsBannedProductsShadowedGet` — `GET /api/v1/analytics/banned-products/shadowed` — Скрытые из каталога
- `reports.DefaultApiService.ApiV1AnalyticsBrandShareBrandsGet` — `GET /api/v1/analytics/brand-share/brands` — Бренды продавца
- `reports.DefaultApiService.ApiV1AnalyticsBrandShareGet` — `GET /api/v1/analytics/brand-share` — Получить отчёт
- `reports.DefaultApiService.ApiV1AnalyticsBrandShareParentSubjectsGet` — `GET /api/v1/analytics/brand-share/parent-subjects` — Родительские категории бренда
- `reports.DefaultApiService.ApiV1AnalyticsCharacteristicsChangeGet` — `GET /api/v1/analytics/characteristics-change` — Смена характеристик
- `reports.DefaultApiService.ApiV1AnalyticsGoodsLabelingGet` — `GET /api/v1/analytics/goods-labeling` — Маркировка товара
- `reports.DefaultApiService.ApiV1AnalyticsGoodsReturnGet` — `GET /api/v1/analytics/goods-return` — Получить отчёт
- `reports.DefaultApiService.ApiV1AnalyticsIncorrectAttachmentsGet` — `GET /api/v1/analytics/incorrect-attachments` — Подмена товара
- `reports.DefaultApiService.ApiV1AnalyticsRegionSaleGet` — `GET /api/v1/analytics/region-sale` — Получить отчёт
- `reports.DefaultApiService.ApiV1AnalyticsWarehouseMeasurementsGet` — `GET /api/v1/analytics/warehouse-measurements` — Занижение габаритов упаковки
- `reports.DefaultApiService.ApiV1PaidStorageGet` — `GET /api/v1/paid_storage` — Создать отчёт
- `reports.DefaultApiService.ApiV1PaidStorageTasksTaskIdDownloadGet` — `GET /api/v1/paid_storage/tasks/{task_id}/download` — Получить отчёт
- `reports.DefaultApiService.ApiV1PaidStorageTasksTaskIdStatusGet` — `GET /api/v1/paid_storage/tasks/{task_id}/status` — Проверить статус
- `reports.DefaultApiService.ApiV1SupplierIncomesGet` — `GET /api/v1/supplier/incomes` — Поставки
- `reports.DefaultApiService.ApiV1SupplierOrdersGet` — `GET /api/v1/supplier/orders` — Заказы
- `reports.DefaultApiService.ApiV1SupplierSalesGet` — `GET /api/v1/supplier/sales` — Продажи
- `reports.DefaultApiService.ApiV1SupplierStocksGet` — `GET /api/v1/supplier/stocks` — Склады
- `reports.DefaultApiService.ApiV1WarehouseRemainsGet` — `GET /api/v1/warehouse_remains` — Создать отчёт
- `reports.DefaultApiService.ApiV1WarehouseRemainsTasksTaskIdDownloadGet` — `GET /api/v1/warehouse_remains/tasks/{task_id}/download` — Получить отчёт
- `reports.DefaultApiService.ApiV1WarehouseRemainsTasksTaskIdStatusGet` — `GET /api/v1/warehouse_remains/tasks/{task_id}/status` — Проверить статус
- `reports.DefaultApiService.GetDeductions` — `GET /api/analytics/v1/deductions` — Подмены и неверные вложения
- `reports.DefaultApiService.GetMeasurementPenalties` — `GET /api/analytics/v1/measurement-penalties` — Удержания за занижение габаритов упаковки
- `reports.DefaultApiService.GetWarehouseMeasurements` — `GET /api/analytics/v1/warehouse-measurements` — Замеры склада
- `reports.CAPIService.ApiV1AnalyticsExciseReportPost` — `POST /api/v1/analytics/excise-report` — Получить отчёт

### finances (`finances`)
- `finances.DefaultApiService.ApiV1AccountBalanceGet` — `GET /api/v1/account/balance` — Получить баланс продавца
- `finances.DefaultApiService.ApiV1DocumentsCategoriesGet` — `GET /api/v1/documents/categories` — Категории документов
- `finances.DefaultApiService.ApiV1DocumentsDownloadAllPost` — `POST /api/v1/documents/download/all` — Получить документы
- `finances.DefaultApiService.ApiV1DocumentsDownloadGet` — `GET /api/v1/documents/download` — Получить документ
- `finances.DefaultApiService.ApiV1DocumentsListGet` — `GET /api/v1/documents/list` — Список документов
- `finances.DefaultApiService.ApiV5SupplierReportDetailByPeriodGet` — `GET /api/v5/supplier/reportDetailByPeriod` — Отчёт о продажах по реализации

### wbd (`wbd`)
- `wbd.DefaultApiService.ContentAuthorGet` — `GET /api/v1/content/author` — Получить список своего контента
- `wbd.DefaultApiService.ContentDelete` — `POST /api/v1/content/delete` — Удалить контент
- `wbd.DefaultApiService.ContentDownloadGet` — `GET /api/v1/content/download/{uri}` — Скачать контент
- `wbd.DefaultApiService.ContentGallery` — `POST /api/v1/content/gallery` — Загрузить медиафайлы для предложения
- `wbd.DefaultApiService.ContentIdGet` — `GET /api/v1/content/author/{content_id}` — Получить информацию о контенте
- `wbd.DefaultApiService.ContentUpdate` — `POST /api/v1/content/author/{content_id}` — Редактировать контент
- `wbd.DefaultApiService.ContentUploadChunk` — `POST /api/v1/content/upload/chunk` — Загрузить контент (файл)
- `wbd.DefaultApiService.ContentUploadIllustration` — `POST /api/v1/content/illustration` — Загрузить обложку контента
- `wbd.DefaultApiService.ContentUploadInit` — `POST /api/v1/content/upload/init` — Инициализировать новый контент
- `wbd.DefaultApiService.DeleteKeysByIDs` — `DELETE /api/v1/keys-api/keys` — Удалить ключи активации
- `wbd.DefaultApiService.GetCatalog` — `GET /api/v1/catalog` — Получить категории и их подкатегории
- `wbd.DefaultApiService.GetRedeemedKeys` — `GET /api/v1/keys-api/keys/redeemed` — Получить купленные ключи
- `wbd.DefaultApiService.LoadKeys` — `POST /api/v1/keys-api/keys` — Добавить ключи активации
- `wbd.DefaultApiService.OfferCreate` — `POST /api/v1/offers` — Создать новое предложение
- `wbd.DefaultApiService.OfferGet` — `GET /api/v1/offers/{offer_id}` — Получить информацию о предложении
- `wbd.DefaultApiService.OfferKeysCountGet` — `GET /api/v1/offer/keys/{offer_id}` — Получить количество ключей для предложения
- `wbd.DefaultApiService.OfferKeysGet` — `GET /api/v1/offer/keys/{offer_id}/list` — Получить список ключей
- `wbd.DefaultApiService.OfferUpdate` — `POST /api/v1/offers/{offer_id}` — Редактировать предложение
- `wbd.DefaultApiService.OfferUpdatePrice` — `POST /api/v1/offer/price/{offer_id}` — Обновить цену
- `wbd.DefaultApiService.OfferUpdateStatus` — `POST /api/v1/offer/{offer_id}` — Обновить статус
- `wbd.DefaultApiService.OffersAuthorGet` — `GET /api/v1/offers/author` — Получить список своих предложений
- `wbd.DefaultApiService.OffersUploadThumbnail` — `POST /api/v1/offers/thumb` — Добавить или обновить обложку предложения
<!-- GO_METHODS_LIST_END -->
