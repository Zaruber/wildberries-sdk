# wildberries-sdk (Python)

## Установка

```bash
pip install wildberries-sdk
```

## Пример (communications)

```python
import os

from wildberries_sdk import communications

token = os.getenv("WB_API_TOKEN")

config = communications.Configuration(host="https://feedbacks-api.wildberries.ru")
config.api_key["HeaderApiKey"] = token

client = communications.ApiClient(configuration=config)
api = communications.DefaultApi(api_client=client)

response = api.api_v1_feedbacks_get(
    is_answered=True,
    take=100,
    skip=0,
)

print(response)
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
- `general.APIApi.api_communications_v2_news_get` — `GET /api/communications/v2/news` — Получение новостей портала продавцов
- `general.WBAPIApi.ping_get` — `GET /ping` — Проверка подключения

### products (`products`)
- `products.DefaultApi.content_v2_tag_id_delete` — `DELETE /content/v2/tag/{id}` — Удаление ярлыка
- `products.DefaultApi.content_v2_tag_id_patch` — `PATCH /content/v2/tag/{id}` — Изменение ярлыка
- `products.DefaultApi.content_v2_tag_nomenclature_link_post` — `POST /content/v2/tag/nomenclature/link` — Управление ярлыками в карточке товара
- `products.DefaultApi.content_v2_tag_post` — `POST /content/v2/tag` — Создание ярлыка
- `products.DefaultApi.content_v2_tags_get` — `GET /content/v2/tags` — Список ярлыков
- `products.DefaultApi.content_v3_media_file_post` — `POST /content/v3/media/file` — Загрузить медиафайл
- `products.DefaultApi.content_v3_media_save_post` — `POST /content/v3/media/save` — Загрузить медиафайлы по ссылкам

### orders_fbs (`orders_fbs`)
- `orders_fbs.FBSApi.api_v3_orders_client_post` — `POST /api/v3/orders/client` — Заказы с информацией по клиенту
- `orders_fbs.FBSApi.api_v3_orders_get` — `GET /api/v3/orders` — Получить информацию о сборочных заданиях
- `orders_fbs.FBSApi.api_v3_orders_new_get` — `GET /api/v3/orders/new` — Получить список новых сборочных заданий
- `orders_fbs.FBSApi.api_v3_orders_order_id_cancel_patch` — `PATCH /api/v3/orders/{orderId}/cancel` — Отменить сборочное задание
- `orders_fbs.FBSApi.api_v3_orders_status_history_post` — `POST /api/v3/orders/status/history` — История статусов для сборочных заданий кроссбордера
- `orders_fbs.FBSApi.api_v3_orders_status_post` — `POST /api/v3/orders/status` — Получить статусы сборочных заданий
- `orders_fbs.FBSApi.api_v3_orders_stickers_cross_border_post` — `POST /api/v3/orders/stickers/cross-border` — Получить стикеры сборочных заданий кроссбордера
- `orders_fbs.FBSApi.api_v3_orders_stickers_post` — `POST /api/v3/orders/stickers` — Получить стикеры сборочных заданий
- `orders_fbs.FBSApi.api_v3_supplies_orders_reshipment_get` — `GET /api/v3/supplies/orders/reshipment` — Получить все сборочные задания для повторной отгрузки

### orders_dbw (`orders_dbw`)
- `orders_dbw.DBWApi.api_v3_dbw_orders_courier_post` — `POST /api/v3/dbw/orders/courier` — Информация о курьере
- `orders_dbw.DBWApi.api_v3_dbw_orders_delivery_date_post` — `POST /api/v3/dbw/orders/delivery-date` — Дата и время доставки
- `orders_dbw.DBWApi.api_v3_dbw_orders_get` — `GET /api/v3/dbw/orders` — Получить информацию о завершенных сборочных заданиях
- `orders_dbw.DBWApi.api_v3_dbw_orders_new_get` — `GET /api/v3/dbw/orders/new` — Получить список новых сборочных заданий
- `orders_dbw.DBWApi.api_v3_dbw_orders_order_id_assemble_patch` — `PATCH /api/v3/dbw/orders/{orderId}/assemble` — Перевести в доставку
- `orders_dbw.DBWApi.api_v3_dbw_orders_order_id_cancel_patch` — `PATCH /api/v3/dbw/orders/{orderId}/cancel` — Отменить сборочное задание
- `orders_dbw.DBWApi.api_v3_dbw_orders_order_id_confirm_patch` — `PATCH /api/v3/dbw/orders/{orderId}/confirm` — Перевести на сборку
- `orders_dbw.DBWApi.api_v3_dbw_orders_status_post` — `POST /api/v3/dbw/orders/status` — Получить статусы сборочных заданий
- `orders_dbw.DBWApi.api_v3_dbw_orders_stickers_post` — `POST /api/v3/dbw/orders/stickers` — Получить стикеры сборочных заданий

### orders_dbs (`orders_dbs`)
- `orders_dbs.DBSApi.api_v3_dbs_groups_info_post` — `POST /api/v3/dbs/groups/info` — Получить информацию о платной доставке
- `orders_dbs.DBSApi.api_v3_dbs_orders_client_post` — `POST /api/v3/dbs/orders/client` — Информация о покупателе
- `orders_dbs.DBSApi.api_v3_dbs_orders_delivery_date_post` — `POST /api/v3/dbs/orders/delivery-date` — Дата и время доставки
- `orders_dbs.DBSApi.api_v3_dbs_orders_get` — `GET /api/v3/dbs/orders` — Получить информацию о завершенных сборочных заданиях
- `orders_dbs.DBSApi.api_v3_dbs_orders_new_get` — `GET /api/v3/dbs/orders/new` — Получить список новых сборочных заданий
- `orders_dbs.DBSApi.api_v3_dbs_orders_order_id_cancel_patch` — `PATCH /api/v3/dbs/orders/{orderId}/cancel` — Отменить сборочное задание
- `orders_dbs.DBSApi.api_v3_dbs_orders_order_id_confirm_patch` — `PATCH /api/v3/dbs/orders/{orderId}/confirm` — Перевести на сборку
- `orders_dbs.DBSApi.api_v3_dbs_orders_order_id_deliver_patch` — `PATCH /api/v3/dbs/orders/{orderId}/deliver` — Перевести в доставку
- `orders_dbs.DBSApi.api_v3_dbs_orders_order_id_receive_patch` — `PATCH /api/v3/dbs/orders/{orderId}/receive` — Сообщить, что заказ принят покупателем
- `orders_dbs.DBSApi.api_v3_dbs_orders_order_id_reject_patch` — `PATCH /api/v3/dbs/orders/{orderId}/reject` — Сообщить, что покупатель отказался от заказа
- `orders_dbs.DBSApi.api_v3_dbs_orders_status_post` — `POST /api/v3/dbs/orders/status` — Получить статусы сборочных заданий

### promotion (`promotion`)
- `promotion.DefaultApi.adv_v0_auction_adverts_get` — `GET /adv/v0/auction/adverts` — (Deprecated) Информация о кампаниях с ручной ставкой
- `promotion.DefaultApi.adv_v0_normquery_stats_post` — `POST /adv/v0/normquery/stats` — Статистика поисковых кластеров
- `promotion.DefaultApi.adv_v0_stats_keywords_get` — `GET /adv/v0/stats/keywords` — (Deprecated) Статистика по ключевым фразам
- `promotion.DefaultApi.adv_v1_advert_get` — `GET /adv/v1/advert` — Информация о медиакампании
- `promotion.DefaultApi.adv_v1_adverts_get` — `GET /adv/v1/adverts` — Список медиакампаний
- `promotion.DefaultApi.adv_v1_balance_get` — `GET /adv/v1/balance` — Баланс
- `promotion.DefaultApi.adv_v1_budget_deposit_post` — `POST /adv/v1/budget/deposit` — Пополнение бюджета кампании
- `promotion.DefaultApi.adv_v1_budget_get` — `GET /adv/v1/budget` — Бюджет кампании
- `promotion.DefaultApi.adv_v1_count_get` — `GET /adv/v1/count` — Количество медиакампаний
- `promotion.DefaultApi.adv_v1_payments_get` — `GET /adv/v1/payments` — Получение истории пополнений счёта
- `promotion.DefaultApi.adv_v1_promotion_adverts_post` — `POST /adv/v1/promotion/adverts` — (Deprecated) Информация о кампаниях
- `promotion.DefaultApi.adv_v1_promotion_count_get` — `GET /adv/v1/promotion/count` — Списки кампаний
- `promotion.DefaultApi.adv_v1_stat_words_get` — `GET /adv/v1/stat/words` — (Deprecated) Статистика кампании c ручной ставкой по ключевым фразам
- `promotion.DefaultApi.adv_v1_stats_post` — `POST /adv/v1/stats` — Статистика медиакампаний
- `promotion.DefaultApi.adv_v1_upd_get` — `GET /adv/v1/upd` — Получение истории затрат
- `promotion.DefaultApi.adv_v2_auto_stat_words_get` — `GET /adv/v2/auto/stat-words` — (Deprecated) Статистика кампании с единой ставкой по кластерам фраз
- `promotion.DefaultApi.adv_v2_fullstats_post` — `POST /adv/v2/fullstats` — (Deprecated) Статистика кампаний
- `promotion.DefaultApi.adv_v3_fullstats_get` — `GET /adv/v3/fullstats` — Статистика кампаний
- `promotion.DefaultApi.api_advert_v2_adverts_get` — `GET /api/advert/v2/adverts` — Информация о кампаниях

### communications (`communications`)
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

### tariffs (`tariffs`)
- `tariffs.DefaultApi.api_v1_tariffs_commission_get` — `GET /api/v1/tariffs/commission` — Комиссия по категориям товаров

### analytics (`analytics`)
- `analytics.CSVApi.api_v2_nm_report_downloads_file_download_id_get` — `GET /api/v2/nm-report/downloads/file/{downloadId}` — Получить отчёт
- `analytics.CSVApi.api_v2_nm_report_downloads_get` — `GET /api/v2/nm-report/downloads` — Получить список отчётов
- `analytics.CSVApi.api_v2_nm_report_downloads_post` — `POST /api/v2/nm-report/downloads` — Создать отчёт
- `analytics.CSVApi.api_v2_nm_report_downloads_retry_post` — `POST /api/v2/nm-report/downloads/retry` — Сгенерировать отчёт повторно

### reports (`reports`)
- `reports.CApi.api_v1_analytics_excise_report_post` — `POST /api/v1/analytics/excise-report` — Получить отчёт

### finances (`finances`)
- `finances.DefaultApi.api_v1_account_balance_get` — `GET /api/v1/account/balance` — Получить баланс продавца
- `finances.DefaultApi.api_v1_documents_categories_get` — `GET /api/v1/documents/categories` — Категории документов
- `finances.DefaultApi.api_v1_documents_download_all_post` — `POST /api/v1/documents/download/all` — Получить документы
- `finances.DefaultApi.api_v1_documents_download_get` — `GET /api/v1/documents/download` — Получить документ
- `finances.DefaultApi.api_v1_documents_list_get` — `GET /api/v1/documents/list` — Список документов

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
- `wbd.DefaultApi.get_catalog` — `GET /api/v1/catalog` — Получить категории и их подкатегории
- `wbd.DefaultApi.offer_create` — `POST /api/v1/offers` — Создать новое предложение
- `wbd.DefaultApi.offer_get` — `GET /api/v1/offers/{offer_id}` — Получить информацию о предложении
- `wbd.DefaultApi.offer_update` — `POST /api/v1/offers/{offer_id}` — Редактировать предложение
- `wbd.DefaultApi.offer_update_price` — `POST /api/v1/offer/price/{offer_id}` — Обновить цену
- `wbd.DefaultApi.offer_update_status` — `POST /api/v1/offer/{offer_id}` — Обновить статус
- `wbd.DefaultApi.offers_author_get` — `GET /api/v1/offers/author` — Получить список своих предложений
- `wbd.DefaultApi.offers_upload_thumbnail` — `POST /api/v1/offers/thumb` — Добавить или обновить обложку предложения
<!-- PY_METHODS_LIST_END -->
