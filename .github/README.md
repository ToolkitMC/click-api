# click_api

> ToolkitMC | Carrot on a Stick click detection library for Minecraft Java Edition datapacks.

**Contributors:** tickwarden, asn44nb  
**License:** MIT  
**Supported versions:** 1.21.4 → 26.1 (pack formats 61–96)

---

## Features

- ✅ Right click detection
- ✅ Left click entity detection
- ✅ Hook-based API
- ✅ Macro tabanlı komut desteği
- ✅ Uninstall fonksiyonu

---

## Installation

`datapacks/` klasörüne koyun, `/reload` çalıştırın.

---

## Hook Kullanımı

Click eventlerini dinlemek için kendi packinizden tag'e fonksiyon ekleyin:

**`data/click_api/tags/function/on_right_click.json`**
```json
{
  "values": [
    "senin_namespace:fonksiyon1"
  ]
}
```

**`data/click_api/tags/function/on_left_click.json`**
```json
{
  "values": [
    "senin_namespace:fonksiyon2"
  ]
}
```

Fonksiyon `@s` = tıklayan oyuncu context'inde çalışır.

| Tag | Tetikleyici |
|-----|-------------|
| `#click_api:on_right_click` | Sağ tık (carrot_on_a_stick) |
| `#click_api:on_left_click` | Sol tık entity'ye (carrot_on_a_stick) |

---

## Komut Desteği

```mcfunction
function click_api:cmd/run {Command:"gamemode creative @s"}
function click_api:cmd/run {Command:"say Merhaba"}
```

- Komut başına `/` koymaya gerek yok
- `@s` ve `at @s` context geçerlidir
- 1.20.2+ macro sistemi kullanılır

---

## Uninstall

```
/function click_api:api/uninstall
```

---

## Overlay Mimarisi

| Klasör | Sürüm | Pack Format |
|--------|-------|-------------|
| `data/` (base) | 1.21.x ve 26.x | 48–101 |

---

## Limitations

- **Air left click** Minecraft'ta tespit edilemez.
- Left click blok için [`enchantment/lc.json`](https://github.com/ToolkitMC/click-api/blob/main/data/click_api/enchantment/lc.json) stat tabanlı kendi sisteminizi kurabilirsiniz.

---

## License

MIT © ToolkitMC
