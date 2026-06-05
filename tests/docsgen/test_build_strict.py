import subprocess
import sys
from pathlib import Path

ROOT = Path(__file__).resolve().parents[2]


def test_generator_then_strict_build(tmp_path):
    # 1. Generate the reference pages.
    gen = subprocess.run(
        [sys.executable, str(ROOT / "scripts" / "build-docs-site.py")],
        cwd=ROOT, capture_output=True, text=True,
    )
    assert gen.returncode == 0, gen.stderr
    assert "Generated 304 operations across 14 modules" in gen.stdout, gen.stdout

    # Regression: fabricated Python method names must not appear; absent ops show notice.
    page = (ROOT / "website" / "docs" / "reference" / "promotion" /
            "post_api_content_v1_recommendations_list.md").read_text(encoding="utf-8")
    assert "api_content_v1_recommendations_list_post" not in page
    # Python tab must show the unavailable notice (op absent from all clients)
    assert page.count("операция недоступна в этом клиенте") == 5

    # 2. Build the site in --strict mode (fails on broken links / nav).
    mkdocs = str(ROOT / ".venv" / "bin" / "mkdocs")
    build = subprocess.run(
        [mkdocs, "build", "--strict", "-f", str(ROOT / "website" / "mkdocs.yml"),
         "-d", str(tmp_path / "site")],
        cwd=ROOT, capture_output=True, text=True,
    )
    assert build.returncode == 0, build.stdout + build.stderr
