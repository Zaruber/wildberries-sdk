from docsgen.specs import Operation, Param
from docsgen.examples import build_examples


def _op():
    return Operation(
        module="finances", verb="POST",
        path="/api/finance/v1/sales-reports/list",
        summary="Список отчётов реализации", description="",
        params=[], request_model="SalesReportListReq", response_model="SalesReportListRes[]",
    )


# For non-Python languages names are (real_method_name, class_token) tuples.
def _names_with_default_api():
    return {
        "python": "post_v1_sales_reports_list",
        "rust": ("post_v1_sales_reports_list", "default_api"),
        "npm": ("postV1SalesReportsList", "DefaultApi"),
        "php": ("postV1SalesReportsList", "Wildberries\\Sdk\\Finances\\Api\\DefaultApi"),
        "go": ("PostV1SalesReportsList", "DefaultApi"),
    }


def test_build_examples_returns_all_five_languages_in_order():
    examples = build_examples(_op(), _names_with_default_api())
    assert [label for label, _lang, _code in examples] == \
        ["Python", "Node.js", "Go", "PHP", "Rust"]


def test_python_example_uses_module_and_method():
    names = {"python": "post_v1_sales_reports_list", "rust": None,
             "npm": None, "php": None, "go": None}
    examples = dict((label, code) for label, _lang, code in build_examples(_op(), names))
    py = examples["Python"]
    assert "from wildberries_sdk import finances" in py
    assert "api.post_v1_sales_reports_list(" in py


def test_unavailable_language_renders_notice():
    names = {"python": "post_v1_sales_reports_list", "rust": None,
             "npm": None, "php": None, "go": None}
    examples = dict((label, code) for label, _lang, code in build_examples(_op(), names))
    assert examples["Go"] == "// операция недоступна в этом клиенте"


def test_npm_uses_correct_class_token():
    """npm example must import and instantiate the class the method actually lives in."""
    names = {
        "python": "ping_get",
        "npm": ("pingGet", "WBAPIApi"),
        "go": ("PingGet", "WBAPIAPI"),
        "php": ("pingGet", "Wildberries\\Sdk\\General\\Api\\WBAPIApi"),
        "rust": ("ping_get", "wbapi_api"),
    }
    op = Operation(
        module="general", verb="GET", path="/ping",
        summary="Ping", description="",
        params=[], request_model=None, response_model=None,
    )
    examples = dict((label, code) for label, _lang, code in build_examples(op, names))
    assert "WBAPIApi" in examples["Node.js"]
    assert "DefaultApi" not in examples["Node.js"]
    assert "WBAPIAPI" in examples["Go"]
    assert "DefaultApi" not in examples["Go"]
    assert "WBAPIApi" in examples["PHP"]
    assert "DefaultApi" not in examples["PHP"]
    assert "wbapi_api" in examples["Rust"]
    assert "default_api" not in examples["Rust"]
