local Translations = {
    info = {
        ['break_lose'] = "Je glipte eruit",
        ['break_failed'] = "Je hebt gefaald...",
    },
}

Lang = Locale:new({
    phrases = Translations,
    warnOnMissing = true
})