# Generated output — do not edit directly

Everything in this directory except this notice is derivative output. Change the human-authored source, run the owning generator, and review the complete regenerated diff. Do not patch generated Dart or schema output by hand.

## Current source map

`generated/dart/**`, `generated/json-schema/**`, and `../lib/src/env/generated.dart` are configuration projections generated from the repository-root `.cli-flags.toml` catalog by the flags-2-env toolchain. `.cli-flags.toml` remains the authority for these CLI/environment settings. The JSON Schema files in this directory are generated validators for that catalog; they are not a separately human-authored contract authority.

A CLI/environment catalog is not an application-domain, local-IPC, or network protocol. It therefore does **not** require a duplicate TypeSpec model merely to satisfy a file-layout rule. The generated-policy workflow requires `.cli-flags.toml` to change whenever these projections change.

## Semantic cross-language contracts

For generated application models, persisted interchange, local IPC, or remote wire types, TypeSpec and JSON Schema/OpenAPI must be independent, human-authored peer authorities. Neither may be generated from the other as the ultimate source of truth. Their independently generated normalized outputs must agree, and a machine-readable reconciliation receipt must be committed under `../contracts/parity/` before derivative output changes are mergeable.

A TypeSpec, JSON Schema, or OpenAPI document placed below `generated/` is derivative output and never satisfies the human-authored peer-authority requirement.

## Flutter/UI boundary

A Flutter desktop or mobile application does not need to expose a public API merely because it consumes generated configuration or DTOs. Dart/Flutter owns presentation and client behavior. Generate code only for a real boundary such as configuration, persisted state, local IPC, or an explicit remote service contract—not for widget implementation details.

## Regenerate and freeze

Use the repository generator for `.cli-flags.toml`, review the full diff, then run:

```sh
scripts/freeze-generated.sh
```

The helper freezes derivative files and generated subdirectories while leaving this human-authored notice writable. Git stores the regular-versus-executable bit, not arbitrary owner-write bits, so a fresh checkout restores ordinary files as writable. CI and source/output change gates are the durable controls; local `chmod a-w` is an additional deterrent.
