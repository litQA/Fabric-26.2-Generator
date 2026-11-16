# Migration Report: Fabric Generator 26.2

## Baseline and Target

| Item | Value |
| --- | --- |
| Baseline MCreator | 2026.3 (Fabric-Generator-MCreator-26.3-2026.3-2.10.1) |
| Target MCreator | 2026.3.44621 |
| Plugin version | 2026.3-2.11.3 |
| Target Minecraft | 26.2 |
| Fabric Loader | 0.20.1 |
| Fabric API | 0.160.0+26.2 |
| Java | 25 |
| Gradle | 9.9.1 |
| Data pack format | 107.1 |
| Generator id | generator-fabric-26.2 |
| Supported MCreator versions | 202600344621–202600399999 |
| License | CC BY 4.0 |

The element model, procedures, triggers and 2026.3 feature definitions were taken from the official Fabric generator for MCreator 2026.3 (`Fabric-Generator-MCreator-26.3-2026.3-2.10.1`). Data templates and Java templates were rebased on the official Fabric 26.1.2 generator (`Fabric-Generator-MCreator-26.1.2-2026.3-2.8.1`) and the NeoForge 26.1.2 datapack base where the 26.2 schema matches those versions.

The generator embeds two private bases:

- `fabric-26.2-base/datapack`
- `fabric-26.2-base/neoforge`

Only the main `fabric-26.2` generator carries element definitions and `generator.yaml`; the embedded bases contribute templates, mappings, Blockly folders and workspace support files.

Because the upstream Fabric 2026.3 generator already targets the same MCreator line, the forced `new_features_from_2021.md` interval is empty: entries for 2026.3 and earlier are baseline-covered and excluded from this migration's mandatory feature mapping. The table below still compares the 2026.3 features called out by the project specification and records their Fabric status.

## Feature Applicability

| 2026.3 feature | Status | Notes |
| --- | --- | --- |
| Armor unbreakable | Supported | 26.2 `DataComponents.MAX_DAMAGE` path retained. |
| Synced data as entity layer conditions | Supported | 2026.3 layer conditions retained; render-state data key provided by Fabric API. |
| Attribute modifiers on enchantments | Supported | Enchantment component and effect templates retained. |
| Creative tab hide-title | Supported | 26.2 `CreativeModeTab.Builder.hideTitle()` exists. |
| Custom attack AI | Supported | 2026.3 AI task templates retained. |
| Entity is-moving procedure | Supported | 26.2 `Entity` movement API. |
| Item repair / is-empty / can-be-hurt procedures | Supported | 26.2 `ItemStack` APIs verified. |
| Item piglin-currency procedure | Supported | Implemented with `PiglinAi.BARTERING_ITEM`. |
| Multipart block states | Supported | 2026.3 multipart shape merge retained. |
| Synced data as animation conditions | Supported | 2026.3 living-entity renderer paths retained. |
| Shadow block procedure behavior | Requires real-machine verification | Templates compile; not exercised by the random sample. |
| Custom block force redstone conduction | Supported | 2026.3 block flag merged into the 26.2 block template. |
| Custom loot tables as loot modifiers | Not applicable on Fabric | NeoForge global loot modifier registry does not exist on Fabric. |
| Dimension void worldgen type | Supported | 26.2 void dimension template retained. |
| Enchantment weapon damage/knockback and armor effectiveness | Supported | 2026.3 enchantment effects retained. |
| Enchantment value modifiers and application order | Supported | 2026.3 enchantment definitions retained. |
| Level-based enchantment numeric inputs | Supported | 2026.3 enchantment effect model retained. |
| Raytrace water/fall resetting modes | Requires real-machine verification | Existing raytrace procedure templates compile; modes are core-driven. |
| Strong redstone power for a block face | Supported | 26.2 `SignalGetter.getDirectSignal` implementation. |
| Vector dot/cross | Supported | Dot retained; cross template added for 26.2 `Vec3.cross`. |
| Entity line-of-sight / invulnerability / attack cooldown / force attack | Supported | 26.2 public fields and methods verified. |
| Dry foliage color/tint | Supported | Biome template and block/plant/fluid tint paths retained. |
| 2026.2 advancement trigger setup | Supported | 2026.3 advancement definitions/templates retained. |
| 2026.2 armor trims | Supported | 26.2 trim atlas path restored. |
| 2026.2 skybox/sun/moon | Supported | 26.2 render-pass API used. |
| 2026.2 block inventory insert/extract | Supported for vanilla containers | 13 procedure templates cover slot access, count, insert, extract, clear, remove, set, damage and result variants through `Container`/`BlockEntity`; NeoForge item-handler capabilities remain unavailable. |
| Entity, item and block NBT | Supported | Entity/item values use `DataComponents.CUSTOM_DATA`; block values use a persistent Fabric data attachment. Number, logic, text and item-stack variants are covered. |
| `player_useitem_finish` trigger | Supported | Added a Fabric `FINISH_USE_ITEM` living-entity event and `completeUsingItem` mixin hook. |
| 2026.2 special/raft entities and rarity | Supported | 2026.3 element definitions retained. |
| 2026.2 Blockly enchantment effects | Supported | 2026.3 enchantment effect definitions retained. |

## Destructive Changes

- The 26.3 data pack format (121.0) was replaced with the 26.2 format (107.1).
- The 26.3 `worldgen/feature` layout was replaced with 26.2 `worldgen/configured_feature`.
- 26.3 `material_rule`, `context_int_provider` and `recipe/brewing` data/templates were removed because 26.2 has no corresponding registries or recipe type.
- Feature mappings were changed from 26.3 scalar values to 26.1.2 three-field class/configuration/id lists.
- Block/item/entity/particle/sound mappings that referenced 26.3-only identifiers were filtered for 26.2.
- 26.3-only item/block mixins used by the removed trigger events were deleted; the affected triggers use Fabric `USE_ITEM_ON` and `USE_ON` events instead.
- Mixin injection points that no longer exist in 26.2 were updated or removed. Remaining injections use `require = 0`.

## Verification

- Plugin ZIP builds successfully with Gradle 9.8.0 and Gradle 9.9.1 under Java 25.
- Freemarker parsing: 1,721 templates, 0 failures.
- MCreator `GeneratorsTest` passes for `fabric-26.2`, including element, procedure, trigger, feature, enchantment, AI and JSON coverage.
- Three real MCreator workspaces were regenerated and built with Gradle 9.8.0 and Java 25:
  - Everrose: 177 elements, build passed.
  - Melon: 430 elements, build passed.
  - Croparium: 493 elements, build passed, including the third-party Procedure Renamer post-process.
- A synthetic procedure covering entity, item and block NBT number/logic/text/item-stack getters and setters compiled successfully.
- The generated sample workspace used for the isolated generator test compiles and builds. When the third-party Forge Config API Port plugin is also loaded, its standalone `stringlist_iterator` test block is not valid outside the plugin's foreach block; this is a third-party test artifact, not a Fabric generator failure.
- The client has not yet been launched against a real Minecraft 26.2 instance.
- Texture-reference validation was skipped in the isolated test environment because it has no vanilla texture cache; this does not indicate a generator failure.

## Known Limitations

- NeoForge capability systems are intentionally not present. This excludes energy, fluid-tank and generic item-handler capability procedure blocks; block inventory is supported only for block entities implementing vanilla `Container`.
- Block NBT requires a block entity. The persistent data attachment is not available for plain blocks without one.
- Custom loot tables cannot be injected as NeoForge-style global loot modifiers on Fabric.
- The piglin-neutral armor mixin behavior is disabled because the required 26.2 item override is absent. Normal `minecraft:piglin_loved` item tagging remains available for the item piglin-currency option.
- Third-party MCreator plugins (for example Forge Config API Port and Procedure Renamer) provide their own element types and procedure blocks. Their behavior is outside this generator; installed plugins must match the target MCreator line.
- Some procedure/trigger blocks compile but are not covered by the real workspaces and need real-machine testing.
- Only Minecraft 26.2 is supported. The same generator must not be used for 26.1.2 or 26.3 workspaces.
