local Translations = {
    ['cuff'] = "Cuff Citezen",
    ['uncuff'] = "UnCuff Citezen",
    ['start_escort'] = "Start Escort",
    ['stop_escort'] = "Stop Escort",
    ['search_suspect'] = "Search Suspect",
    ['search_vehicle'] = "Search Vehicle",
    ['found_noting'] = "You found nothing!",
    ['found_item'] = "You found %{item}!",
    ['revive_suspect'] = "Revive Suspect",
    ['set_in_vehicle'] = "Set in vehicle",
    ['get_out_vehicle'] = "Get out vehicle",
    ['put_in_jail'] = "Put suspect in jail",
}

if GetConvar('qb_locale', 'en') == 'en' then
    Lang = Locale:new({phrases = Translations, warnOnMissing = true, fallbackLang = Lang})
end
