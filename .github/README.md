# click_api

> ToolkitMC | Carrot on a Stick click detection library for Minecraft Java Edition datapacks.

**Contributors:** tickwarden, asn44nb  
**License:** MIT  
**Supported versions:** 1.21.4 → 26.1 (pack formats 61–96)

---

## Features

- ✅ Right click detection (`using_item` advancement)
- ✅ Left click entity detection (`player_hurt_entity` advancement)
- ✅ Auto-revoke (tekrar tıklanabilir)
- ✅ Hook-based API (`#click_api:on_right_click`, `#click_api:on_left_click`)
- ✅ Macro tabanlı komut desteği (`click_api:cmd/run`)
- ✅ Uninstall fonksiyonu
- ✅ Overlay mimarisi (1.21.4 / 1.21.5 / 26.1)
- ⚠️ Air left click tespit edilemez (Minecraft kısıtlaması)

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
    "senin_namespace:fonksiyon_adi"
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
/function click_api:uninstall
```

---

## Overlay Mimarisi

| Klasör | Sürüm | Pack Format |
|--------|-------|-------------|
| `data/` (base) | 1.21.4 | 61–70 |
| `overlay_1_21_5/` | 1.21.5 | 71–93 |
| `overlay_26_1/` | 26.1 | 95–96 |

---

## Limitations

- **Air left click** Minecraft'ta tespit edilemez.
- Left click blok için `minecraft.mined` stat tabanlı kendi sisteminizi kurabilirsiniz.

---

## License

MIT © ToolkitMC
