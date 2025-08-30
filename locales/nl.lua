local Translations = {
    ['cuff'] = "Burger boeien",
    ['uncuff'] = "Burger Losmaken",
    ['start_escort'] = "Start Escort",
    ['stop_escort'] = "Stop Escort",
    ['search_suspect'] = "Doorzoek verdachte",
    ['search_vehicle'] = "Doorzoek Voertuig",
    ['found_noting'] = "Je hebt niets gevonden!",
    ['found_item'] = "Je hebt %{item} gevonden!",
    ['revive_suspect'] = "Genees Verdachten",
    ['set_in_vehicle'] = "Plaats in voertuig",
    ['get_out_vehicle'] = "Haal uit voertuig",
    ['put_in_jail'] = "Plaats verdachten in cel",
}

if GetConvar('qb_locale', 'en') == 'nl' then
    Lang = Locale:new({phrases = Translations, warnOnMissing = true, fallbackLang = Lang})
end
