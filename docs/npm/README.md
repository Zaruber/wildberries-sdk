# wildberries-sdk (npm)

Единый npm-пакет с клиентами Wildberries по всем спецификациям.

## Установка

```bash
npm install wildberries-sdk
```

## Пример (communications)

```ts
import { Configuration, DefaultApi } from "wildberries-sdk/communications";

async function main() {
  const config = new Configuration({
    basePath: "https://feedbacks-api.wildberries.ru",
    apiKey: "YOUR_TOKEN",
  });

  const api = new DefaultApi(config);
  const response = await api.apiV1FeedbacksGet({
    isAnswered: true,
    take: 100,
    skip: 0,
  });

  console.log(response);
}

main().catch(console.error);
```

<!-- NPM_METHODS_LIST_START -->
## Методы API

### general (`general`)
- `general.APIApi.apiCommunicationsV2NewsGet` — Получение новостей портала продавцов
- `general.DefaultApi.apiV1InvitePost` — Создать приглашение для нового пользователя
- `general.DefaultApi.apiV1SellerInfoGet` — Получение информации о продавце
- `general.DefaultApi.apiV1UserDelete` — Удалить пользователя
- `general.DefaultApi.apiV1UsersAccessPut` — Изменить права доступа пользователей
- `general.DefaultApi.apiV1UsersGet` — Получить список активных или приглашённых пользователей продавца
- `general.WBAPIApi.pingGet` — Проверка подключения

### products (`products`)
- `products.DefaultApi.apiContentV1BrandsGet` — Бренды
- `products.DefaultApi.apiV2BufferGoodsTaskGet` — Детализация необработанной загрузки
- `products.DefaultApi.apiV2BufferTasksGet` — Состояние необработанной загрузки
- `products.DefaultApi.apiV2HistoryGoodsTaskGet` — Детализация обработанной загрузки
- `products.DefaultApi.apiV2HistoryTasksGet` — Состояние обработанной загрузки
- `products.DefaultApi.apiV2ListGoodsFilterGet` — Получить товары с ценами
- `products.DefaultApi.apiV2ListGoodsFilterPost` — Получить товары с ценами по артикулам
- `products.DefaultApi.apiV2ListGoodsSizeNmGet` — Получить размеры товара с ценами
- `products.DefaultApi.apiV2QuarantineGoodsGet` — Получить товары в карантине
- `products.DefaultApi.apiV2UploadTaskClubDiscountPost` — Установить скидки WB Клуба
- `products.DefaultApi.apiV2UploadTaskPost` — Установить цены и скидки
- `products.DefaultApi.apiV2UploadTaskSizePost` — Установить цены для размеров
- `products.DefaultApi.apiV3DbwWarehousesWarehouseIdContactsGet` — Список контактов
- `products.DefaultApi.apiV3DbwWarehousesWarehouseIdContactsPut` — Обновить список контактов
- `products.DefaultApi.apiV3OfficesGet` — Получить список складов WB
- `products.DefaultApi.apiV3StocksWarehouseIdDelete` — Удалить остатки товаров
- `products.DefaultApi.apiV3StocksWarehouseIdPost` — Получить остатки товаров
- `products.DefaultApi.apiV3StocksWarehouseIdPut` — Обновить остатки товаров
- `products.DefaultApi.apiV3WarehousesGet` — Получить список складов продавца
- `products.DefaultApi.apiV3WarehousesPost` — Создать склад продавца
- `products.DefaultApi.apiV3WarehousesWarehouseIdDelete` — Удалить склад продавца
- `products.DefaultApi.apiV3WarehousesWarehouseIdPut` — Обновить склад продавца
- `products.DefaultApi.contentV2BarcodesPost` — Генерация баркодов
- `products.DefaultApi.contentV2CardsDeleteTrashPost` — Перенос карточек товаров в корзину
- `products.DefaultApi.contentV2CardsErrorListPost` — Список несозданных карточек товаров с ошибками
- `products.DefaultApi.contentV2CardsLimitsGet` — Лимиты карточек товаров
- `products.DefaultApi.contentV2CardsMoveNmPost` — Объединение и разъединение карточек товаров
- `products.DefaultApi.contentV2CardsRecoverPost` — Восстановление карточек товаров из корзины
- `products.DefaultApi.contentV2CardsUpdatePost` — Редактирование карточек товаров
- `products.DefaultApi.contentV2CardsUploadAddPost` — Создание карточек товаров с присоединением
- `products.DefaultApi.contentV2CardsUploadPost` — Создание карточек товаров
- `products.DefaultApi.contentV2DirectoryColorsGet` — Цвет
- `products.DefaultApi.contentV2DirectoryCountriesGet` — Страна производства
- `products.DefaultApi.contentV2DirectoryKindsGet` — Пол
- `products.DefaultApi.contentV2DirectorySeasonsGet` — Сезон
- `products.DefaultApi.contentV2DirectoryTnvedGet` — ТНВЭД-код
- `products.DefaultApi.contentV2DirectoryVatGet` — Ставка НДС
- `products.DefaultApi.contentV2GetCardsListPost` — Список карточек товаров
- `products.DefaultApi.contentV2GetCardsTrashPost` — Список карточек товаров в корзине
- `products.DefaultApi.contentV2ObjectAllGet` — Список предметов
- `products.DefaultApi.contentV2ObjectCharcsSubjectIdGet` — Характеристики предмета
- `products.DefaultApi.contentV2ObjectParentAllGet` — Родительские категории товаров
- `products.DefaultApi.contentV2TagIdDelete` — Удаление ярлыка
- `products.DefaultApi.contentV2TagIdPatch` — Изменение ярлыка
- `products.DefaultApi.contentV2TagNomenclatureLinkPost` — Управление ярлыками в карточке товара
- `products.DefaultApi.contentV2TagPost` — Создание ярлыка
- `products.DefaultApi.contentV2TagsGet` — Список ярлыков
- `products.DefaultApi.contentV3MediaFilePost` — Загрузить медиафайл
- `products.DefaultApi.contentV3MediaSavePost` — Загрузить медиафайлы по ссылкам

### orders_fbs (`orders_fbs`)
- `orders_fbs.FBSApi.apiMarketplaceV3OrdersMetaPost` — Получить метаданные сборочных заданий
- `orders_fbs.FBSApi.apiMarketplaceV3OrdersOrderIdMetaCustomsDeclarationPut` — Закрепить за сборочным заданием номер ГТД
- `orders_fbs.FBSApi.apiMarketplaceV3SuppliesSupplyIdOrderIdsGet` — Получить ID сборочных заданий поставки
- `orders_fbs.FBSApi.apiMarketplaceV3SuppliesSupplyIdOrdersPatch` — Добавить сборочные задания к поставке
- `orders_fbs.FBSApi.apiV3OrdersClientPost` — Заказы с информацией по клиенту
- `orders_fbs.FBSApi.apiV3OrdersGet` — Получить информацию о сборочных заданиях
- `orders_fbs.FBSApi.apiV3OrdersNewGet` — Получить список новых сборочных заданий
- `orders_fbs.FBSApi.apiV3OrdersOrderIdCancelPatch` — Отменить сборочное задание
- `orders_fbs.FBSApi.apiV3OrdersOrderIdMetaDelete` — Удалить метаданные сборочного задания
- `orders_fbs.FBSApi.apiV3OrdersOrderIdMetaExpirationPut` — Закрепить за сборочным заданием срок годности товара
- `orders_fbs.FBSApi.apiV3OrdersOrderIdMetaGtinPut` — Закрепить за сборочным заданием GTIN
- `orders_fbs.FBSApi.apiV3OrdersOrderIdMetaImeiPut` — Закрепить за сборочным заданием IMEI
- `orders_fbs.FBSApi.apiV3OrdersOrderIdMetaSgtinPut` — Закрепить за сборочным заданием код маркировки товара
- `orders_fbs.FBSApi.apiV3OrdersOrderIdMetaUinPut` — Закрепить за сборочным заданием УИН
- `orders_fbs.FBSApi.apiV3OrdersStatusHistoryPost` — История статусов для сборочных заданий кроссбордера
- `orders_fbs.FBSApi.apiV3OrdersStatusPost` — Получить статусы сборочных заданий
- `orders_fbs.FBSApi.apiV3OrdersStickersCrossBorderPost` — Получить стикеры сборочных заданий кроссбордера
- `orders_fbs.FBSApi.apiV3OrdersStickersPost` — Получить стикеры сборочных заданий
- `orders_fbs.FBSApi.apiV3PassesGet` — Получить список пропусков
- `orders_fbs.FBSApi.apiV3PassesOfficesGet` — Получить список складов, для которых требуется пропуск
- `orders_fbs.FBSApi.apiV3PassesPassIdDelete` — Удалить пропуск
- `orders_fbs.FBSApi.apiV3PassesPassIdPut` — Обновить пропуск
- `orders_fbs.FBSApi.apiV3PassesPost` — Создать пропуск
- `orders_fbs.FBSApi.apiV3SuppliesGet` — Получить список поставок
- `orders_fbs.FBSApi.apiV3SuppliesOrdersReshipmentGet` — Получить все сборочные задания для повторной отгрузки
- `orders_fbs.FBSApi.apiV3SuppliesPost` — Создать новую поставку
- `orders_fbs.FBSApi.apiV3SuppliesSupplyIdBarcodeGet` — Получить QR-код поставки
- `orders_fbs.FBSApi.apiV3SuppliesSupplyIdDelete` — Удалить поставку
- `orders_fbs.FBSApi.apiV3SuppliesSupplyIdDeliverPatch` — Передать поставку в доставку
- `orders_fbs.FBSApi.apiV3SuppliesSupplyIdGet` — Получить информацию о поставке
- `orders_fbs.FBSApi.apiV3SuppliesSupplyIdTrbxDelete` — Удалить короба из поставки
- `orders_fbs.FBSApi.apiV3SuppliesSupplyIdTrbxGet` — Получить список коробов поставки
- `orders_fbs.FBSApi.apiV3SuppliesSupplyIdTrbxPost` — Добавить короба к поставке
- `orders_fbs.FBSApi.apiV3SuppliesSupplyIdTrbxStickersPost` — Получить стикеры коробов поставки

### orders_dbw (`orders_dbw`)
- `orders_dbw.DBWApi.apiV3DbwOrdersCourierPost` — Информация о курьере
- `orders_dbw.DBWApi.apiV3DbwOrdersDeliveryDatePost` — Дата и время доставки
- `orders_dbw.DBWApi.apiV3DbwOrdersGet` — Получить информацию о завершенных сборочных заданиях
- `orders_dbw.DBWApi.apiV3DbwOrdersNewGet` — Получить список новых сборочных заданий
- `orders_dbw.DBWApi.apiV3DbwOrdersOrderIdAssemblePatch` — Перевести в доставку
- `orders_dbw.DBWApi.apiV3DbwOrdersOrderIdCancelPatch` — Отменить сборочное задание
- `orders_dbw.DBWApi.apiV3DbwOrdersOrderIdConfirmPatch` — Перевести на сборку
- `orders_dbw.DBWApi.apiV3DbwOrdersOrderIdMetaDelete` — Удалить метаданные сборочного задания
- `orders_dbw.DBWApi.apiV3DbwOrdersOrderIdMetaGet` — Получить метаданные сборочного задания
- `orders_dbw.DBWApi.apiV3DbwOrdersOrderIdMetaGtinPut` — Закрепить за сборочным заданием GTIN
- `orders_dbw.DBWApi.apiV3DbwOrdersOrderIdMetaImeiPut` — Закрепить за сборочным заданием IMEI
- `orders_dbw.DBWApi.apiV3DbwOrdersOrderIdMetaSgtinPut` — Закрепить за сборочным заданием код маркировки товара
- `orders_dbw.DBWApi.apiV3DbwOrdersOrderIdMetaUinPut` — Закрепить за сборочным заданием УИН (уникальный идентификационный номер)
- `orders_dbw.DBWApi.apiV3DbwOrdersStatusPost` — Получить статусы сборочных заданий
- `orders_dbw.DBWApi.apiV3DbwOrdersStickersPost` — Получить стикеры сборочных заданий

### orders_dbs (`orders_dbs`)
- `orders_dbs.DBSApi.apiMarketplaceV3DbsMetaCustomsDeclarationPost` — Закрепить за сборочными заданиями номер ГТД
- `orders_dbs.DBSApi.apiMarketplaceV3DbsOrdersMetaDeletePost` — Удалить метаданные сборочных заданий
- `orders_dbs.DBSApi.apiMarketplaceV3DbsOrdersMetaGtinPost` — Закрепить GTIN за сборочными заданиями
- `orders_dbs.DBSApi.apiMarketplaceV3DbsOrdersMetaImeiPost` — Закрепить IMEI за сборочными заданиями
- `orders_dbs.DBSApi.apiMarketplaceV3DbsOrdersMetaInfoPost` — Получить метаданные сборочных заданий
- `orders_dbs.DBSApi.apiMarketplaceV3DbsOrdersMetaSgtinPost` — Закрепить коды маркировки за сборочными заданиями
- `orders_dbs.DBSApi.apiMarketplaceV3DbsOrdersMetaUinPost` — Закрепить УИН за сборочными заданиями
- `orders_dbs.DBSApi.apiMarketplaceV3DbsOrdersStatusCancelPost` — Отменить сборочные задания
- `orders_dbs.DBSApi.apiMarketplaceV3DbsOrdersStatusConfirmPost` — Перевести сборочные задания на сборку
- `orders_dbs.DBSApi.apiMarketplaceV3DbsOrdersStatusDeliverPost` — Перевести сборочные задания в доставку
- `orders_dbs.DBSApi.apiMarketplaceV3DbsOrdersStatusInfoPost` — Получить статусы сборочных заданий
- `orders_dbs.DBSApi.apiMarketplaceV3DbsOrdersStatusReceivePost` — Сообщить о получении заказов
- `orders_dbs.DBSApi.apiMarketplaceV3DbsOrdersStatusRejectPost` — Сообщить об отказе от заказов
- `orders_dbs.DBSApi.apiV3DbsGroupsInfoPost` — Получить информацию о платной доставке
- `orders_dbs.DBSApi.apiV3DbsOrdersClientPost` — Информация о покупателе
- `orders_dbs.DBSApi.apiV3DbsOrdersDeliveryDatePost` — Дата и время доставки
- `orders_dbs.DBSApi.apiV3DbsOrdersGet` — Получить информацию о завершенных сборочных заданиях
- `orders_dbs.DBSApi.apiV3DbsOrdersNewGet` — Получить список новых сборочных заданий
- `orders_dbs.DBSApi.apiV3DbsOrdersOrderIdCancelPatch` — Отменить сборочное задание
- `orders_dbs.DBSApi.apiV3DbsOrdersOrderIdConfirmPatch` — Перевести на сборку
- `orders_dbs.DBSApi.apiV3DbsOrdersOrderIdDeliverPatch` — Перевести в доставку
- `orders_dbs.DBSApi.apiV3DbsOrdersOrderIdMetaDelete` — Удалить метаданные сборочного задания
- `orders_dbs.DBSApi.apiV3DbsOrdersOrderIdMetaGet` — Получить метаданные сборочного задания
- `orders_dbs.DBSApi.apiV3DbsOrdersOrderIdMetaGtinPut` — Закрепить за сборочным заданием GTIN
- `orders_dbs.DBSApi.apiV3DbsOrdersOrderIdMetaImeiPut` — Закрепить за сборочным заданием IMEI
- `orders_dbs.DBSApi.apiV3DbsOrdersOrderIdMetaSgtinPut` — Закрепить за сборочным заданием код маркировки товара
- `orders_dbs.DBSApi.apiV3DbsOrdersOrderIdMetaUinPut` — Закрепить за сборочным заданием УИН (уникальный идентификационный номер)
- `orders_dbs.DBSApi.apiV3DbsOrdersOrderIdReceivePatch` — Сообщить, что заказ принят покупателем
- `orders_dbs.DBSApi.apiV3DbsOrdersOrderIdRejectPatch` — Сообщить, что покупатель отказался от заказа
- `orders_dbs.DBSApi.apiV3DbsOrdersStatusPost` — Получить статусы сборочных заданий

### in_store_pickup (`in_store_pickup`)
- `in_store_pickup.DefaultApi.apiV3ClickCollectOrdersClientIdentityPost` — Проверить, что заказ принадлежит покупателю
- `in_store_pickup.DefaultApi.apiV3ClickCollectOrdersClientPost` — Информация о покупателе
- `in_store_pickup.DefaultApi.apiV3ClickCollectOrdersGet` — Получить информацию о завершённых сборочных заданиях
- `in_store_pickup.DefaultApi.apiV3ClickCollectOrdersNewGet` — Получить список новых сборочных заданий
- `in_store_pickup.DefaultApi.apiV3ClickCollectOrdersOrderIdCancelPatch` — Отменить сборочное задание
- `in_store_pickup.DefaultApi.apiV3ClickCollectOrdersOrderIdConfirmPatch` — Перевести на сборку
- `in_store_pickup.DefaultApi.apiV3ClickCollectOrdersOrderIdMetaDelete` — Удалить метаданные сборочного задания
- `in_store_pickup.DefaultApi.apiV3ClickCollectOrdersOrderIdMetaGet` — Получить метаданные сборочного задания
- `in_store_pickup.DefaultApi.apiV3ClickCollectOrdersOrderIdMetaGtinPut` — Закрепить за сборочным заданием GTIN
- `in_store_pickup.DefaultApi.apiV3ClickCollectOrdersOrderIdMetaImeiPut` — Закрепить за сборочным заданием IMEI
- `in_store_pickup.DefaultApi.apiV3ClickCollectOrdersOrderIdMetaSgtinPut` — Закрепить за сборочным заданием код маркировки товара
- `in_store_pickup.DefaultApi.apiV3ClickCollectOrdersOrderIdMetaUinPut` — Закрепить за сборочным заданием УИН (уникальный идентификационный номер)
- `in_store_pickup.DefaultApi.apiV3ClickCollectOrdersOrderIdPreparePatch` — Сообщить, что сборочное задание готово к выдаче
- `in_store_pickup.DefaultApi.apiV3ClickCollectOrdersOrderIdReceivePatch` — Сообщить, что заказ принят покупателем
- `in_store_pickup.DefaultApi.apiV3ClickCollectOrdersOrderIdRejectPatch` — Сообщить, что покупатель отказался от заказа
- `in_store_pickup.DefaultApi.apiV3ClickCollectOrdersStatusPost` — Получить статусы сборочных заданий

### orders_fbw (`orders_fbw`)
- `orders_fbw.DefaultApi.apiV1AcceptanceCoefficientsGet` — Коэффициенты приёмки
- `orders_fbw.DefaultApi.apiV1AcceptanceOptionsPost` — Опции приёмки
- `orders_fbw.DefaultApi.apiV1SuppliesIDGet` — Детали поставки
- `orders_fbw.DefaultApi.apiV1SuppliesIDGoodsGet` — Товары поставки
- `orders_fbw.DefaultApi.apiV1SuppliesIDPackageGet` — Упаковка поставки
- `orders_fbw.DefaultApi.apiV1SuppliesPost` — Список поставок
- `orders_fbw.DefaultApi.apiV1TransitTariffsGet` — Транзитные направления
- `orders_fbw.DefaultApi.apiV1WarehousesGet` — Список складов

### promotion (`promotion`)
- `promotion.DefaultApi.advV0AuctionAdvertsGet` — Информация о кампаниях с ручной ставкой
- `promotion.DefaultApi.advV0AuctionBidsPatch` — Изменение ставок в кампаниях
- `promotion.DefaultApi.advV0AuctionNmsPatch` — Изменение списка карточек товаров в кампаниях
- `promotion.DefaultApi.advV0AuctionPlacementsPut` — Изменение мест размещения в кампаниях с ручной ставкой
- `promotion.DefaultApi.advV0BidsMinPost` — Минимальные ставки для карточек товаров
- `promotion.DefaultApi.advV0BidsPatch` — Изменение ставок
- `promotion.DefaultApi.advV0ConfigGet` — Конфигурационные значения Продвижения
- `promotion.DefaultApi.advV0DeleteGet` — Удаление кампании
- `promotion.DefaultApi.advV0NormqueryBidsDelete` — Удалить ставки поисковых кластеров
- `promotion.DefaultApi.advV0NormqueryBidsPost` — Установить ставки для поисковых кластеров
- `promotion.DefaultApi.advV0NormqueryGetBidsPost` — Список ставок поисковых кластеров
- `promotion.DefaultApi.advV0NormqueryGetMinusPost` — Список минус-фраз кампаний
- `promotion.DefaultApi.advV0NormquerySetMinusPost` — Установка и удаление минус-фраз
- `promotion.DefaultApi.advV0NormqueryStatsPost` — Статистика поисковых кластеров
- `promotion.DefaultApi.advV0PauseGet` — Пауза кампании
- `promotion.DefaultApi.advV0RenamePost` — Переименование кампании
- `promotion.DefaultApi.advV0StartGet` — Запуск кампании
- `promotion.DefaultApi.advV0StatsKeywordsGet` — Статистика по ключевым фразам
- `promotion.DefaultApi.advV0StopGet` — Завершение кампании
- `promotion.DefaultApi.advV1AdvertGet` — Информация о медиакампании
- `promotion.DefaultApi.advV1AdvertsGet` — Список медиакампаний
- `promotion.DefaultApi.advV1AutoGetnmtoaddGet` — Список карточек товаров для кампании с единой ставкой
- `promotion.DefaultApi.advV1AutoSetExcludedPost` — Установка/удаление минус-фраз для кампании с единой ставкой
- `promotion.DefaultApi.advV1AutoUpdatenmPost` — Изменение списка карточек товаров в кампании с единой ставкой
- `promotion.DefaultApi.advV1BalanceGet` — Баланс
- `promotion.DefaultApi.advV1BudgetDepositPost` — Пополнение бюджета кампании
- `promotion.DefaultApi.advV1BudgetGet` — Бюджет кампании
- `promotion.DefaultApi.advV1CountGet` — Количество медиакампаний
- `promotion.DefaultApi.advV1PaymentsGet` — Получение истории пополнений счёта
- `promotion.DefaultApi.advV1PromotionAdvertsPost` — Информация о кампаниях
- `promotion.DefaultApi.advV1PromotionCountGet` — Списки кампаний
- `promotion.DefaultApi.advV1SearchSetExcludedPost` — Установка/удаление минус-фраз в поиске
- `promotion.DefaultApi.advV1SearchSetPlusGet` — Управление активностью фиксированных фраз
- `promotion.DefaultApi.advV1SearchSetPlusPost` — Установка/удаление фиксированных фраз
- `promotion.DefaultApi.advV1StatWordsGet` — Статистика кампании c ручной ставкой по ключевым фразам
- `promotion.DefaultApi.advV1StatsPost` — Статистика медиакампаний
- `promotion.DefaultApi.advV1SupplierSubjectsGet` — Предметы для кампаний
- `promotion.DefaultApi.advV1UpdGet` — Получение истории затрат
- `promotion.DefaultApi.advV2AutoStatWordsGet` — Статистика кампании с единой ставкой по кластерам фраз
- `promotion.DefaultApi.advV2FullstatsPost` — Статистика кампаний
- `promotion.DefaultApi.advV2SeacatSaveAdPost` — Создать кампанию
- `promotion.DefaultApi.advV2SupplierNmsPost` — Карточки товаров для кампаний
- `promotion.DefaultApi.advV3FullstatsGet` — Статистика кампаний
- `promotion.DefaultApi.apiAdvertV1BidsMinPost` — Минимальные ставки для карточек товаров
- `promotion.DefaultApi.apiAdvertV1BidsPatch` — Изменение ставок в кампаниях
- `promotion.DefaultApi.apiAdvertV2AdvertsGet` — Информация о кампаниях
- `promotion.DefaultApi.apiV1CalendarPromotionsDetailsGet` — Детальная информация об акциях
- `promotion.DefaultApi.apiV1CalendarPromotionsGet` — Список акций
- `promotion.DefaultApi.apiV1CalendarPromotionsNomenclaturesGet` — Список товаров для участия в акции
- `promotion.DefaultApi.apiV1CalendarPromotionsUploadPost` — Добавить товар в акцию

### communications (`communications`)
- `communications.DefaultApi.apiFeedbacksV1PinsCountGet` — Количество закреплённых и откреплённых отзывов
- `communications.DefaultApi.apiFeedbacksV1PinsDelete` — Открепить отзывы
- `communications.DefaultApi.apiFeedbacksV1PinsGet` — Список закреплённых и откреплённых отзывов
- `communications.DefaultApi.apiFeedbacksV1PinsLimitsGet` — Лимиты закреплённых отзывов
- `communications.DefaultApi.apiFeedbacksV1PinsPost` — Закрепить отзывы
- `communications.DefaultApi.apiV1ClaimPatch` — Ответ на заявку покупателя
- `communications.DefaultApi.apiV1ClaimsGet` — Заявки покупателей на возврат
- `communications.DefaultApi.apiV1FeedbackGet` — Получить отзыв по ID
- `communications.DefaultApi.apiV1FeedbacksAnswerPatch` — Отредактировать ответ на отзыв
- `communications.DefaultApi.apiV1FeedbacksAnswerPost` — Ответить на отзыв
- `communications.DefaultApi.apiV1FeedbacksArchiveGet` — Список архивных отзывов
- `communications.DefaultApi.apiV1FeedbacksCountGet` — Количество отзывов
- `communications.DefaultApi.apiV1FeedbacksCountUnansweredGet` — Необработанные отзывы
- `communications.DefaultApi.apiV1FeedbacksGet` — Список отзывов
- `communications.DefaultApi.apiV1FeedbacksOrderReturnPost` — Возврат товара по ID отзыва
- `communications.DefaultApi.apiV1NewFeedbacksQuestionsGet` — Непросмотренные отзывы и вопросы
- `communications.DefaultApi.apiV1QuestionGet` — Получить вопрос по ID
- `communications.DefaultApi.apiV1QuestionsCountGet` — Количество вопросов
- `communications.DefaultApi.apiV1QuestionsCountUnansweredGet` — Неотвеченные вопросы
- `communications.DefaultApi.apiV1QuestionsGet` — Список вопросов
- `communications.DefaultApi.apiV1QuestionsPatch` — Работа с вопросами
- `communications.DefaultApi.apiV1SellerChatsGet` — Список чатов
- `communications.DefaultApi.apiV1SellerDownloadIdGet` — Получить файл из сообщения
- `communications.DefaultApi.apiV1SellerEventsGet` — События чатов
- `communications.DefaultApi.apiV1SellerMessagePost` — Отправить сообщение

### tariffs (`tariffs`)
- `tariffs.DefaultApi.apiTariffsV1AcceptanceCoefficientsGet` — Тарифы на поставку
- `tariffs.DefaultApi.apiV1TariffsBoxGet` — Тарифы для коробов
- `tariffs.DefaultApi.apiV1TariffsCommissionGet` — Комиссия по категориям товаров
- `tariffs.DefaultApi.apiV1TariffsPalletGet` — Тарифы для монопаллет
- `tariffs.DefaultApi.apiV1TariffsReturnGet` — Тарифы на возврат

### analytics (`analytics`)
- `analytics.CSVApi.apiV2NmReportDownloadsFileDownloadIdGet` — Получить отчёт
- `analytics.CSVApi.apiV2NmReportDownloadsGet` — Получить список отчётов
- `analytics.CSVApi.apiV2NmReportDownloadsPost` — Создать отчёт
- `analytics.CSVApi.apiV2NmReportDownloadsRetryPost` — Сгенерировать отчёт повторно
- `analytics.DefaultApi.apiV2SearchReportProductOrdersPost` — Заказы и позиции по поисковым запросам товара
- `analytics.DefaultApi.apiV2SearchReportProductSearchTextsPost` — Поисковые запросы по товару
- `analytics.DefaultApi.apiV2SearchReportReportPost` — Основная страница
- `analytics.DefaultApi.apiV2SearchReportTableDetailsPost` — Пагинация по товарам в группе
- `analytics.DefaultApi.apiV2SearchReportTableGroupsPost` — Пагинация по группам
- `analytics.DefaultApi.apiV2StocksReportOfficesPost` — Данные по складам
- `analytics.DefaultApi.apiV2StocksReportProductsGroupsPost` — Данные по группам
- `analytics.DefaultApi.apiV2StocksReportProductsProductsPost` — Данные по товарам
- `analytics.DefaultApi.apiV2StocksReportProductsSizesPost` — Данные по размерам
- `analytics.DefaultApi.postSalesFunnelGroupedHistory` — Статистика групп карточек товаров по дням
- `analytics.DefaultApi.postSalesFunnelProducts` — Статистика карточек товаров за период
- `analytics.DefaultApi.postSalesFunnelProductsHistory` — Статистика карточек товаров по дням

### reports (`reports`)
- `reports.CApi.apiV1AnalyticsExciseReportPost` — Получить отчёт
- `reports.DefaultApi.apiV1AcceptanceReportGet` — Создать отчёт
- `reports.DefaultApi.apiV1AcceptanceReportTasksTaskIdDownloadGet` — Получить отчёт
- `reports.DefaultApi.apiV1AcceptanceReportTasksTaskIdStatusGet` — Проверить статус
- `reports.DefaultApi.apiV1AnalyticsAntifraudDetailsGet` — Самовыкупы
- `reports.DefaultApi.apiV1AnalyticsBannedProductsBlockedGet` — Заблокированные карточки
- `reports.DefaultApi.apiV1AnalyticsBannedProductsShadowedGet` — Скрытые из каталога
- `reports.DefaultApi.apiV1AnalyticsBrandShareBrandsGet` — Бренды продавца
- `reports.DefaultApi.apiV1AnalyticsBrandShareGet` — Получить отчёт
- `reports.DefaultApi.apiV1AnalyticsBrandShareParentSubjectsGet` — Родительские категории бренда
- `reports.DefaultApi.apiV1AnalyticsGoodsLabelingGet` — Маркировка товара
- `reports.DefaultApi.apiV1AnalyticsGoodsReturnGet` — Получить отчёт
- `reports.DefaultApi.apiV1AnalyticsRegionSaleGet` — Получить отчёт
- `reports.DefaultApi.apiV1PaidStorageGet` — Создать отчёт
- `reports.DefaultApi.apiV1PaidStorageTasksTaskIdDownloadGet` — Получить отчёт
- `reports.DefaultApi.apiV1PaidStorageTasksTaskIdStatusGet` — Проверить статус
- `reports.DefaultApi.apiV1SupplierIncomesGet` — Поставки
- `reports.DefaultApi.apiV1SupplierOrdersGet` — Заказы
- `reports.DefaultApi.apiV1SupplierSalesGet` — Продажи
- `reports.DefaultApi.apiV1SupplierStocksGet` — Склады
- `reports.DefaultApi.apiV1WarehouseRemainsGet` — Создать отчёт
- `reports.DefaultApi.apiV1WarehouseRemainsTasksTaskIdDownloadGet` — Получить отчёт
- `reports.DefaultApi.apiV1WarehouseRemainsTasksTaskIdStatusGet` — Проверить статус
- `reports.DefaultApi.getDeductions` — Подмены и неверные вложения
- `reports.DefaultApi.getMeasurementPenalties` — Удержания за занижение габаритов упаковки
- `reports.DefaultApi.getWarehouseMeasurements` — Замеры склада

### finances (`finances`)
- `finances.DefaultApi.apiV1AccountBalanceGet` — Получить баланс продавца
- `finances.DefaultApi.apiV1DocumentsCategoriesGet` — Категории документов
- `finances.DefaultApi.apiV1DocumentsDownloadAllPost` — Получить документы
- `finances.DefaultApi.apiV1DocumentsDownloadGet` — Получить документ
- `finances.DefaultApi.apiV1DocumentsListGet` — Список документов
- `finances.DefaultApi.apiV5SupplierReportDetailByPeriodGet` — Отчёт о продажах по реализации

### wbd (`wbd`)
- `wbd.DefaultApi.contentAuthorGet` — Получить список своего контента
- `wbd.DefaultApi.contentDelete` — Удалить контент
- `wbd.DefaultApi.contentDownloadGet` — Скачать контент
- `wbd.DefaultApi.contentGallery` — Загрузить медиафайлы для предложения
- `wbd.DefaultApi.contentIdGet` — Получить информацию о контенте
- `wbd.DefaultApi.contentUpdate` — Редактировать контент
- `wbd.DefaultApi.contentUploadChunk` — Загрузить контент (файл)
- `wbd.DefaultApi.contentUploadIllustration` — Загрузить обложку контента
- `wbd.DefaultApi.contentUploadInit` — Инициализировать новый контент
- `wbd.DefaultApi.deleteKeysByIDs` — Удалить ключи активации
- `wbd.DefaultApi.getCatalog` — Получить категории и их подкатегории
- `wbd.DefaultApi.getRedeemedKeys` — Получить купленные ключи
- `wbd.DefaultApi.loadKeys` — Добавить ключи активации
- `wbd.DefaultApi.offerCreate` — Создать новое предложение
- `wbd.DefaultApi.offerGet` — Получить информацию о предложении
- `wbd.DefaultApi.offerKeysCountGet` — Получить количество ключей для предложения
- `wbd.DefaultApi.offerKeysGet` — Получить список ключей
- `wbd.DefaultApi.offerUpdate` — Редактировать предложение
- `wbd.DefaultApi.offerUpdatePrice` — Обновить цену
- `wbd.DefaultApi.offerUpdateStatus` — Обновить статус
- `wbd.DefaultApi.offersAuthorGet` — Получить список своих предложений
- `wbd.DefaultApi.offersUploadThumbnail` — Добавить или обновить обложку предложения
<!-- NPM_METHODS_LIST_END -->
