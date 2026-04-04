# click_api v2.3.1
**ToolkitMC** — Scoreboard + Macro tabanlı click detection sistemi

Minecraft Java Edition 1.21.0+ (pack_format 48+) için overlay desteğiyle geliştirilmiştir.

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
Komutlar **tıklayan oyuncu olarak** (`@s` = tıklayan) çalışır.

### Tek Komut
```
carrot_on_a_stick[custom_data={clickAPI:{type:"right_click",run:{Command:"say Merhaba!",Delay:0}}}]
```

### Çoklu Komut
```
carrot_on_a_stick[custom_data={clickAPI:{type:"right_click",run:{Commands:[
  {cmd:"say İlk komut",delay:0},
  {cmd:"say 1 saniye sonra",delay:20},
  {cmd:"say 2 saniye sonra",delay:40}
]}}}]
```

- `Delay` / `delay`: Tick cinsinden gecikme (0 = anında, 20 = 1 saniye)
- `Commands` listesinde `cmd` ve `delay` küçük harf; tek komutta `Command` ve `Delay` büyük harf

---

## Hook Sistemi

```json
// data/senin_namespace/tags/function/on_right_click.json
{"values": ["senin_namespace:fonksiyon_adi"]}
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
function click_api:api/give {value:1|2|3}  # Item ver
function click_api:api/debug_toggle         # Debug aç/kapat
function click_api:api/status               # Sistem durumu
function click_api:api/show_events          # Son event'leri listele
function click_api:api/uninstall            # Temizle
```

---

## Detection Mekanizması

### Sağ Tık

`minecraft.used:minecraft.carrot_on_a_stick` stat scoreboard'u ile tespit edilir.
Carrot_on_a_stick dışında bir item'a sağ tık tespiti eklemek için `minecraft:food` component kullanılabilir:

```mcfunction
# 1. Item'a food component + custom_data ekle
/give @s minecraft:diamond_sword[
  minecraft:food={nutrition:0,saturation:0,can_always_eat:true},
  minecraft:custom_data={clickAPI:{type:"right_click"}}
]

# 2. Scoreboard oluştur (bir kez)
scoreboard objectives add my_sword_rc minecraft.used:minecraft.diamond_sword

# 3. Tick'e ekle (kendi datapack'in)
execute as @a[scores={my_sword_rc=1..}] if data entity @s SelectedItem.components."minecraft:custom_data"{clickAPI:{}} run function click_api:detect/right_click
execute as @a[scores={my_sword_rc=1..}] run scoreboard players reset @s my_sword_rc
```

Bu sayede herhangi bir item'a sağ tık tespiti eklenebilir — carrot_on_a_stick tutmak zorunda kalmazsın.

### Sol Tık

Data-driven enchantment efektiyle tespit edilir. `click_api:lc` enchantment'ı item'a uygulanır.
Sol tık tespiti **bir varlığa vurulduğunda** çalışır; **havaya sol tık** tespit edilemez (Minecraft motoru kısıtlaması).

| Sürüm | Format | Enchantment efekt key |
|---|---|---|
| 1.21.0 – 1.21.4 | 48–70 | `minecraft:post_piercing_attack` |
| 1.21.5+ | 71+ | `minecraft:post_attack` (`enchanted: attacker`, `affected: victim`) |

---

## Sürüm Uyumluluğu (Overlay Sistemi)

| Format | MC Sürümü | Overlay | Fark |
|---|---|---|---|
| 48–60 | 1.21.0–1.21.3 | `1_21/` | `piercing_weapon` component yok |
| 61–70 | 1.21.4–1.21.x | base | `piercing_weapon` component var |
| 71+ | 1.21.5+ | `1_21_5/` | `post_attack` enchantment key |

---

## Değişiklik Geçmişi

### v2.3.1
- **Düzeltme**: Overlay klasörleri root'a taşındı (`1_21/`, `1_21_5/`)
- **Düzeltme**: `pack.mcmeta`'ya `min_format`/`max_format` eklendi

### v2.3.0
- **Yeni**: Overlay sistemi — 1.21.0+ geniş sürüm desteği
- **Yeni**: `1_21/` overlay (1.21.0-1.21.3)
- **Yeni**: `1_21_5/` overlay (1.21.5+, `post_attack`)

### v2.2.0
- **Düzeltme**: Komutlar tıklayan oyuncu olarak çalışır (UUID queue sistemi)
- **Yeni**: `on_main_left`, `on_main_right`, `on_any_click`, `on_give_*` hook tag'leri

### v2.1.1
- **Düzeltme**: 3 eylem tipi çakışması giderildi

### v2.1.0
- **Yeni**: Çoklu komut sistemi, `main` item tipi
- **Düzeltme**: `piercing_weapon` typo, scoreboard eksiklikleri, CRLF

### v2.0 / v1.0.1
- İlk sürüm
