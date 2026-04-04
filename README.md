# click_api

> ToolkitMC | Carrot on a Stick click detection library for Minecraft Java Edition datapacks.

**Contributors:** tickwarden, asn44nb  
**License:** MIT  
**Supported versions:** 1.21.4 → 26.1 (pack formats 61–96)

---

## Features

- ✅ Right click detection (`using_item` advancement)
- ✅ Left click entity detection (`player_hurt_entity` advancement)
- ✅ Auto-revoke (repeatable clicks)
- ✅ Hook-based API (`#click_api:on_right_click`, `#click_api:on_left_click`)
- ✅ Multi-version overlay architecture
- ⚠️ Air left click is not detectable in vanilla Minecraft

---

## Installation

Drop the datapack into your `datapacks/` folder and run `/reload`.

---

## Usage

To listen for clicks in your own datapack, add your function to the click_api tags:

**`data/click_api/tags/function/on_right_click.json`**
```json
{
  "values": [
    "your_namespace:your_function"
  ]
}
```

Your function runs with `@s` = the player who clicked.

### Available hooks

| Tag | Trigger |
|-----|---------|
| `#click_api:on_right_click` | Player right-clicks with carrot_on_a_stick |
| `#click_api:on_left_click` | Player left-clicks an entity with carrot_on_a_stick |

---

## Limitations

- **Air left click** cannot be detected in vanilla Minecraft — no stat or advancement covers it.
- Left click on blocks triggers `player_hurt_entity` only if the block has an entity hitbox. For true block left click, use a separate `minecraft.mined` stat objective in your own pack.

---

## License

MIT © ToolkitMC