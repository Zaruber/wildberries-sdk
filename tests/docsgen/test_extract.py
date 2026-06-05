from docsgen.extract import (
    python_anchor, npm_names, go_names, php_names, rust_names,
    npm_class_map, go_class_map, php_class_map, rust_class_map, class_maps,
)


def test_python_anchor_maps_verb_path_to_snake():
    anchor = python_anchor("finances", "clients")
    assert anchor[("GET", "/api/v1/account/balance")] == "api_v1_account_balance_get"
    assert anchor[("POST", "/api/finance/v1/sales-reports/list")] == \
        "post_v1_sales_reports_list"


def test_language_name_sets_contain_known_method():
    assert "apiV1AccountBalanceGet" in npm_names("finances", "clients")
    assert "ApiV1AccountBalanceGet" in go_names("finances", "clients")
    assert "apiV1AccountBalanceGet" in php_names("finances", "clients")
    assert "api_v1_account_balance_get" in rust_names("finances", "clients")


def test_php_names_exclude_helper_suffixes():
    names = php_names("finances", "clients")
    assert not any(n.endswith(("WithHttpInfo", "Async", "Request")) for n in names)


def test_missing_module_returns_empty_set():
    assert npm_names("does_not_exist", "clients") == set()


def test_npm_class_map_ping_uses_wbapi_class():
    """GET /ping lives in WBAPIApi, not DefaultApi."""
    cmap = npm_class_map("general", "clients")
    real_name, class_token = cmap["pingget"]
    assert class_token == "WBAPIApi"
    assert class_token != "DefaultApi"


def test_go_class_map_ping_uses_wbapi_field():
    """GET /ping lives in the WBAPIAPI client field, not DefaultApi."""
    cmap = go_class_map("general", "clients")
    real_name, field_name = cmap["pingget"]
    assert field_name == "WBAPIAPI"
    assert field_name != "DefaultApi"


def test_class_maps_default_api_unchanged_for_finances():
    """DefaultApi operations in finances must still resolve to DefaultApi."""
    cmaps = class_maps("finances", "clients")
    npm_real, npm_class = cmaps["npm"]["apiv1accountbalanceget"]
    assert npm_class == "DefaultApi"
    go_real, go_field = cmaps["go"]["apiv1accountbalanceget"]
    assert go_field == "DefaultApi"


def test_php_class_map_ping_uses_wbapi_class():
    cmap = php_class_map("general", "clients")
    real_name, full_class = cmap["pingget"]
    assert "WBAPIApi" in full_class
    assert "DefaultApi" not in full_class


def test_rust_class_map_ping_uses_wbapi_module():
    cmap = rust_class_map("general", "clients")
    real_name, mod_name = cmap["ping_get"]
    assert mod_name == "wbapi_api"
    assert mod_name != "default_api"
