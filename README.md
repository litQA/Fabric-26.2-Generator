# Fabric Generator 26.2

Fabric generator plugin for MCreator 2026.3, targeting Minecraft 26.2.

## Target

- MCreator: 2026.3.44621
- Minecraft: 26.2
- Fabric Loader: 0.20.1
- Fabric API: 0.160.0+26.2
- Java: 25
- Gradle: 9.9.1

## Build

```powershell
..\caches\gradle-9.9.1\gradle-9.9.1\bin\gradle.bat --no-daemon --offline clean build
```

The plugin archive is written to `build/libs/generator-fabric-26.2.zip`.

When the bundled MCreator application is present at `../apps/MCreatorEAP2026344621`, the build also copies the archive into its `plugins` folder.

## Install

Copy `build/libs/generator-fabric-26.2.zip` into the MCreator `plugins` directory and restart MCreator.

## Documentation

- `docs/CHANGELOG.md`
- `docs/MIGRATION-REPORT.md`

## License

This project is licensed under the Creative Commons Attribution 4.0 International License (CC BY 4.0). See `LICENSE`.
