# click_api v2.5.0
**ToolkitMC** — Scoreboard + Macro tabanlı click detection sistemi
---
> [!CAUTION]
> **Bu depo kalıcı olarak arşivlenmiştir.**
> Bu projenin geliştirilmesi durdurulmuştur. Gelecekte herhangi bir sürüm,
> güncelleme veya devam projesi planlanmamaktadır. Kod tabanı yalnızca
> referans amaçlı olduğu gibi korunmaktadır.

---

## 🗄️ Arşiv Bildirimi

Bu depo **12 Nisan 2026** tarihinde kalıcı olarak arşivlenmiştir.

**Bu proje artık bakımı yapılmamaktadır ve gelecekte herhangi bir güncelleme almayacaktır.**
Yeni sorunlar, pull request'ler, devam amaçlı fork'lar veya katkılar
incelenmeyecek ya da kabul edilmeyecektir.

Depo yalnızca tarihsel referans amacıyla herkese açık tutulmaktadır.
Kullanım tamamen kendi sorumluluğunuzdadır — mevcut veya gelecekteki
Minecraft sürümleriyle uyumluluk garanti edilmemektedir.
---
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
function click_api:api/give_all         # 3 tipin hepsini ver (test)
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

### Kuyruk Yönetimi

```mcfunction
function click_api:cmd/cancel {index:0}  # 0. komutu iptal et (0-bazlı index)
function click_api:api/queue_clear       # tüm kuyruğu temizle
```

---

## Cooldown Sistemi

Cooldown aktifken detect fonksiyonları çalışmaz:

```mcfunction
function click_api:api/cooldown/set {ticks:20}  # 1 saniyelik cooldown
function click_api:api/cooldown/clear            # anında kaldır
function click_api:api/cooldown/check            # durumu göster
```

Tipik kullanım — hook fonksiyonunun içinde:

```mcfunction
# on_right_click handler'ında
execute if score @s click_api.cooldown matches 1.. run return 0
say Tıklandı!
function click_api:api/cooldown/set {ticks:20}
```

---

## Item Transfer Sistemi

Click_api item'ını bir oyuncudan diğerine taşı:

```mcfunction
# 1. Kaynaktan storage'a kaydet (item elden düşer)
execute as <kaynak> run function click_api:api/transfer/save

# 2. Hedefe ver
execute as <hedef> run function click_api:api/transfer/give

# Bekleyen item'ı kontrol et (opsiyonel)
function click_api:api/transfer/peek
```

---

## Event Sistemi

```mcfunction
# Son event'leri listele
function click_api:api/show_events

# Geçmişi temizle
function click_api:event/history/clear

# Son event'i storage'a kopyala (macro kullanımı için)
function click_api:event/history/get
# -> storage click_api:event last_event = {type:"...", player_id:N}
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

## API Referansı

```mcfunction
# Item
function click_api:api/give {value:1|2|3}       # Hazır item ver
function click_api:api/give_all                  # 3 tipin hepsini ver
function click_api:api/give_custom {value:1|2|3} # Storage'dan özel item ver
function click_api:api/clear                     # Elindeki click_api item'ı kaldır

# Transfer
function click_api:api/transfer/save             # Item'ı storage'a kaydet
function click_api:api/transfer/give             # Storage'dan item al
function click_api:api/transfer/peek             # Bekleyen item'ı göster

# Cooldown
function click_api:api/cooldown/set {ticks:N}    # Cooldown uygula
function click_api:api/cooldown/clear            # Cooldown kaldır
function click_api:api/cooldown/check            # Cooldown durumu

# Komut Kuyruğu
function click_api:cmd/cancel {index:N}          # N. komutu iptal et
function click_api:api/queue_clear               # Kuyruğu temizle

# Event
function click_api:event/history/clear           # Geçmişi temizle
function click_api:event/history/get             # Son event'i storage'a kopyala

# Sistem
function click_api:api/debug_toggle              # Debug aç/kapat
function click_api:api/status                    # Sistem durumu
function click_api:api/show_events               # Son event'leri listele
function click_api:api/reset                     # Storage'ı sıfırla
function click_api:api/uninstall                 # Tamamen kaldır
```

---

## Detection Mekanizması

### Sağ Tık
`minecraft.used:minecraft.carrot_on_a_stick` stat scoreboard'u ile tespit edilir.

Farklı item için `minecraft:food` component kullanılabilir:

```mcfunction
/give @s minecraft:diamond_sword[
  minecraft:food={nutrition:0,saturation:0,can_always_eat:true},
  minecraft:custom_data={clickAPI:{type:"right_click"}}
]

scoreboard objectives add my_rc minecraft.used:minecraft.diamond_sword
execute as @a[scores={my_rc=1..}] if data entity @s SelectedItem.components."minecraft:custom_data"{clickAPI:{}} run function click_api:detect/right_click
execute as @a[scores={my_rc=1..}] run scoreboard players reset @s my_rc
```

### Sol Tık
`click_api:lc` data-driven enchantment efektiyle tespit edilir. Sadece **bir varlığa vurulduğunda** çalışır — havaya sol tık tespit edilemez.

---

## Değişiklik Geçmişi

### v2.5.0
- **Yeni**: `api/give_all` — 3 tipin hepsini ver
- **Yeni**: `api/transfer/save|give|peek` — item transfer sistemi
- **Yeni**: `cmd/cancel {index:N}` — kuyruktan komut iptal et
- **Yeni**: `event/history/clear` — event geçmişini temizle
- **Yeni**: `event/history/get` — son event'i storage'a kopyala

### v2.4.1
- **Düzeltme**: `lc_dealt` scoreboard kaldırıldı (yanlış stat, enchantment zaten handle ediyor)
- **Düzeltme**: `apply_data` entity NBT merge yerine `item modify` kullanıyor

### v2.4.0
- **Yeni**: `api/give_custom`, `api/clear`, `api/cooldown/*`, `api/queue_clear`, `api/reset`
- **Yeni**: `item_modifier/apply_give_name|apply_give_data`

### v2.3.1
- **Düzeltme**: Overlay klasörleri kaldırıldı, `pack.mcmeta` temizlendi

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
