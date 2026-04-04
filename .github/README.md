# click_api v2.1.0
**ToolkitMC** — Scoreboard + Macro tabanlı click detection sistemi

Minecraft Java Edition 1.21.4+ (pack_format 61+) için geliştirilmiştir.

---

## Kurulum

Datapack'i dünyanızın `datapacks/` klasörüne koyun, ardından `/reload` çalıştırın.

---

## Item Tipleri

| Type | Açıklama | give value |
|---|---|---|
| `left_click` | Sadece sol tıklamayı yakalar | `1` |
| `right_click` | Sadece sağ tıklamayı yakalar | `2` |
| `main` | Her ikisini de yakalar | `3` |

```mcfunction
# Hazır item ver
function click_api:api/give {value:1}   # left click
function click_api:api/give {value:2}   # right click
function click_api:api/give {value:3}   # main (her ikisi)
```

---

## Komut Çalıştırma

Item'ın `custom_data` bileşenine `clickAPI.run` eklenerek tıklandığında otomatik komut çalıştırılabilir.

### Tek Komut
```
carrot_on_a_stick[custom_data={clickAPI:{type:"right_click",run:{Command:"say Merhaba!",Delay:0}}}]
```

### Çoklu Komut (v2.1+)
```
carrot_on_a_stick[custom_data={clickAPI:{type:"right_click",run:{Commands:[
  {cmd:"say İlk komut",delay:0},
  {cmd:"say 1 saniye sonra",delay:20},
  {cmd:"say 2 saniye sonra",delay:40}
]}}}]
```

- `Delay` / `delay`: Tick cinsinden gecikme (0 = anında, 20 = 1 saniye)
- `Commands` listesinde `cmd` ve `delay` anahtarları kullanılır
- Tek komut formatında `Command` ve `Delay` (büyük harf) kullanılır

---

## Hook Sistemi

Kendi fonksiyonlarını `on_left_click` veya `on_right_click` tag'ine ekle:

```json
// data/senin_namespace/tags/function/on_left_click.json
{
  "values": ["senin_namespace:sol_tiklama_handler"]
}
```

---

## API Fonksiyonları

```mcfunction
function click_api:api/give {value:1|2|3}  # Item ver
function click_api:api/debug_toggle         # Debug aç/kapat
function click_api:api/status               # Sistem durumu
function click_api:api/show_events          # Son event'leri listele
function click_api:api/uninstall            # Temizle
```

---

## Detection Mekanizması

- **Right click**: `minecraft.used:minecraft.carrot_on_a_stick` scoreboard ile tespit
- **Left click**: `minecraft:post_piercing_attack` enchantment effect ile tespit (`click_api:lc`)
- **Main**: Her ikisi birden

---

## Değişiklik Geçmişi

### v2.1.0
- **Yeni**: Çoklu komut sistemi (`Commands:[{cmd,delay},...]`)
- **Yeni**: `main` item tipi (hem left hem right click)
- **Yeni**: `api/give {value:3}` ile main item verilmesi
- **Düzeltme**: `minecraft:piercing_weapo` typo → `minecraft:piercing_weapon`
- **Düzeltme**: `click_api.lc_dealt` scoreboard objective artık `load`'da oluşturuluyor
- **Düzeltme**: `click_api.debug` scoreboard `load`'a taşındı
- **Düzeltme**: `api/status` artık `click_api.temp` kullanıyor (rc değil)
- **Düzeltme**: `uninstall` yeni storage ve scoreboard'ları temizliyor
- **Düzeltme**: CRLF → LF satır sonları normalize edildi

### v2.0 / v1.0.1
- İlk sürüm
