# Swift Playgrounds cheat sheet (iPad)

Focused on **iPad UI / gestures**. Swift syntax matches the Mac cheat sheets (links at the end).

---

## Open files and projects

| Action | On iPad |
|------|----------------|
| Install | App Store → “Swift Playgrounds” |
| Back to file browser | Top-left **＜** / documents icon → My Playgrounds |
| New | Top-right **＋** → **App** (SwiftUI) or Blank / coding template |
| Open existing | Tap the thumbnail; or **Files** → Swift Playgrounds folder |
| Rename | Long-press thumbnail → Rename |
| Delete | Long-press → Delete (optionally “Save to Files” first) |

**App Playground (`.swiftpm`):** current recommended shape; multiple `.swift` files — fits this course’s advanced track.  
**Older playground books:** not used here.

---

## Edit and run

| Action | How |
|------|------|
| Show / hide sidebar | Toolbar top-left **sidebar** icon (file list) |
| Open a file | Tap the name in the sidebar |
| Run | Toolbar **▶** (hardware keyboard may support ⌘↩) |
| See `print` | Blank / results area (bottom or a draggable pane); App mainly uses **Preview** |
| Show Preview | App Playground: toolbar **Preview** / right canvas; portrait may need a toggle |
| Stop | ■ / Stop if a long task is running |
| Undo | Three-finger double-tap; or shake → Undo; hardware ⌘Z |
| Select text | Double-tap → drag handles; three-finger pinch copy/paste (system gestures) |
| On-screen symbols | Tap `123` / `#+=` |

---

## Multi-file (App Playground)

| Action | How |
|------|------|
| Add Swift file | Sidebar **＋** → Swift File / SwiftUI View |
| Add folder | Sidebar **＋** → Folder (optional) |
| Delete file | Long-press name in sidebar → Delete |
| Same module | **Do not** `import` your own files; only `import SwiftUI` etc. |
| `@main` | **Only one** in the whole App Playground |

---

## Share and backup

| Action | How |
|------|------|
| Share | Toolbar **Share** (box↑) → AirDrop / Messages / “Save to Files” |
| Location | **Files** → On My iPad (or iCloud Drive) → **Swift Playgrounds** |
| To Mac | AirDrop `.swiftpm` → open in Mac Playgrounds or Xcode |
| From Mac | Reverse AirDrop, or sync the same iCloud folder |

---

## Mac vs iPad (one glance)

| Item | iPad | Mac |
|------|------|-----|
| Pointer | Finger / Pencil (rare) | Mouse |
| Xcode | None | Can install |
| SPM deps | Limited; unused here | File → Add Package |
| Windows | Single app; optional Stage Manager | Free multi-window |
| Preview | Easy to cover with keyboard → dismiss or landscape | Usually stable right column |

---

## SwiftUI / syntax (same as Mac)

```swift
@State private var count = 0
Button("+1") { count += 1 }
List(items) { … }
NavigationStack { … }

@Observable
final class Store { var items: [Item] = [] }
```

```swift
Task { await load() }
try JSONDecoder().decode(T.self, from: data)
```

Details: root [`../CHEATSHEET.md`](../CHEATSHEET.md) and [`basics/CHEATSHEET.md`](basics/CHEATSHEET.md).

---

## Common mistakes (iPad)

| Symptom | Fix |
|------|------|
| Cannot find ▶ | Open a playground; do not stay on the file browser |
| Blank Preview | Confirm **App** type; wait for compile; dismiss keyboard |
| Code changed, Preview stale | Press ▶ again / wait for refresh; save and reopen |
| Cannot add files | Sidebar ＋; must be App Playground, not a limited Blank |
| Share fails for others | Send the whole `.swiftpm`, not a screenshot; they need Playgrounds |
| `@Observable` error | Update iPadOS / Playgrounds; or use ObservableObject fallback in the lesson |

---

## Lesson map

| Looking for | Lesson |
|------|-----|
| Open Blank, `print` | basics B01 |
| SwiftUI Button | lessons 02 |
| Sidebar multi-file | lessons 03 |
| List / navigation | lessons 04 |
| async | lessons 05 |
| JSON | lessons 06 |
| Store | lessons 07 |
| Todo | lessons 08 |
