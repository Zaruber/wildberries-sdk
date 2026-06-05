"""Deterministic case transforms between openapi-generator naming styles.

The Python client uses snake_case method names; this module derives the
other languages' names from that snake base.
"""
from __future__ import annotations


def to_pascal(snake: str) -> str:
    """``api_v1_account_balance_get`` -> ``ApiV1AccountBalanceGet`` (Go style)."""
    return "".join(seg[:1].upper() + seg[1:] for seg in snake.split("_") if seg)


def to_camel(snake: str) -> str:
    """``api_v1_account_balance_get`` -> ``apiV1AccountBalanceGet`` (npm/PHP style)."""
    pascal = to_pascal(snake)
    return pascal[:1].lower() + pascal[1:]
