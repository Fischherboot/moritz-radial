🍰 RADIALES KUCHEN-MENÜ (FiveM ESX)
===========================
![Radial Menu Preview](https://raw.githubusercontent.com/Fischherboot/moritz-radial/main/image.png)

🚀 FEATURES
===========================
• 16 Kuchenstücke – frei benennbar & einzeln deaktivierbar

• Deaktivierte Stücke bleiben Grau & blockiert

• Führt definierte Commands aus (z. B. /ad)

• Kein NUI-Fokus → Spieler kann sich weiter bewegen

• ESX-Notify Support

• Logo/PNG (800x800) in der Mitte

🎮 STEUERUNG
===========================

Taste   | Funktion
--------|---------------------------
O       | Menü öffnen/schließen
← →     | Kuchenstück auswählen
Enter   | Command ausführen / Fehlermeldung
ESC/BS  | Menü schließen

⚙️ INSTALLATION
===========================
```lua
1) Ordner anlegen:
resources/
└── moritz-radial/
    ├── fxmanifest.lua
    ├── client.lua
    ├── config.lua
    └── html/
        ├── index.html
        ├── style.css
        ├── script.js
        └── img.png (dein Logo, 800x800)

3) In die server.cfg:

ensure moritz-radial
```

🔧 CONFIG (config.lua)
===========================

```lua
Config = {}

Config.UseESXNotify = true -- ESX Notification nutzen? (true/false)

-- 16 Slots, Reihenfolge im Uhrzeigersinn
Config.Slots = {
    { label = "Admin",        command = "ad",         enabled = true },
    { label = "Support",      command = "support",    enabled = false },
    { label = "Garage",       command = "garage",     enabled = false },
    { label = "Kleidung",     command = "skinmenu",   enabled = false },
    { label = "Rechnung",     command = "bill",       enabled = false },
    { label = "Job Menü",     command = "jobmenu",    enabled = false },
    { label = "Funk",         command = "funk",       enabled = false },
    { label = "Tablet",       command = "tablet",     enabled = false },
    { label = "Animationen",  command = "emotes",     enabled = false },
    { label = "Handy",        command = "phone",      enabled = false },
    { label = "Fraktion 1",   command = "f1",         enabled = false },
    { label = "Fraktion 2",   command = "f2",         enabled = false },
    { label = "Fahrzeug",     command = "veh",        enabled = false },
    { label = "Inventar",     command = "inv",        enabled = false },
    { label = "Perso",        command = "idcard",     enabled = false },
    { label = "Sonstiges",    command = "misc",       enabled = false },
}
```
⚠️ HINWEIS:
IMMER 16 SLOTS BEHALTEN! Nur label, command & enabled ändern.


License
===========================
Unlicensed, do with that code what you see fit. Dont care.

