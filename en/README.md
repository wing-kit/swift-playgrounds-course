# Swift Playgrounds Course (Mac + iPad)

> **Language:** English · [粵語（預設）](../README.md) · [繁體中文](../zh-Hant/README.md)


Built for **Wing Kit Leung**: learn Swift in **Swift Playgrounds** (Mac or iPad) from scratch through a working Mini Todo App. Mac and iPad each have **independent** tracks (steps are not shared).

Tone: clear teaching English; every lesson includes paste-ready code and exercises.

---

## Three tracks

| Track | Path | Best for | Device |
|------|------|------|------|
| **① Mac Basics (start here)** | [`basics/`](basics/) | New to Swift; start from `print` | **Mac** Playgrounds · Blank |
| **② Mac Advanced** | [`lessons/`](lessons/) | Know the basics; learn SwiftUI / async / Todo | **Mac** · Blank or App |
| **③ iPad independent track** | [`ipad/`](ipad/) | Primarily on iPad; steps rewritten for touch | **iPad** · Blank / App Playground (`.swiftpm`) |

**① + ② suggested path (Mac)**

1. Finish [`basics/README.md`](basics/) (B01–B08)
2. (Optional) Review `lessons/01-basics-refresh.md`
3. From `lessons/02-swiftui-app.md` through `08` Capstone

**③ suggested path (iPad)**

1. Open [`ipad/README.md`](ipad/) → finish `ipad/basics/` (B01–B08)
2. Follow `ipad/lessons/` 01→08 (SwiftUI uses App Playground)
3. Gesture cheat sheet: [`ipad/CHEATSHEET.md`](ipad/CHEATSHEET.md)

Already comfortable with `let` / Optional / func / struct → skip basics and start at advanced 01 or 02 for your device.  
**Do not mix** Mac and iPad lesson steps (code is interchangeable; UI actions differ).

---

## How to open

**Mac (tracks ①②)**

1. Install **Swift Playgrounds** from the Mac App Store (free).
2. Open the app → **New Playground**.
3. Check each lesson header for **Blank** vs **App**.
4. Paste code, press ▶ to run; `snippets/` are handy for one-shot copy.

**iPad (track ③)**

1. Follow [`ipad/README.md`](ipad/): install the same app from the iPad App Store → Files browser **＋** → Blank / App Playground (`.swiftpm`).
2. Steps, gestures, and sharing (AirDrop / Files app) are all rewritten under `ipad/`; do not follow the Mac steps above.

> Note: this is a **curriculum**. It will not remotely change your device. Paste and run everything locally in Playgrounds.

---

## ① Basics map → [`basics/`](basics/)

| # | File | Topic | Time |
|---|------|------|------|
| B01 | `basics/lessons/B01-hello-print.md` | `print`, comments | ~15 min |
| B02 | `basics/lessons/B02-let-var-types.md` | `let` / `var`, types | ~20 min |
| B03 | `basics/lessons/B03-strings.md` | Strings, interpolation | ~15 min |
| B04 | `basics/lessons/B04-control-flow.md` | `if` / `switch` / `guard` | ~20 min |
| B05 | `basics/lessons/B05-loops-arrays.md` | Loops, arrays | ~20 min |
| B06 | `basics/lessons/B06-collections-optionals.md` | Dictionaries, Optional | ~25 min |
| B07 | `basics/lessons/B07-functions-closures.md` | Functions, closures | ~25 min |
| B08 | `basics/lessons/B08-structs-enums.md` | struct / enum / protocol | ~25 min |

Cheat sheet: [`basics/CHEATSHEET.md`](basics/CHEATSHEET.md)

---

## ② Advanced map (suggested order)

| # | File | Topic | Playground type | Est. time |
|---|------|------|-----------------|----------|
| 01 | `lessons/01-basics-refresh.md` | `print`, `let`/`var`, string interpolation (quick review) | Blank | ~15 min |
| 02 | `lessons/02-swiftui-app.md` | App, `@State`, Button, VStack | App | ~20 min |
| 03 | `lessons/03-multi-file.md` | Split View / Model | App (multi-file) | ~20 min |
| 04 | `lessons/04-list-navigation.md` | List, NavigationStack | App | ~25 min |
| 05 | `lessons/05-async-await.md` | Task, URLSession / mock | Blank or App | ~25 min |
| 06 | `lessons/06-codable-models.md` | Codable models | Blank | ~20 min |
| 07 | `lessons/07-observable-state.md` | `@Observable` state | App | ~25 min |
| 08 | `lessons/08-capstone-mini-todo.md` | Mini Todo capstone | App (multi-file) | ~30 min |

Advanced total ~**2.5–3.5 hours** (spread across days is fine). Cheat sheet: [`CHEATSHEET.md`](CHEATSHEET.md)

---

## Folder layout

```
swift-playgrounds-course/
├── README.md                 ← Cantonese overview (default)
├── zh-Hant/                  ← Traditional Chinese (written)
├── en/                       ← English (you are here)
├── CHEATSHEET.md
├── basics/                   ← ① Mac basics
├── lessons/                  ← ② Mac advanced
├── snippets/
└── ipad/                     ← ③ iPad track
```

---

## Study tips

1. **Beginners:** Mac → basics then advanced 02; **iPad** → [`ipad/basics/`](ipad/basics/) then [`ipad/lessons/02`](ipad/lessons/02-swiftui-app.md) (optional quiz in 01).
2. **Finish each lesson’s exercises** before moving on — they are practice, not a test; changing a few lines is how you remember.
3. On errors, read that lesson’s “Common mistakes” and the matching `CHEATSHEET.md`.
4. Xcode Playgrounds / real app projects are fine, but Mac materials assume **Swift Playgrounds**; on iPad follow **③** [`ipad/`](ipad/).
5. If lesson 05 hits network limits in Playgrounds, use the **mock** path in the lesson to still practice `async/await`.

---

## Done when

**Basics**

- [ ] B01–B08 code all runs
- [ ] You can explain `let` vs `var`, Optional, `if let` / `guard let`
- [ ] You can write simple `func`, `struct`, `enum`

**Advanced**

- [ ] All eight lessons run (or mock path runs)
- [ ] Capstone Todo: add, mark done, delete, count remaining
- [ ] You can create an App playground, add a Swift file, and use `@Observable`

After that you might move to Xcode, a real API, or wiring Telegram / Bootstrap backends — that is the next stage, outside this course.
