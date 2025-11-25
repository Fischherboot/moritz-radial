Config = {}

-- ESX Notify benutzen?
Config.UseESXNotify = true -- wenn false, dann nur print()

-- 16 Felder, Reihenfolge im Uhrzeigersinn
Config.Slots = {
    { label = "Emotes",        command = "emotemenu",         enabled = true },
    { label = "Streamermode",      command = "streamermode",    enabled = true },
    { label = "Dokumente",       command = "dokument",     enabled = true },
    { label = "Bossmenu",     command = "bossmenu",   enabled = true },
    { label = "..",     command = "bill",       enabled = false },
    { label = "..",     command = "jobmenu",    enabled = false },
    { label = "Info (DC)",         command = "info",       enabled = true },
    { label = "Tickets",       command = "tickets",     enabled = true },
    { label = "Admin",  command = "ad",     enabled = true },
    { label = "..",        command = "info",      enabled = false },
    { label = "(RD)Liege Spawnen",   command = "stretcher",         enabled = true },
    { label = "(RD)Liegen Menu",   command = "stretchermenu",         enabled = true },
    { label = "(RD)Liege Löschen",     command = "delstretcher",        enabled = true },
    { label = "..",     command = "inv",        enabled = false },
    { label = "..",        command = "streamermode",     enabled = false },
    { label = "..",    command = "emotemenu",       enabled = false },
}
