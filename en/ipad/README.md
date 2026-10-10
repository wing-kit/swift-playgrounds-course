# Swift Playgrounds (iPad) — Independent track

> **Language:** English · [粵語](../../README.md) · [繁體中文](../../zh-Hant/ipad/README.md)

Built for **Wing Kit Leung**: learn in **iPad Swift Playgrounds** (App Store) from scratch through a working Mini Todo App.

Tone: clear teaching English. This track is **parallel and independent** from the Mac track (repo-root `basics/`, `lessons/`) — every step is rewritten for iPad touch UI; do not follow the Mac materials for gestures.

Swift **syntax and exercise code match the Mac edition**; differences are only how you open, run, add files, and share.

---

## Compared with the Mac track

| | ① Mac basics / advanced | ③ iPad (this track) |
|--|------------------|---------------------|
| App | Mac App Store “Swift Playgrounds” | **iPad** App Store, same name |
| Input | Mouse / trackpad, keyboard-first | **Finger taps**; optional hardware keyboard |
| Project shape | Blank / App playground | Prefer **App Playground (`.swiftpm`)**; Blank for `print` practice |
| Preview | Right / bottom of window | May be **right or bottom Preview**, or full-screen toggle |
| Next step | Easy move to Xcode | **No full Xcode**; TestFlight / App Store needs Mac + Xcode |
| SPM | File → Add Package | **Limited / different UI** on iPad; this course needs no third-party packages |

**Tip: pick one primary track and finish it.**  
- Mainly on iPad → follow this `ipad/` tree (B01→B08→advanced 01→08).  
- Mainly on Mac → follow the repo root.  
Code transfers either way (AirDrop `.swiftpm` / Files), but do not mix lesson steps.

---

## How to open (iPad)

1. Install **Swift Playgrounds** from the iPad App Store (free; use a recent iPadOS).
2. Open the app → **My Playgrounds** file browser.
3. Top-right **＋** →:
   - Basics (eight lessons): Blank / a template with ▶ and a results area.
   - Advanced SwiftUI: **App** / **App Playground** (creates a `.swiftpm` package).
4. Landscape is more comfortable: code on one side, Preview/results on the other. In portrait, toggle edit/preview from the toolbar.
5. (Optional) Hardware keyboard: `⌘↩` or toolbar ▶ (depends on version).
6. Each lesson’s `snippets/` are the same `.swift` files — open in the **Files** app to copy, or AirDrop from a Mac.

> This curriculum will not remotely change your iPad. Paste and run locally.

### App Playground (`.swiftpm`) vs older Playground Books

| | App Playground | Older playground book (rare) |
|--|----------------|------------------------------|
| Shape | `.swiftpm` package | `.playgroundbook` |
| Use | Current default: SwiftUI App, multi-file | Early Learn to Code / book style |
| This course | **Always App Playground / Blank** | We do not teach the old book flow |

Typical location: **Files** → **On My iPad** → **Swift Playgrounds** (or iCloud “Swift Playgrounds” if sync is on).

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

## ② Advanced map → [`lessons/`](lessons/)

| # | File | Topic | Type | Time |
|---|------|------|------|------|
| 01 | `lessons/01-basics-refresh.md` | Combined refresh | Blank / plain output | ~15 min |
| 02 | `lessons/02-swiftui-app.md` | App, `@State`, Button | App Playground | ~20 min |
| 03 | `lessons/03-multi-file.md` | Sidebar multi-file | App (multi-file) | ~20 min |
| 04 | `lessons/04-list-navigation.md` | List, NavigationStack | App | ~25 min |
| 05 | `lessons/05-async-await.md` | Task, mock / network | Blank or App | ~25 min |
| 06 | `lessons/06-codable-models.md` | Codable | Blank | ~20 min |
| 07 | `lessons/07-observable-state.md` | `@Observable` | App | ~25 min |
| 08 | `lessons/08-capstone-mini-todo.md` | Mini Todo | App (multi-file) | ~30 min |

Cheat sheet: [`CHEATSHEET.md`](CHEATSHEET.md) (iPad gestures / menus)

---

## Suggested path

1. Finish `basics/` B01→B08  
2. (Optional) Advanced `01` as a quiz  
3. Lessons `02` through `08` Capstone  
4. Share: toolbar **Share** → AirDrop / “Save to Files”; later open the same `.swiftpm` on a Mac  

Already know the basics → jump to `lessons/02`.

---

## Folder layout

```
ipad/
├── README.md
├── CHEATSHEET.md
├── basics/
├── lessons/
└── snippets/
```

---

## iPad-specific notes (whole course)

- **Small screen / Split View:** use landscape; optionally Stage Manager to put Files beside Playgrounds while copying.  
- **No Xcode:** no Instruments, full Simulator matrix, or complex signing; goal is language + SwiftUI, not shipping.  
- **SPM:** snippets have **zero third-party deps** — do not block on adding packages on iPad.  
- **Network:** lesson 05 has a mock; cellular / firewall blocking HTTP still allows a pass.  
- **Keyboard:** on-screen keyboard is enough; hardware keyboard speeds typing, but every step assumes fingers alone can finish.

---

## Done when

**Basics**

- [ ] B01–B08 run on iPad  
- [ ] You know `let` / `var`, Optional, `func`, `struct` / `enum`  
- [ ] You can create Blank / App Playground from the file browser  

**Advanced**

- [ ] Eight lessons run (05 may use mock)  
- [ ] Capstone: add, toggle, delete, count remaining  
- [ ] Add Swift files from the sidebar; use Preview for UI  
- [ ] Back up `.swiftpm` via Share / Files
