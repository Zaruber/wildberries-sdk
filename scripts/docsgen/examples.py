"""Build minimal, deterministic call-example snippets per language.

Examples show client/config init plus a method call. Required query/path
parameters and the request body are shown as ``...`` placeholders — we never
fabricate field values, so the snippet stays correct as specs evolve.

For non-Python languages ``names[lang]`` is a ``(method_name, class_token)``
tuple (where class_token is the API class, Go client field, or Rust module),
or ``None`` when the operation is absent from that client.  For Python it
remains a plain string (or ``None``).
"""
from __future__ import annotations

from typing import Dict, List, Optional, Tuple

from .naming import to_camel
from .specs import Operation

# (language id, tab label, fenced code lang)
LANGS: List[Tuple[str, str, str]] = [
    ("python", "Python", "python"),
    ("npm", "Node.js", "typescript"),
    ("go", "Go", "go"),
    ("php", "PHP", "php"),
    ("rust", "Rust", "rust"),
]

UNAVAILABLE = "// операция недоступна в этом клиенте"


def _required_param_names(op: Operation) -> List[str]:
    return [p.name for p in op.params if p.required and p.name]


def _snake(model: str) -> str:
    out = []
    for ch in model:
        if ch.isupper() and out:
            out.append("_")
        out.append(ch.lower())
    return "".join(out)


def _python(op: Operation, method: str) -> str:
    args = [f"{name}=..." for name in _required_param_names(op)]
    if op.request_model:
        args.append(f"{_snake(op.request_model)}=...")
    arglist = ", ".join(args)
    return (
        "import os\n"
        f"from wildberries_sdk import {op.module}\n\n"
        'token = os.getenv("WB_API_TOKEN")\n'
        f"api = {op.module}.DefaultApi(\n"
        f"    {op.module}.ApiClient({op.module}.Configuration(api_key={{\"HeaderApiKey\": token}}))\n"
        ")\n"
        f"result = api.{method}({arglist})\n"
        "print(result)"
    )


def _npm(op: Operation, method: str, class_token: str) -> str:
    req = "{ ... }" if (op.request_model or _required_param_names(op)) else ""
    return (
        f"import {{ Configuration, {class_token} }} from 'wildberries-sdk';\n\n"
        f"const api = new {class_token}(new Configuration({{ apiKey: process.env.WB_API_TOKEN }}));\n"
        f"const result = await api.{method}({req});\n"
        "console.log(result);"
    )


def _go(op: Operation, method: str, field_name: str) -> str:
    return (
        "cfg := " + op.module + ".NewConfiguration()\n"
        'cfg.AddDefaultHeader("Authorization", os.Getenv("WB_API_TOKEN"))\n'
        "client := " + op.module + ".NewAPIClient(cfg)\n"
        f"result, _, err := client.{field_name}.{method}(context.Background()).Execute()"
    )


def _php(op: Operation, method: str, full_class: str) -> str:
    args = ", ".join("..." for _ in _required_param_names(op)) or (
        "..." if op.request_model else ""
    )
    # Split "Namespace\Class" into namespace and class name for the setApiKey call.
    # The configuration class lives in the same vendor namespace root.
    ns_parts = full_class.rsplit("\\", 2)
    # ns_parts is e.g. ["Wildberries\Sdk\General", "Api", "WBAPIApi"] (after rsplit by \)
    # Actually full_class is like "Wildberries\Sdk\General\Api\WBAPIApi"
    # We need the root namespace prefix for Configuration: "Wildberries\Sdk\General"
    # Extract it by stripping the trailing "\Api\ClassName"
    ns_root = full_class.rsplit("\\Api\\", 1)[0] if "\\Api\\" in full_class else "WildberriesSdk"
    return (
        "<?php\n"
        f"$config = {ns_root}\\Configuration::getDefaultConfiguration()\n"
        "    ->setApiKey('Authorization', getenv('WB_API_TOKEN'));\n"
        f"$api = new {full_class}(new GuzzleHttp\\Client(), $config);\n"
        f"$result = $api->{method}({args});"
    )


def _rust(op: Operation, method: str, mod_name: str) -> str:
    body = ", ..." if (op.request_model or _required_param_names(op)) else ""
    return (
        "use " + f"wildberries_sdk_{op.module}" + f"::apis::{{configuration::Configuration, configuration::ApiKey, {mod_name}}};\n\n"
        "let mut config = Configuration::new();\n"
        "config.api_key = Some(ApiKey { prefix: None, key: std::env::var(\"WB_API_TOKEN\").unwrap() });\n"
        f"let result = {mod_name}::{method}(&config{body}).await?;"
    )


_BUILDERS = {"python": _python, "npm": _npm, "go": _go, "php": _php, "rust": _rust}


def build_examples(op: Operation, names: Dict) -> List[Tuple[str, str, str]]:
    """Return ``[(tab_label, fenced_lang, code), ...]`` in fixed language order.

    ``names["python"]`` is a plain string (or None).
    ``names[lang]`` for npm/go/php/rust is a ``(method_name, class_token)`` tuple
    or None when the operation is absent from that client.
    """
    out: List[Tuple[str, str, str]] = []
    for lang_id, label, fence in LANGS:
        entry = names.get(lang_id)
        if lang_id == "python":
            code = _python(op, entry) if entry else UNAVAILABLE
        else:
            if entry is None:
                code = UNAVAILABLE
            else:
                method, class_token = entry
                code = _BUILDERS[lang_id](op, method, class_token)
        out.append((label, fence, code))
    return out
