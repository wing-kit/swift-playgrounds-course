# Swift Playgrounds (Mac) — Basics

Built for **Wing Kit Leung**: learn core Swift in the **Swift Playgrounds Mac app** from scratch. All lessons use a **Blank** playground (`print` for output) — no SwiftUI yet.

Tone: clear teaching English; every lesson has paste-ready code, exercises, and common mistakes.

After this track, go up one level to **Advanced** (`../lessons/`):
- Want a combined refresher: open `../lessons/01-basics-refresh.md`
- Already solid on basics: jump to `../lessons/02-swiftui-app.md` for SwiftUI

---

## How to open

1. Install **Swift Playgrounds** from the Mac App Store (free).
2. Open the app → **New Playground → Blank** (all eight basics lessons use Blank).
3. Clear any default sample, paste the “Full code” from `lessons/B0X-….md`.
4. Press ▶ and watch `print` output in the results pane.
5. Files in `snippets/` are the same code as plain `.swift` for easy copying.

> Note: this is a **curriculum**. It will not remotely change your Mac. Paste and run locally.

---

## Course map (suggested order)

| # | File | Topic | Playground | Est. time |
|---|------|------|------------|----------|
| B01 | `lessons/B01-hello-print.md` | `print`, comments, first program | Blank | ~15 min |
| B02 | `lessons/B02-let-var-types.md` | `let` / `var`, types, inference | Blank | ~20 min |
| B03 | `lessons/B03-strings.md` | Strings, interpolation, multiline | Blank | ~15 min |
| B04 | `lessons/B04-control-flow.md` | Operators, `if` / `else`, `switch`, `guard` intro | Blank | ~20 min |
| B05 | `lessons/B05-loops-arrays.md` | Loops, ranges, arrays | Blank | ~20 min |
| B06 | `lessons/B06-collections-optionals.md` | Dictionaries, sets, Optional | Blank | ~25 min |
| B07 | `lessons/B07-functions-closures.md` | Functions, parameters, return, closures intro | Blank | ~25 min |
| B08 | `lessons/B08-structs-enums.md` | struct, enum, protocol intro → into SwiftUI | Blank | ~25 min |

Total ~**2.5–3 hours** (fine to spread across days).

---

## Folder layout

```
basics/
├── README.md              ← you are here
├── CHEATSHEET.md          ← basics syntax cheat sheet
├── lessons/
│   ├── B01-hello-print.md
│   ├── …
│   └── B08-structs-enums.md
└── snippets/
    ├── B01-hello-print.swift
    ├── …
    └── B08-structs-enums.swift
```

---

## Study tips

1. **Follow B01→B08 in order** — later lessons reuse earlier types and syntax.
2. **Finish each lesson’s exercises** before the next.
3. On errors, read “Common mistakes” and `CHEATSHEET.md`.
4. Basics done → open `../README.md` for advanced (start at 02, or do advanced 01 as a quiz).

---

## Done when

- [ ] B01–B08 code all runs
- [ ] You can explain `let` vs `var`, Optional, `if let` / `guard let`
- [ ] You can write simple `func`, `struct`, `enum`
- [ ] Ready for advanced lesson 02 (SwiftUI App)

Next: `../lessons/02-swiftui-app.md`.
