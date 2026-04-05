# click_api v2.4.0
**ToolkitMC** — Scoreboard + Macro tabanlı click detection sistemi

Minecraft Java Edition 1.21.11+ (pack_format 94+) için geliştirilmiştir.

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
function click_api:api/give {value:1}   # left click
function click_api:api/give {value:2}   # right click
function click_api:api/give {value:3}   # main
```

### Özel Item (give_custom)

İsim ve ek data ile item vermek için önce storage'a yaz, sonra çağır:

```mcfunction
data modify storage click_api:cmd give_name set value '{"text":"Özel İsim","italic":false}'
data modify storage click_api:cmd give_data set value {run:{Command:"say Merhaba",Delay:0}}
function click_api:api/give_custom {value:2}
```

- `give_name`: item_name component (JSON text, opsiyonel)
- `give_data`: clickAPI compound'una merge edilecek ek NBT (opsiyonel)

---

## Komut Çalıştırma

Komutlar **tıklayan oyuncu olarak** (`@s` = tıklayan) çalışır.

### Tek Komut
```
carrot_on_a_stick[custom_data={clickAPI:{type:"right_click",run:{Command:"say Hi",Delay:0}}}]
```

### Çoklu Komut
```
carrot_on_a_stick[custom_data={clickAPI:{type:"right_click",run:{Commands:[
  {cmd:"say İlk",delay:0},
  {cmd:"give @s diamond 1",delay:20}
]}}}]
```

`delay`: tick cinsinden (20 = 1 saniye). Tek komutta `Command`/`Delay` büyük harf.

---

## Cooldown Sistemi

Tıklamaya cooldown uygula — cooldown aktifken detect fonksiyonları çalışmaz:

```mcfunction
# 1 saniyelik cooldown uygula
function click_api:api/cooldown/set {ticks:20}

# Cooldown'u anında kaldır
function click_api:api/cooldown/clear

# Cooldown durumunu göster
function click_api:api/cooldown/check
```

Tipik kullanım — hook fonksiyonunun içinde:

```mcfunction
# on_right_click handler'ında
execute if score @s click_api.cooldown matches 1.. run return 0
say Tıklandı!
function click_api:api/cooldown/set {ticks:20}
```

---

## Hook Sistemi

```json
// data/senin_ns/tags/function/on_right_click.json
{"values": ["senin_ns:fonksiyon"]}
```

| Tag | Ne zaman tetiklenir |
|---|---|
| `#click_api:on_left_click` | `left_click` tipli item sol tıklandığında |
| `#click_api:on_right_click` | `right_click` tipli item sağ tıklandığında |
| `#click_api:on_main_left` | `main` tipli item sol tıklandığında |
| `#click_api:on_main_right` | `main` tipli item sağ tıklandığında |
| `#click_api:on_any_click` | Her tıklamada (tüm tipler) |
| `#click_api:on_give_left` | `api/give {value:1}` çağrıldığında |
| `#click_api:on_give_right` | `api/give {value:2}` çağrıldığında |
| `#click_api:on_give_main` | `api/give {value:3}` çağrıldığında |

Hook fonksiyonunda `@s` = tıklayan oyuncu.

---

## API Fonksiyonları

```mcfunction
# Item
function click_api:api/give {value:1|2|3}       # Hazır item ver
function click_api:api/give_custom {value:1|2|3} # Storage'dan özel item ver
function click_api:api/clear                     # Elindeki click_api item'ı kaldır

# Cooldown
function click_api:api/cooldown/set {ticks:N}    # Cooldown uygula
function click_api:api/cooldown/clear            # Cooldown kaldır
function click_api:api/cooldown/check            # Cooldown durumu

# Sistem
function click_api:api/debug_toggle              # Debug aç/kapat
function click_api:api/status                    # Sistem durumu
function click_api:api/show_events               # Son event'leri listele
function click_api:api/queue_clear               # Komut kuyruğunu temizle
function click_api:api/reset                     # Storage'ı sıfırla
function click_api:api/uninstall                 # Tamamen kaldır
```

---

## Detection Mekanizması

### Sağ Tık
`minecraft.used:minecraft.carrot_on_a_stick` stat scoreboard'u ile tespit edilir.

Farklı item için `minecraft:food` component kullanılabilir:

```mcfunction
# item'a food + custom_data ekle
/give @s minecraft:diamond_sword[
  minecraft:food={nutrition:0,saturation:0,can_always_eat:true},
  minecraft:custom_data={clickAPI:{type:"right_click"}}
]
# scoreboard oluştur (bir kez)
scoreboard objectives add my_rc minecraft.used:minecraft.diamond_sword
# kendi tick'inde kontrol et
execute as @a[scores={my_rc=1..}] if data entity @s SelectedItem.components."minecraft:custom_data"{clickAPI:{}} run function click_api:detect/right_click
execute as @a[scores={my_rc=1..}] run scoreboard players reset @s my_rc
```

### Sol Tık
`click_api:lc` data-driven enchantment efektiyle tespit edilir. Sadece **bir varlığa vurulduğunda** çalışır — havaya sol tık tespit edilemez.

---

## Değişiklik Geçmişi

### v2.4.0
- **Yeni**: `api/give_custom` — storage'dan özel isim ve data ile item ver
- **Yeni**: `api/clear` — elindeki click_api item'ını kaldır
- **Yeni**: `api/cooldown/set|clear|check` — tıklama cooldown sistemi
- **Yeni**: `api/queue_clear` — komut kuyruğunu temizle
- **Yeni**: `api/reset` — storage'ı sıfırla
- **Yeni**: `item_modifier/apply_give_name` — item_name component uygulama
- **Yeni**: Cooldown bilgisi `api/status`'a eklendi

### v2.3.1
- **Düzeltme**: Overlay klasörleri kaldırıldı (sadece `data/`)
- **Düzeltme**: `pack.mcmeta` temizlendi

### v2.2.0
- **Düzeltme**: Komutlar tıklayan oyuncu olarak çalışır (UUID queue)
- **Yeni**: `on_main_left/right`, `on_any_click`, `on_give_*` tag'leri

### v2.1.1
- **Düzeltme**: 3 eylem tipi çakışması giderildi

### v2.1.0
- **Yeni**: Çoklu komut sistemi, `main` item tipi
- **Düzeltme**: `piercing_weapon` typo, scoreboard eksiklikleri

### v2.0 / v1.0.1
- İlk sürüm
