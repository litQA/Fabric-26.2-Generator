# Changelog

## 2026.3-2.11.4

### Fixes

- Updated the block place and multi-place triggers to use Fabric's `BLOCK_PLACE` and `BLOCK_MULTIPLACE` callbacks. This removes the invalid `BlockEvents.USE_ITEM_ON` reference that broke Croparium's `BlockPlacedBusProcedure`.
- Updated the equipment layer mixin to use the texture returned by `getArmorTexture(...)`, so a custom armor model texture is no longer replaced by the equipment JSON texture.

### Validation

- Parsed 1,721 generator templates with zero Freemarker failures.
- MCreator `GeneratorsTest` passed for `fabric-26.2`.
- Everrose, Melon and Croparium regenerated and built successfully with Gradle 9.8 and Java 25 after the trigger and armor texture fixes.
- The Melon workspace starts its Fabric client; the corrected helmet texture still needs final in-game visual confirmation.

## 2026.3-2.11.3

### New Content

- Added all 13 block-inventory procedures (`get_item`, `get_amount`, slot count and limit, insert, extract, clear, set, remove, damage, and result variants) for vanilla `Container` block entities on Fabric.
- Added entity, item and block NBT procedures for numbers, logic, text and item stacks. Entity and item data use 26.2 data components; block data uses a Fabric data attachment.
- Added the `player_useitem_finish` trigger and a living-entity finish-use event.
- Added entity item-stack NBT helpers and a persistent `BLOCK_NBT` attachment to generated mods.

### Fixes

- Replaced private Minecraft 26.2 `Items.registerItem` calls with public registry registration and `Item.Properties.setId`.
- Fixed `Models` and `DispenseBehaviors` being referenced when their element types were empty.
- Fixed block-inventory procedure blocks that generated empty expressions (`sn = ;`, `if ( == ...)`, `slotNum = ;`).
- Fixed entity and block NBT procedure blocks that generated empty or unsupported expressions.
- Fixed the block NBT attachment reference to use the generated mod class name directly.
- Added the missing `player_useitem_finish` procedure so existing workspaces no longer reference an ungenerated class.
- Verified the fixes against the Everrose, Melon and Croparium workspaces.

### Validation

- Parsed 1,721 generator templates with zero Freemarker failures.
- MCreator `GeneratorsTest` passed for `fabric-26.2`.
- Everrose, Melon and Croparium regenerated and built successfully with Gradle 9.8 and Java 25.
- A synthetic procedure covering entity, item and block NBT getters/setters compiled successfully.

### Known Limitations

- NeoForge capability procedures other than vanilla-container block inventory (energy, fluids and general item-handler capabilities) are not available on Fabric.
- Fabric has no NeoForge-style global loot modifier registry.
- The armor piglin-neutral mixin behavior remains disabled; tag-based piglin-loved behavior is retained.
- The client has not been launched in a real Minecraft 26.2 instance; runtime behavior still needs real-machine verification.
- A third-party Forge Config API Port plugin can add its own procedure blocks; its standalone `stringlist_iterator` test block is not valid outside its foreach block and is not part of this generator.

## 2026.3-2.11.2.2-beta

### New Content

- Added the Fabric generator for Minecraft 26.2 with plugin id `generator-fabric-26.2`.
- Added embedded private datapack and Forge-template bases so the generator is self-contained.
- Added Minecraft 26.2 brewing support through `FabricPotionBrewingBuilder`.
- Added 26.2-compatible feature registration, including configured and placed feature generation.
- Added the `item_is_piglin_currency` procedure block with a 26.2-compatible implementation.
- Added the `vector_cross` procedure block for 26.2 `Vec3.cross`.

### Changes

- Target metadata updated to MCreator 2026.3.44621, Minecraft 26.2, Fabric Loader 0.20.1 and Fabric API 0.160.0+26.2.
- Gradle workspace updated to Gradle 9.9.1, Java 25 and Loom 1.19-SNAPSHOT.
- Data pack format updated to 107.1.
- Documentation moved to the `docs/` folder, with a project README added.
- License changed to CC BY 4.0.
- Removed the obsolete `pluginPageID` field from `plugin.json`.
- Added an automatic install step for the bundled MCreator application.
- Data templates were rebased on the 26.1.2 schema where it matches 26.2, while keeping the 2026.3 element model.
- Block, item, entity, particle, sound and feature mappings were filtered or rebuilt for 26.2.
- Mixin `defaultRequire` is 0; individual injections use `require = 0`.
- The generated workspace wrapper uses the public Gradle 9.9.1 HTTPS distribution.

### Fixes

- Fixed 26.3-only feature interfaces and mappings, including `FeaturePlaceContext`, `TreeGrower` and configured-feature JSON.
- Fixed 26.2 biome registration and surface-rule calls.
- Fixed 26.2 client rendering APIs, including camera access, render passes and armor layers.
- Fixed 26.2 procedure APIs for invulnerability time, attack swinging, inventory removal and totem-like animation.
- Replaced removed Fabric API events with `BlockEvents.USE_ITEM_ON` and `ItemEvents.USE_ON` alternatives.
- Fixed block/item/entity identifiers that do not exist in 26.2.

### Known Limitations

- NeoForge capability procedures (energy, fluid tanks, item handlers and capability-based block inventories) are not available in this Fabric generator.
- Fabric has no NeoForge-style global loot modifier registry; the custom-loot-table-as-loot-modifier feature is not implemented.
- The armor piglin-neutral mixin behavior is disabled because 26.2 does not expose the needed item override; the item tag-based piglin-loved behavior is retained.
- Some 26.2 procedure and trigger blocks require real-machine verification in MCreator; the automated sample workspace does not exercise every block.
- The generated sample workspace was compiled and built, but the client has not yet been launched in a real Minecraft 26.2 instance.
