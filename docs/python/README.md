# wildberries-sdk (Python)

## Установка

```bash
pip install wildberries-sdk
```

## Пример получения 100 неотвеченных отзывов (клиент - communications)

```python
import os
from wildberries_sdk import communications

token = os.getenv("WB_API_TOKEN")

api = communications.DefaultApi(
    communications.ApiClient(
        communications.Configuration(api_key={"HeaderApiKey": token})
    )
)
feedbacks = api.api_v1_feedbacks_get(is_answered=False, take=100, skip=0).data.feedbacks

print(feedbacks)
```

## Доступные клиенты

Импортируйте каждый клиент как `wildberries_sdk.<client>`:

- `wildberries_sdk.general`
- `wildberries_sdk.products`
- `wildberries_sdk.orders_fbs`
- `wildberries_sdk.orders_dbw`
- `wildberries_sdk.orders_dbs`
- `wildberries_sdk.in_store_pickup`
- `wildberries_sdk.orders_fbw`
- `wildberries_sdk.promotion`
- `wildberries_sdk.communications`
- `wildberries_sdk.tariffs`
- `wildberries_sdk.analytics`
- `wildberries_sdk.reports`
- `wildberries_sdk.finances`
- `wildberries_sdk.wbd`

<!-- PY_METHODS_LIST_START -->
## Методы API

### general (`general`)
- `general.DefaultApi.api_communications_v2_news_get` — `GET /api/communications/v2/news` — Получение новостей портала продавцов
- `general.DefaultApi.api_v1_invite_post` — `POST /api/v1/invite` — Создать приглашение для нового пользователя
- `general.DefaultApi.api_v1_seller_info_get` — `GET /api/v1/seller-info` — Получение информации о продавце
- `general.DefaultApi.api_v1_user_delete` — `DELETE /api/v1/user` — Удалить пользователя
- `general.DefaultApi.api_v1_users_access_put` — `PUT /api/v1/users/access` — Изменить права доступа пользователей
- `general.DefaultApi.api_v1_users_get` — `GET /api/v1/users` — Получить список активных или приглашённых пользователей продавца
- `general.DefaultApi.ping_get` — `GET /ping` — Проверка подключения

### products (`products`)
- `products.DefaultApi.api_content_v1_brands_get` — `GET /api/content/v1/brands` — Бренды
- `products.DefaultApi.api_v2_buffer_goods_task_get` — `GET /api/v2/buffer/goods/task` — Детализация необработанной загрузки
- `products.DefaultApi.api_v2_buffer_tasks_get` — `GET /api/v2/buffer/tasks` — Состояние необработанной загрузки
- `products.DefaultApi.api_v2_history_goods_task_get` — `GET /api/v2/history/goods/task` — Детализация обработанной загрузки
- `products.DefaultApi.api_v2_history_tasks_get` — `GET /api/v2/history/tasks` — Состояние обработанной загрузки
- `products.DefaultApi.api_v2_list_goods_filter_get` — `GET /api/v2/list/goods/filter` — Получить товары с ценами
- `products.DefaultApi.api_v2_list_goods_filter_post` — `POST /api/v2/list/goods/filter` — Получить товары с ценами по артикулам
- `products.DefaultApi.api_v2_list_goods_size_nm_get` — `GET /api/v2/list/goods/size/nm` — Получить размеры товара с ценами
- `products.DefaultApi.api_v2_quarantine_goods_get` — `GET /api/v2/quarantine/goods` — Получить товары в карантине
- `products.DefaultApi.api_v2_upload_task_club_discount_post` — `POST /api/v2/upload/task/club-discount` — Установить скидки WB Клуба
- `products.DefaultApi.api_v2_upload_task_post` — `POST /api/v2/upload/task` — Установить цены и скидки
- `products.DefaultApi.api_v2_upload_task_size_post` — `POST /api/v2/upload/task/size` — Установить цены для размеров
- `products.DefaultApi.api_v3_dbw_warehouses_warehouse_id_contacts_get` — `GET /api/v3/dbw/warehouses/{warehouseId}/contacts` — Список контактов
- `products.DefaultApi.api_v3_dbw_warehouses_warehouse_id_contacts_put` — `PUT /api/v3/dbw/warehouses/{warehouseId}/contacts` — Обновить список контактов
- `products.DefaultApi.api_v3_offices_get` — `GET /api/v3/offices` — Получить список складов WB
- `products.DefaultApi.api_v3_stocks_warehouse_id_delete` — `DELETE /api/v3/stocks/{warehouseId}` — Удалить остатки товаров
- `products.DefaultApi.api_v3_stocks_warehouse_id_post` — `POST /api/v3/stocks/{warehouseId}` — Получить остатки товаров
- `products.DefaultApi.api_v3_stocks_warehouse_id_put` — `PUT /api/v3/stocks/{warehouseId}` — Обновить остатки товаров
- `products.DefaultApi.api_v3_warehouses_get` — `GET /api/v3/warehouses` — Получить список складов продавца
- `products.DefaultApi.api_v3_warehouses_post` — `POST /api/v3/warehouses` — Создать склад продавца
- `products.DefaultApi.api_v3_warehouses_warehouse_id_delete` — `DELETE /api/v3/warehouses/{warehouseId}` — Удалить склад продавца
- `products.DefaultApi.api_v3_warehouses_warehouse_id_put` — `PUT /api/v3/warehouses/{warehouseId}` — Обновить склад продавца
- `products.DefaultApi.content_v2_barcodes_post` — `POST /content/v2/barcodes` — Генерация баркодов
- `products.DefaultApi.content_v2_cards_delete_trash_post` — `POST /content/v2/cards/delete/trash` — Перенос карточек товаров в корзину
- `products.DefaultApi.content_v2_cards_error_list_post` — `POST /content/v2/cards/error/list` — Список несозданных карточек товаров с ошибками
- `products.DefaultApi.content_v2_cards_limits_get` — `GET /content/v2/cards/limits` — Лимиты карточек товаров
- `products.DefaultApi.content_v2_cards_move_nm_post` — `POST /content/v2/cards/moveNm` — Объединение и разъединение карточек товаров
- `products.DefaultApi.content_v2_cards_recover_post` — `POST /content/v2/cards/recover` — Восстановление карточек товаров из корзины
- `products.DefaultApi.content_v2_cards_update_post` — `POST /content/v2/cards/update` — Редактирование карточек товаров
- `products.DefaultApi.content_v2_cards_upload_add_post` — `POST /content/v2/cards/upload/add` — Создание карточек товаров с присоединением
- `products.DefaultApi.content_v2_cards_upload_post` — `POST /content/v2/cards/upload` — Создание карточек товаров
- `products.DefaultApi.content_v2_directory_colors_get` — `GET /content/v2/directory/colors` — Цвет
- `products.DefaultApi.content_v2_directory_countries_get` — `GET /content/v2/directory/countries` — Страна производства
- `products.DefaultApi.content_v2_directory_kinds_get` — `GET /content/v2/directory/kinds` — Пол
- `products.DefaultApi.content_v2_directory_seasons_get` — `GET /content/v2/directory/seasons` — Сезон
- `products.DefaultApi.content_v2_directory_tnved_get` — `GET /content/v2/directory/tnved` — ТНВЭД-код
- `products.DefaultApi.content_v2_directory_vat_get` — `GET /content/v2/directory/vat` — Ставка НДС
- `products.DefaultApi.content_v2_get_cards_list_post` — `POST /content/v2/get/cards/list` — Список карточек товаров
- `products.DefaultApi.content_v2_get_cards_trash_post` — `POST /content/v2/get/cards/trash` — Список карточек товаров в корзине
- `products.DefaultApi.content_v2_object_all_get` — `GET /content/v2/object/all` — Список предметов
- `products.DefaultApi.content_v2_object_charcs_subject_id_get` — `GET /content/v2/object/charcs/{subjectId}` — Характеристики предмета
- `products.DefaultApi.content_v2_object_parent_all_get` — `GET /content/v2/object/parent/all` — Родительские категории товаров
- `products.DefaultApi.content_v2_tag_id_delete` — `DELETE /content/v2/tag/{id}` — Удаление ярлыка
- `products.DefaultApi.content_v2_tag_id_patch` — `PATCH /content/v2/tag/{id}` — Изменение ярлыка
- `products.DefaultApi.content_v2_tag_nomenclature_link_post` — `POST /content/v2/tag/nomenclature/link` — Управление ярлыками в карточке товара
- `products.DefaultApi.content_v2_tag_post` — `POST /content/v2/tag` — Создание ярлыка
- `products.DefaultApi.content_v2_tags_get` — `GET /content/v2/tags` — Список ярлыков
- `products.DefaultApi.content_v3_media_file_post` — `POST /content/v3/media/file` — Загрузить медиафайл
- `products.DefaultApi.content_v3_media_save_post` — `POST /content/v3/media/save` — Загрузить медиафайлы по ссылкам

### orders_fbs (`orders_fbs`)
- `orders_fbs.DefaultApi.api_marketplace_v3_orders_meta_post` — `POST /api/marketplace/v3/orders/meta` — Получить метаданные сборочных заданий
- `orders_fbs.DefaultApi.api_marketplace_v3_supplies_supply_id_order_ids_get` — `GET /api/marketplace/v3/supplies/{supplyId}/order-ids` — Получить ID сборочных заданий поставки
- `orders_fbs.DefaultApi.api_marketplace_v3_supplies_supply_id_orders_patch` — `PATCH /api/marketplace/v3/supplies/{supplyId}/orders` — Добавить сборочные задания к поставке
- `orders_fbs.DefaultApi.api_v3_orders_client_post` — `POST /api/v3/orders/client` — Заказы с информацией по клиенту
- `orders_fbs.DefaultApi.api_v3_orders_get` — `GET /api/v3/orders` — Получить информацию о сборочных заданиях
- `orders_fbs.DefaultApi.api_v3_orders_new_get` — `GET /api/v3/orders/new` — Получить список новых сборочных заданий
- `orders_fbs.DefaultApi.api_v3_orders_order_id_cancel_patch` — `PATCH /api/v3/orders/{orderId}/cancel` — Отменить сборочное задание
- `orders_fbs.DefaultApi.api_v3_orders_order_id_meta_delete` — `DELETE /api/v3/orders/{orderId}/meta` — Удалить метаданные сборочного задания
- `orders_fbs.DefaultApi.api_v3_orders_order_id_meta_expiration_put` — `PUT /api/v3/orders/{orderId}/meta/expiration` — Закрепить за сборочным заданием срок годности товара
- `orders_fbs.DefaultApi.api_v3_orders_order_id_meta_gtin_put` — `PUT /api/v3/orders/{orderId}/meta/gtin` — Закрепить за сборочным заданием GTIN
- `orders_fbs.DefaultApi.api_v3_orders_order_id_meta_imei_put` — `PUT /api/v3/orders/{orderId}/meta/imei` — Закрепить за сборочным заданием IMEI
- `orders_fbs.DefaultApi.api_v3_orders_order_id_meta_sgtin_put` — `PUT /api/v3/orders/{orderId}/meta/sgtin` — Закрепить за сборочным заданием код маркировки товара
- `orders_fbs.DefaultApi.api_v3_orders_order_id_meta_uin_put` — `PUT /api/v3/orders/{orderId}/meta/uin` — Закрепить за сборочным заданием УИН
- `orders_fbs.DefaultApi.api_v3_orders_status_history_post` — `POST /api/v3/orders/status/history` — История статусов для сборочных заданий кроссбордера
- `orders_fbs.DefaultApi.api_v3_orders_status_post` — `POST /api/v3/orders/status` — Получить статусы сборочных заданий
- `orders_fbs.DefaultApi.api_v3_orders_stickers_cross_border_post` — `POST /api/v3/orders/stickers/cross-border` — Получить стикеры сборочных заданий кроссбордера
- `orders_fbs.DefaultApi.api_v3_orders_stickers_post` — `POST /api/v3/orders/stickers` — Получить стикеры сборочных заданий
- `orders_fbs.DefaultApi.api_v3_passes_get` — `GET /api/v3/passes` — Получить список пропусков
- `orders_fbs.DefaultApi.api_v3_passes_offices_get` — `GET /api/v3/passes/offices` — Получить список складов, для которых требуется пропуск
- `orders_fbs.DefaultApi.api_v3_passes_pass_id_delete` — `DELETE /api/v3/passes/{passId}` — Удалить пропуск
- `orders_fbs.DefaultApi.api_v3_passes_pass_id_put` — `PUT /api/v3/passes/{passId}` — Обновить пропуск
- `orders_fbs.DefaultApi.api_v3_passes_post` — `POST /api/v3/passes` — Создать пропуск
- `orders_fbs.DefaultApi.api_v3_supplies_get` — `GET /api/v3/supplies` — Получить список поставок
- `orders_fbs.DefaultApi.api_v3_supplies_orders_reshipment_get` — `GET /api/v3/supplies/orders/reshipment` — Получить все сборочные задания для повторной отгрузки
- `orders_fbs.DefaultApi.api_v3_supplies_post` — `POST /api/v3/supplies` — Создать новую поставку
- `orders_fbs.DefaultApi.api_v3_supplies_supply_id_barcode_get` — `GET /api/v3/supplies/{supplyId}/barcode` — Получить QR-код поставки
- `orders_fbs.DefaultApi.api_v3_supplies_supply_id_delete` — `DELETE /api/v3/supplies/{supplyId}` — Удалить поставку
- `orders_fbs.DefaultApi.api_v3_supplies_supply_id_deliver_patch` — `PATCH /api/v3/supplies/{supplyId}/deliver` — Передать поставку в доставку
- `orders_fbs.DefaultApi.api_v3_supplies_supply_id_get` — `GET /api/v3/supplies/{supplyId}` — Получить информацию о поставке
- `orders_fbs.DefaultApi.api_v3_supplies_supply_id_orders_get` — `GET /api/v3/supplies/{supplyId}/orders` — (Deprecated) Получить сборочные задания в поставке
- `orders_fbs.DefaultApi.api_v3_supplies_supply_id_trbx_delete` — `DELETE /api/v3/supplies/{supplyId}/trbx` — Удалить короба из поставки
- `orders_fbs.DefaultApi.api_v3_supplies_supply_id_trbx_get` — `GET /api/v3/supplies/{supplyId}/trbx` — Получить список коробов поставки
- `orders_fbs.DefaultApi.api_v3_supplies_supply_id_trbx_post` — `POST /api/v3/supplies/{supplyId}/trbx` — Добавить короба к поставке
- `orders_fbs.DefaultApi.api_v3_supplies_supply_id_trbx_stickers_post` — `POST /api/v3/supplies/{supplyId}/trbx/stickers` — Получить стикеры коробов поставки

### orders_dbw (`orders_dbw`)
- `orders_dbw.DefaultApi.api_v3_dbw_orders_courier_post` — `POST /api/v3/dbw/orders/courier` — Информация о курьере
- `orders_dbw.DefaultApi.api_v3_dbw_orders_delivery_date_post` — `POST /api/v3/dbw/orders/delivery-date` — Дата и время доставки
- `orders_dbw.DefaultApi.api_v3_dbw_orders_get` — `GET /api/v3/dbw/orders` — Получить информацию о завершенных сборочных заданиях
- `orders_dbw.DefaultApi.api_v3_dbw_orders_new_get` — `GET /api/v3/dbw/orders/new` — Получить список новых сборочных заданий
- `orders_dbw.DefaultApi.api_v3_dbw_orders_order_id_assemble_patch` — `PATCH /api/v3/dbw/orders/{orderId}/assemble` — Перевести в доставку
- `orders_dbw.DefaultApi.api_v3_dbw_orders_order_id_cancel_patch` — `PATCH /api/v3/dbw/orders/{orderId}/cancel` — Отменить сборочное задание
- `orders_dbw.DefaultApi.api_v3_dbw_orders_order_id_confirm_patch` — `PATCH /api/v3/dbw/orders/{orderId}/confirm` — Перевести на сборку
- `orders_dbw.DefaultApi.api_v3_dbw_orders_order_id_meta_delete` — `DELETE /api/v3/dbw/orders/{orderId}/meta` — Удалить метаданные сборочного задания
- `orders_dbw.DefaultApi.api_v3_dbw_orders_order_id_meta_get` — `GET /api/v3/dbw/orders/{orderId}/meta` — Получить метаданные сборочного задания
- `orders_dbw.DefaultApi.api_v3_dbw_orders_order_id_meta_gtin_put` — `PUT /api/v3/dbw/orders/{orderId}/meta/gtin` — Закрепить за сборочным заданием GTIN
- `orders_dbw.DefaultApi.api_v3_dbw_orders_order_id_meta_imei_put` — `PUT /api/v3/dbw/orders/{orderId}/meta/imei` — Закрепить за сборочным заданием IMEI
- `orders_dbw.DefaultApi.api_v3_dbw_orders_order_id_meta_sgtin_put` — `PUT /api/v3/dbw/orders/{orderId}/meta/sgtin` — Закрепить за сборочным заданием код маркировки товара
- `orders_dbw.DefaultApi.api_v3_dbw_orders_order_id_meta_uin_put` — `PUT /api/v3/dbw/orders/{orderId}/meta/uin` — Закрепить за сборочным заданием УИН (уникальный идентификационный номер)
- `orders_dbw.DefaultApi.api_v3_dbw_orders_status_post` — `POST /api/v3/dbw/orders/status` — Получить статусы сборочных заданий
- `orders_dbw.DefaultApi.api_v3_dbw_orders_stickers_post` — `POST /api/v3/dbw/orders/stickers` — Получить стикеры сборочных заданий

### orders_dbs (`orders_dbs`)
- `orders_dbs.DefaultApi.api_v3_dbs_groups_info_post` — `POST /api/v3/dbs/groups/info` — Получить информацию о платной доставке
- `orders_dbs.DefaultApi.api_v3_dbs_orders_client_post` — `POST /api/v3/dbs/orders/client` — Информация о покупателе
- `orders_dbs.DefaultApi.api_v3_dbs_orders_delivery_date_post` — `POST /api/v3/dbs/orders/delivery-date` — Дата и время доставки
- `orders_dbs.DefaultApi.api_v3_dbs_orders_get` — `GET /api/v3/dbs/orders` — Получить информацию о завершенных сборочных заданиях
- `orders_dbs.DefaultApi.api_v3_dbs_orders_new_get` — `GET /api/v3/dbs/orders/new` — Получить список новых сборочных заданий
- `orders_dbs.DefaultApi.api_v3_dbs_orders_order_id_cancel_patch` — `PATCH /api/v3/dbs/orders/{orderId}/cancel` — Отменить сборочное задание
- `orders_dbs.DefaultApi.api_v3_dbs_orders_order_id_confirm_patch` — `PATCH /api/v3/dbs/orders/{orderId}/confirm` — Перевести на сборку
- `orders_dbs.DefaultApi.api_v3_dbs_orders_order_id_deliver_patch` — `PATCH /api/v3/dbs/orders/{orderId}/deliver` — Перевести в доставку
- `orders_dbs.DefaultApi.api_v3_dbs_orders_order_id_meta_delete` — `DELETE /api/v3/dbs/orders/{orderId}/meta` — Удалить метаданные сборочного задания
- `orders_dbs.DefaultApi.api_v3_dbs_orders_order_id_meta_get` — `GET /api/v3/dbs/orders/{orderId}/meta` — Получить метаданные сборочного задания
- `orders_dbs.DefaultApi.api_v3_dbs_orders_order_id_meta_gtin_put` — `PUT /api/v3/dbs/orders/{orderId}/meta/gtin` — Закрепить за сборочным заданием GTIN
- `orders_dbs.DefaultApi.api_v3_dbs_orders_order_id_meta_imei_put` — `PUT /api/v3/dbs/orders/{orderId}/meta/imei` — Закрепить за сборочным заданием IMEI
- `orders_dbs.DefaultApi.api_v3_dbs_orders_order_id_meta_sgtin_put` — `PUT /api/v3/dbs/orders/{orderId}/meta/sgtin` — Закрепить за сборочным заданием код маркировки товара
- `orders_dbs.DefaultApi.api_v3_dbs_orders_order_id_meta_uin_put` — `PUT /api/v3/dbs/orders/{orderId}/meta/uin` — Закрепить за сборочным заданием УИН (уникальный идентификационный номер)
- `orders_dbs.DefaultApi.api_v3_dbs_orders_order_id_receive_patch` — `PATCH /api/v3/dbs/orders/{orderId}/receive` — Сообщить, что заказ принят покупателем
- `orders_dbs.DefaultApi.api_v3_dbs_orders_order_id_reject_patch` — `PATCH /api/v3/dbs/orders/{orderId}/reject` — Сообщить, что покупатель отказался от заказа
- `orders_dbs.DefaultApi.api_v3_dbs_orders_status_post` — `POST /api/v3/dbs/orders/status` — Получить статусы сборочных заданий

### in_store_pickup (`in_store_pickup`)
- `in_store_pickup.DefaultApi.api_v3_click_collect_orders_client_identity_post` — `POST /api/v3/click-collect/orders/client/identity` — Проверить, что заказ принадлежит покупателю
- `in_store_pickup.DefaultApi.api_v3_click_collect_orders_client_post` — `POST /api/v3/click-collect/orders/client` — Информация о покупателе
- `in_store_pickup.DefaultApi.api_v3_click_collect_orders_get` — `GET /api/v3/click-collect/orders` — Получить информацию о завершённых сборочных заданиях
- `in_store_pickup.DefaultApi.api_v3_click_collect_orders_new_get` — `GET /api/v3/click-collect/orders/new` — Получить список новых сборочных заданий
- `in_store_pickup.DefaultApi.api_v3_click_collect_orders_order_id_cancel_patch` — `PATCH /api/v3/click-collect/orders/{orderId}/cancel` — Отменить сборочное задание
- `in_store_pickup.DefaultApi.api_v3_click_collect_orders_order_id_confirm_patch` — `PATCH /api/v3/click-collect/orders/{orderId}/confirm` — Перевести на сборку
- `in_store_pickup.DefaultApi.api_v3_click_collect_orders_order_id_meta_delete` — `DELETE /api/v3/click-collect/orders/{orderId}/meta` — Удалить метаданные сборочного задания
- `in_store_pickup.DefaultApi.api_v3_click_collect_orders_order_id_meta_get` — `GET /api/v3/click-collect/orders/{orderId}/meta` — Получить метаданные сборочного задания
- `in_store_pickup.DefaultApi.api_v3_click_collect_orders_order_id_meta_gtin_put` — `PUT /api/v3/click-collect/orders/{orderId}/meta/gtin` — Закрепить за сборочным заданием GTIN
- `in_store_pickup.DefaultApi.api_v3_click_collect_orders_order_id_meta_imei_put` — `PUT /api/v3/click-collect/orders/{orderId}/meta/imei` — Закрепить за сборочным заданием IMEI
- `in_store_pickup.DefaultApi.api_v3_click_collect_orders_order_id_meta_sgtin_put` — `PUT /api/v3/click-collect/orders/{orderId}/meta/sgtin` — Закрепить за сборочным заданием код маркировки товара
- `in_store_pickup.DefaultApi.api_v3_click_collect_orders_order_id_meta_uin_put` — `PUT /api/v3/click-collect/orders/{orderId}/meta/uin` — Закрепить за сборочным заданием УИН (уникальный идентификационный номер)
- `in_store_pickup.DefaultApi.api_v3_click_collect_orders_order_id_prepare_patch` — `PATCH /api/v3/click-collect/orders/{orderId}/prepare` — Сообщить, что сборочное задание готово к выдаче
- `in_store_pickup.DefaultApi.api_v3_click_collect_orders_order_id_receive_patch` — `PATCH /api/v3/click-collect/orders/{orderId}/receive` — Сообщить, что заказ принят покупателем
- `in_store_pickup.DefaultApi.api_v3_click_collect_orders_order_id_reject_patch` — `PATCH /api/v3/click-collect/orders/{orderId}/reject` — Сообщить, что покупатель отказался от заказа
- `in_store_pickup.DefaultApi.api_v3_click_collect_orders_status_post` — `POST /api/v3/click-collect/orders/status` — Получить статусы сборочных заданий

### orders_fbw (`orders_fbw`)
- `orders_fbw.DefaultApi.api_v1_acceptance_coefficients_get` — `GET /api/v1/acceptance/coefficients` — (Deprecated) Коэффициенты приёмки
- `orders_fbw.DefaultApi.api_v1_acceptance_options_post` — `POST /api/v1/acceptance/options` — Опции приёмки
- `orders_fbw.DefaultApi.api_v1_supplies_id_get` — `GET /api/v1/supplies/{ID}` — Детали поставки
- `orders_fbw.DefaultApi.api_v1_supplies_id_goods_get` — `GET /api/v1/supplies/{ID}/goods` — Товары поставки
- `orders_fbw.DefaultApi.api_v1_supplies_id_package_get` — `GET /api/v1/supplies/{ID}/package` — Упаковка поставки
- `orders_fbw.DefaultApi.api_v1_supplies_post` — `POST /api/v1/supplies` — Список поставок
- `orders_fbw.DefaultApi.api_v1_transit_tariffs_get` — `GET /api/v1/transit-tariffs` — Транзитные направления
- `orders_fbw.DefaultApi.api_v1_warehouses_get` — `GET /api/v1/warehouses` — Список складов

### promotion (`promotion`)
- `promotion.DefaultApi.adv_v0_auction_adverts_get` — `GET /adv/v0/auction/adverts` — (Deprecated) Информация о кампаниях с ручной ставкой
- `promotion.DefaultApi.adv_v0_auction_bids_patch` — `PATCH /adv/v0/auction/bids` — (Deprecated) Изменение ставок в кампаниях
- `promotion.DefaultApi.adv_v0_auction_nms_patch` — `PATCH /adv/v0/auction/nms` — Изменение списка карточек товаров в кампаниях
- `promotion.DefaultApi.adv_v0_auction_placements_put` — `PUT /adv/v0/auction/placements` — Изменение мест размещения в кампаниях с ручной ставкой
- `promotion.DefaultApi.adv_v0_bids_min_post` — `POST /adv/v0/bids/min` — (Deprecated) Минимальные ставки для карточек товаров
- `promotion.DefaultApi.adv_v0_bids_patch` — `PATCH /adv/v0/bids` — (Deprecated) Изменение ставок
- `promotion.DefaultApi.adv_v0_config_get` — `GET /adv/v0/config` — (Deprecated) Конфигурационные значения Продвижения
- `promotion.DefaultApi.adv_v0_delete_get` — `GET /adv/v0/delete` — Удаление кампании
- `promotion.DefaultApi.adv_v0_normquery_bids_delete` — `DELETE /adv/v0/normquery/bids` — Удалить ставки поисковых кластеров
- `promotion.DefaultApi.adv_v0_normquery_bids_post` — `POST /adv/v0/normquery/bids` — Установить ставки для поисковых кластеров
- `promotion.DefaultApi.adv_v0_normquery_get_bids_post` — `POST /adv/v0/normquery/get-bids` — Список ставок поисковых кластеров
- `promotion.DefaultApi.adv_v0_normquery_get_minus_post` — `POST /adv/v0/normquery/get-minus` — Список минус-фраз кампаний
- `promotion.DefaultApi.adv_v0_normquery_set_minus_post` — `POST /adv/v0/normquery/set-minus` — Установка и удаление минус-фраз
- `promotion.DefaultApi.adv_v0_normquery_stats_post` — `POST /adv/v0/normquery/stats` — Статистика поисковых кластеров
- `promotion.DefaultApi.adv_v0_pause_get` — `GET /adv/v0/pause` — Пауза кампании
- `promotion.DefaultApi.adv_v0_rename_post` — `POST /adv/v0/rename` — Переименование кампании
- `promotion.DefaultApi.adv_v0_start_get` — `GET /adv/v0/start` — Запуск кампании
- `promotion.DefaultApi.adv_v0_stats_keywords_get` — `GET /adv/v0/stats/keywords` — (Deprecated) Статистика по ключевым фразам
- `promotion.DefaultApi.adv_v0_stop_get` — `GET /adv/v0/stop` — Завершение кампании
- `promotion.DefaultApi.adv_v1_advert_get` — `GET /adv/v1/advert` — Информация о медиакампании
- `promotion.DefaultApi.adv_v1_adverts_get` — `GET /adv/v1/adverts` — Список медиакампаний
- `promotion.DefaultApi.adv_v1_auto_getnmtoadd_get` — `GET /adv/v1/auto/getnmtoadd` — (Deprecated) Список карточек товаров для кампании с единой ставкой
- `promotion.DefaultApi.adv_v1_auto_set_excluded_post` — `POST /adv/v1/auto/set-excluded` — (Deprecated) Установка/удаление минус-фраз для кампании с единой ставкой
- `promotion.DefaultApi.adv_v1_auto_updatenm_post` — `POST /adv/v1/auto/updatenm` — (Deprecated) Изменение списка карточек товаров в кампании с единой ставкой
- `promotion.DefaultApi.adv_v1_balance_get` — `GET /adv/v1/balance` — Баланс
- `promotion.DefaultApi.adv_v1_budget_deposit_post` — `POST /adv/v1/budget/deposit` — Пополнение бюджета кампании
- `promotion.DefaultApi.adv_v1_budget_get` — `GET /adv/v1/budget` — Бюджет кампании
- `promotion.DefaultApi.adv_v1_count_get` — `GET /adv/v1/count` — Количество медиакампаний
- `promotion.DefaultApi.adv_v1_payments_get` — `GET /adv/v1/payments` — Получение истории пополнений счёта
- `promotion.DefaultApi.adv_v1_promotion_adverts_post` — `POST /adv/v1/promotion/adverts` — (Deprecated) Информация о кампаниях
- `promotion.DefaultApi.adv_v1_promotion_count_get` — `GET /adv/v1/promotion/count` — Списки кампаний
- `promotion.DefaultApi.adv_v1_search_set_excluded_post` — `POST /adv/v1/search/set-excluded` — (Deprecated) Установка/удаление минус-фраз в поиске
- `promotion.DefaultApi.adv_v1_search_set_plus_get` — `GET /adv/v1/search/set-plus` — (Deprecated) Управление активностью фиксированных фраз
- `promotion.DefaultApi.adv_v1_search_set_plus_post` — `POST /adv/v1/search/set-plus` — (Deprecated) Установка/удаление фиксированных фраз
- `promotion.DefaultApi.adv_v1_stat_words_get` — `GET /adv/v1/stat/words` — (Deprecated) Статистика кампании c ручной ставкой по ключевым фразам
- `promotion.DefaultApi.adv_v1_stats_post` — `POST /adv/v1/stats` — Статистика медиакампаний
- `promotion.DefaultApi.adv_v1_supplier_subjects_get` — `GET /adv/v1/supplier/subjects` — Предметы для кампаний
- `promotion.DefaultApi.adv_v1_upd_get` — `GET /adv/v1/upd` — Получение истории затрат
- `promotion.DefaultApi.adv_v2_auto_stat_words_get` — `GET /adv/v2/auto/stat-words` — (Deprecated) Статистика кампании с единой ставкой по кластерам фраз
- `promotion.DefaultApi.adv_v2_fullstats_post` — `POST /adv/v2/fullstats` — (Deprecated) Статистика кампаний
- `promotion.DefaultApi.adv_v2_seacat_save_ad_post` — `POST /adv/v2/seacat/save-ad` — Создать кампанию
- `promotion.DefaultApi.adv_v2_supplier_nms_post` — `POST /adv/v2/supplier/nms` — Карточки товаров для кампаний
- `promotion.DefaultApi.adv_v3_fullstats_get` — `GET /adv/v3/fullstats` — Статистика кампаний
- `promotion.DefaultApi.api_advert_v1_bids_min_post` — `POST /api/advert/v1/bids/min` — Минимальные ставки для карточек товаров
- `promotion.DefaultApi.api_advert_v1_bids_patch` — `PATCH /api/advert/v1/bids` — Изменение ставок в кампаниях
- `promotion.DefaultApi.api_advert_v2_adverts_get` — `GET /api/advert/v2/adverts` — Информация о кампаниях
- `promotion.DefaultApi.api_v1_calendar_promotions_details_get` — `GET /api/v1/calendar/promotions/details` — Детальная информация об акциях
- `promotion.DefaultApi.api_v1_calendar_promotions_get` — `GET /api/v1/calendar/promotions` — Список акций
- `promotion.DefaultApi.api_v1_calendar_promotions_nomenclatures_get` — `GET /api/v1/calendar/promotions/nomenclatures` — Список товаров для участия в акции
- `promotion.DefaultApi.api_v1_calendar_promotions_upload_post` — `POST /api/v1/calendar/promotions/upload` — Добавить товар в акцию

### communications (`communications`)
- `communications.DefaultApi.api_feedbacks_v1_pins_count_get` — `GET /api/feedbacks/v1/pins/count` — Количество закреплённых и откреплённых отзывов
- `communications.DefaultApi.api_feedbacks_v1_pins_delete` — `DELETE /api/feedbacks/v1/pins` — Открепить отзывы
- `communications.DefaultApi.api_feedbacks_v1_pins_get` — `GET /api/feedbacks/v1/pins` — Список закреплённых и откреплённых отзывов
- `communications.DefaultApi.api_feedbacks_v1_pins_limits_get` — `GET /api/feedbacks/v1/pins/limits` — Лимиты закреплённых отзывов
- `communications.DefaultApi.api_feedbacks_v1_pins_post` — `POST /api/feedbacks/v1/pins` — Закрепить отзывы
- `communications.DefaultApi.api_v1_claim_patch` — `PATCH /api/v1/claim` — Ответ на заявку покупателя
- `communications.DefaultApi.api_v1_claims_get` — `GET /api/v1/claims` — Заявки покупателей на возврат
- `communications.DefaultApi.api_v1_feedback_get` — `GET /api/v1/feedback` — Получить отзыв по ID
- `communications.DefaultApi.api_v1_feedbacks_answer_patch` — `PATCH /api/v1/feedbacks/answer` — Отредактировать ответ на отзыв
- `communications.DefaultApi.api_v1_feedbacks_answer_post` — `POST /api/v1/feedbacks/answer` — Ответить на отзыв
- `communications.DefaultApi.api_v1_feedbacks_archive_get` — `GET /api/v1/feedbacks/archive` — Список архивных отзывов
- `communications.DefaultApi.api_v1_feedbacks_count_get` — `GET /api/v1/feedbacks/count` — Количество отзывов
- `communications.DefaultApi.api_v1_feedbacks_count_unanswered_get` — `GET /api/v1/feedbacks/count-unanswered` — Необработанные отзывы
- `communications.DefaultApi.api_v1_feedbacks_get` — `GET /api/v1/feedbacks` — Список отзывов
- `communications.DefaultApi.api_v1_feedbacks_order_return_post` — `POST /api/v1/feedbacks/order/return` — Возврат товара по ID отзыва
- `communications.DefaultApi.api_v1_new_feedbacks_questions_get` — `GET /api/v1/new-feedbacks-questions` — Непросмотренные отзывы и вопросы
- `communications.DefaultApi.api_v1_question_get` — `GET /api/v1/question` — Получить вопрос по ID
- `communications.DefaultApi.api_v1_questions_count_get` — `GET /api/v1/questions/count` — Количество вопросов
- `communications.DefaultApi.api_v1_questions_count_unanswered_get` — `GET /api/v1/questions/count-unanswered` — Неотвеченные вопросы
- `communications.DefaultApi.api_v1_questions_get` — `GET /api/v1/questions` — Список вопросов
- `communications.DefaultApi.api_v1_questions_patch` — `PATCH /api/v1/questions` — Работа с вопросами
- `communications.DefaultApi.api_v1_seller_chats_get` — `GET /api/v1/seller/chats` — Список чатов
- `communications.DefaultApi.api_v1_seller_download_id_get` — `GET /api/v1/seller/download/{id}` — Получить файл из сообщения
- `communications.DefaultApi.api_v1_seller_events_get` — `GET /api/v1/seller/events` — События чатов
- `communications.DefaultApi.api_v1_seller_message_post` — `POST /api/v1/seller/message` — Отправить сообщение

### tariffs (`tariffs`)
- `tariffs.DefaultApi.api_tariffs_v1_acceptance_coefficients_get` — `GET /api/tariffs/v1/acceptance/coefficients` — Тарифы на поставку
- `tariffs.DefaultApi.api_v1_tariffs_box_get` — `GET /api/v1/tariffs/box` — Тарифы для коробов
- `tariffs.DefaultApi.api_v1_tariffs_commission_get` — `GET /api/v1/tariffs/commission` — Комиссия по категориям товаров
- `tariffs.DefaultApi.api_v1_tariffs_pallet_get` — `GET /api/v1/tariffs/pallet` — Тарифы для монопаллет
- `tariffs.DefaultApi.api_v1_tariffs_return_get` — `GET /api/v1/tariffs/return` — Тарифы на возврат

### analytics (`analytics`)
- `analytics.DefaultApi.api_v2_nm_report_downloads_file_download_id_get` — `GET /api/v2/nm-report/downloads/file/{downloadId}` — Получить отчёт
- `analytics.DefaultApi.api_v2_nm_report_downloads_get` — `GET /api/v2/nm-report/downloads` — Получить список отчётов
- `analytics.DefaultApi.api_v2_nm_report_downloads_post` — `POST /api/v2/nm-report/downloads` — Создать отчёт
- `analytics.DefaultApi.api_v2_nm_report_downloads_retry_post` — `POST /api/v2/nm-report/downloads/retry` — Сгенерировать отчёт повторно
- `analytics.DefaultApi.api_v2_search_report_product_orders_post` — `POST /api/v2/search-report/product/orders` — Заказы и позиции по поисковым запросам товара
- `analytics.DefaultApi.api_v2_search_report_product_search_texts_post` — `POST /api/v2/search-report/product/search-texts` — Поисковые запросы по товару
- `analytics.DefaultApi.api_v2_search_report_report_post` — `POST /api/v2/search-report/report` — Основная страница
- `analytics.DefaultApi.api_v2_search_report_table_details_post` — `POST /api/v2/search-report/table/details` — Пагинация по товарам в группе
- `analytics.DefaultApi.api_v2_search_report_table_groups_post` — `POST /api/v2/search-report/table/groups` — Пагинация по группам
- `analytics.DefaultApi.api_v2_stocks_report_offices_post` — `POST /api/v2/stocks-report/offices` — Данные по складам
- `analytics.DefaultApi.api_v2_stocks_report_products_groups_post` — `POST /api/v2/stocks-report/products/groups` — Данные по группам
- `analytics.DefaultApi.api_v2_stocks_report_products_products_post` — `POST /api/v2/stocks-report/products/products` — Данные по товарам
- `analytics.DefaultApi.api_v2_stocks_report_products_sizes_post` — `POST /api/v2/stocks-report/products/sizes` — Данные по размерам
- `analytics.DefaultApi.post_sales_funnel_grouped_history` — `POST /api/analytics/v3/sales-funnel/grouped/history` — Статистика групп карточек товаров по дням
- `analytics.DefaultApi.post_sales_funnel_products` — `POST /api/analytics/v3/sales-funnel/products` — Статистика карточек товаров за период
- `analytics.DefaultApi.post_sales_funnel_products_history` — `POST /api/analytics/v3/sales-funnel/products/history` — Статистика карточек товаров по дням

### reports (`reports`)
- `reports.DefaultApi.api_v1_acceptance_report_get` — `GET /api/v1/acceptance_report` — Создать отчёт
- `reports.DefaultApi.api_v1_acceptance_report_tasks_task_id_download_get` — `GET /api/v1/acceptance_report/tasks/{task_id}/download` — Получить отчёт
- `reports.DefaultApi.api_v1_acceptance_report_tasks_task_id_status_get` — `GET /api/v1/acceptance_report/tasks/{task_id}/status` — Проверить статус
- `reports.DefaultApi.api_v1_analytics_antifraud_details_get` — `GET /api/v1/analytics/antifraud-details` — Самовыкупы
- `reports.DefaultApi.api_v1_analytics_banned_products_blocked_get` — `GET /api/v1/analytics/banned-products/blocked` — Заблокированные карточки
- `reports.DefaultApi.api_v1_analytics_banned_products_shadowed_get` — `GET /api/v1/analytics/banned-products/shadowed` — Скрытые из каталога
- `reports.DefaultApi.api_v1_analytics_brand_share_brands_get` — `GET /api/v1/analytics/brand-share/brands` — Бренды продавца
- `reports.DefaultApi.api_v1_analytics_brand_share_get` — `GET /api/v1/analytics/brand-share` — Получить отчёт
- `reports.DefaultApi.api_v1_analytics_brand_share_parent_subjects_get` — `GET /api/v1/analytics/brand-share/parent-subjects` — Родительские категории бренда
- `reports.DefaultApi.api_v1_analytics_characteristics_change_get` — `GET /api/v1/analytics/characteristics-change` — (Deprecated) Смена характеристик
- `reports.DefaultApi.api_v1_analytics_excise_report_post` — `POST /api/v1/analytics/excise-report` — Получить отчёт
- `reports.DefaultApi.api_v1_analytics_goods_labeling_get` — `GET /api/v1/analytics/goods-labeling` — Маркировка товара
- `reports.DefaultApi.api_v1_analytics_goods_return_get` — `GET /api/v1/analytics/goods-return` — Получить отчёт
- `reports.DefaultApi.api_v1_analytics_incorrect_attachments_get` — `GET /api/v1/analytics/incorrect-attachments` — (Deprecated) Подмена товара
- `reports.DefaultApi.api_v1_analytics_region_sale_get` — `GET /api/v1/analytics/region-sale` — Получить отчёт
- `reports.DefaultApi.api_v1_analytics_warehouse_measurements_get` — `GET /api/v1/analytics/warehouse-measurements` — (Deprecated) Занижение габаритов упаковки
- `reports.DefaultApi.api_v1_paid_storage_get` — `GET /api/v1/paid_storage` — Создать отчёт
- `reports.DefaultApi.api_v1_paid_storage_tasks_task_id_download_get` — `GET /api/v1/paid_storage/tasks/{task_id}/download` — Получить отчёт
- `reports.DefaultApi.api_v1_paid_storage_tasks_task_id_status_get` — `GET /api/v1/paid_storage/tasks/{task_id}/status` — Проверить статус
- `reports.DefaultApi.api_v1_supplier_incomes_get` — `GET /api/v1/supplier/incomes` — (Deprecated) Поставки
- `reports.DefaultApi.api_v1_supplier_orders_get` — `GET /api/v1/supplier/orders` — Заказы
- `reports.DefaultApi.api_v1_supplier_sales_get` — `GET /api/v1/supplier/sales` — Продажи
- `reports.DefaultApi.api_v1_supplier_stocks_get` — `GET /api/v1/supplier/stocks` — Склады
- `reports.DefaultApi.api_v1_warehouse_remains_get` — `GET /api/v1/warehouse_remains` — Создать отчёт
- `reports.DefaultApi.api_v1_warehouse_remains_tasks_task_id_download_get` — `GET /api/v1/warehouse_remains/tasks/{task_id}/download` — Получить отчёт
- `reports.DefaultApi.api_v1_warehouse_remains_tasks_task_id_status_get` — `GET /api/v1/warehouse_remains/tasks/{task_id}/status` — Проверить статус
- `reports.DefaultApi.get_deductions` — `GET /api/analytics/v1/deductions` — Подмены и неверные вложения
- `reports.DefaultApi.get_measurement_penalties` — `GET /api/analytics/v1/measurement-penalties` — Удержания за занижение габаритов упаковки
- `reports.DefaultApi.get_warehouse_measurements` — `GET /api/analytics/v1/warehouse-measurements` — Замеры склада

### finances (`finances`)
- `finances.DefaultApi.api_v1_account_balance_get` — `GET /api/v1/account/balance` — Получить баланс продавца
- `finances.DefaultApi.api_v1_documents_categories_get` — `GET /api/v1/documents/categories` — Категории документов
- `finances.DefaultApi.api_v1_documents_download_all_post` — `POST /api/v1/documents/download/all` — Получить документы
- `finances.DefaultApi.api_v1_documents_download_get` — `GET /api/v1/documents/download` — Получить документ
- `finances.DefaultApi.api_v1_documents_list_get` — `GET /api/v1/documents/list` — Список документов
- `finances.DefaultApi.api_v5_supplier_report_detail_by_period_get` — `GET /api/v5/supplier/reportDetailByPeriod` — Отчёт о продажах по реализации

### wbd (`wbd`)
- `wbd.DefaultApi.content_author_get` — `GET /api/v1/content/author` — Получить список своего контента
- `wbd.DefaultApi.content_delete` — `POST /api/v1/content/delete` — Удалить контент
- `wbd.DefaultApi.content_download_get` — `GET /api/v1/content/download/{uri}` — Скачать контент
- `wbd.DefaultApi.content_gallery` — `POST /api/v1/content/gallery` — Загрузить медиафайлы для предложения
- `wbd.DefaultApi.content_id_get` — `GET /api/v1/content/author/{content_id}` — Получить информацию о контенте
- `wbd.DefaultApi.content_update` — `POST /api/v1/content/author/{content_id}` — Редактировать контент
- `wbd.DefaultApi.content_upload_chunk` — `POST /api/v1/content/upload/chunk` — Загрузить контент (файл)
- `wbd.DefaultApi.content_upload_illustration` — `POST /api/v1/content/illustration` — Загрузить обложку контента
- `wbd.DefaultApi.content_upload_init` — `POST /api/v1/content/upload/init` — Инициализировать новый контент
- `wbd.DefaultApi.delete_keys_by_ids` — `DELETE /api/v1/keys-api/keys` — Удалить ключи активации
- `wbd.DefaultApi.get_catalog` — `GET /api/v1/catalog` — Получить категории и их подкатегории
- `wbd.DefaultApi.get_redeemed_keys` — `GET /api/v1/keys-api/keys/redeemed` — Получить купленные ключи
- `wbd.DefaultApi.load_keys` — `POST /api/v1/keys-api/keys` — Добавить ключи активации
- `wbd.DefaultApi.offer_create` — `POST /api/v1/offers` — Создать новое предложение
- `wbd.DefaultApi.offer_get` — `GET /api/v1/offers/{offer_id}` — Получить информацию о предложении
- `wbd.DefaultApi.offer_keys_count_get` — `GET /api/v1/offer/keys/{offer_id}` — Получить количество ключей для предложения
- `wbd.DefaultApi.offer_keys_get` — `GET /api/v1/offer/keys/{offer_id}/list` — Получить список ключей
- `wbd.DefaultApi.offer_update` — `POST /api/v1/offers/{offer_id}` — Редактировать предложение
- `wbd.DefaultApi.offer_update_price` — `POST /api/v1/offer/price/{offer_id}` — Обновить цену
- `wbd.DefaultApi.offer_update_status` — `POST /api/v1/offer/{offer_id}` — Обновить статус
- `wbd.DefaultApi.offers_author_get` — `GET /api/v1/offers/author` — Получить список своих предложений
- `wbd.DefaultApi.offers_upload_thumbnail` — `POST /api/v1/offers/thumb` — Добавить или обновить обложку предложения
<!-- PY_METHODS_LIST_END -->
