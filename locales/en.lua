local Translations = {
    info = {
        ['break_lose'] = "You slipped out",
        ['break_failed'] = "You failed...",
    },
}

Lang = Locale:new({
    phrases = Translations,
    warnOnMissing = true
})