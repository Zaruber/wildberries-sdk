from docsgen.naming import to_pascal, to_camel


def test_to_pascal_basic():
    assert to_pascal("api_v1_account_balance_get") == "ApiV1AccountBalanceGet"


def test_to_pascal_version_segment():
    assert to_pascal("api_v5_supplier_report_detail_by_period_get") == \
        "ApiV5SupplierReportDetailByPeriodGet"


def test_to_camel_basic():
    assert to_camel("api_v1_account_balance_get") == "apiV1AccountBalanceGet"


def test_to_camel_post():
    assert to_camel("post_v1_sales_reports_list") == "postV1SalesReportsList"
