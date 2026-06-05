from docsgen.specs import load_operations, module_from_filename


def test_module_from_filename():
    assert module_from_filename("specs/13-finances.yaml") == "finances"
    assert module_from_filename("specs/06-in-store-pickup.yaml") == "in_store_pickup"


def test_load_operations_finds_known_finances_op():
    ops = load_operations("specs")
    fin = [o for o in ops if o.module == "finances"]
    assert len(fin) == 12  # confirmed operation count for 13-finances.yaml
    balance = next(o for o in fin if o.path == "/api/v1/account/balance")
    assert balance.verb == "GET"
    assert balance.summary == "Получить баланс продавца"

    sales = next(o for o in fin if o.path == "/api/finance/v1/sales-reports/list")
    assert sales.verb == "POST"
    assert sales.request_model == "SalesReportListReq"


def test_total_operation_count():
    # 304 operations across the 14 spec modules (confirmed via spec scan).
    assert len(load_operations("specs")) == 304
