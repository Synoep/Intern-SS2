# AMFI NAV Extractor

This script extracts **Scheme Name** and **Net Asset Value (NAV)** from [AMFI India NAV data](https://www.amfiindia.com/spages/NAVAll.txt) and saves it in:

- `amfi_schemes.tsv` (Tab-separated format)
- `amfi_schemes.json` (Optional, if `jq` is installed)

---

## 📦 Requirements

- `curl`
- `awk`
- (Optional) `jq` for JSON formatting

---

## ▶️ Usage

```bash
chmod +x extract_nav.sh
./extract_nav.sh
