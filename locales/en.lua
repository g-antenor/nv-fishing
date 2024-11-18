local Translations = {
    notify = {
        success = {
            ['start_fishing'] = 'Started fishing',
            ['fishing_success'] = 'Caught a fish',
            ['fishing_fail'] = 'The fish escaped',
            ['open_chest'] = 'Opened the chest',
            ['cut_fishing'] = 'Cut the fish',
            ['stress'] = 'you feel better',
        },
        error = {
            ['no_fishbait'] = 'The bait is missing',
            ['no_water'] = 'The water is too deep',
            ['no_fishing_rod'] = 'The fishing rod is missing',
            ['no_knife'] = 'The knife is missing',
        }
    },
    progress = {
        ['fishing'] = 'Fighting with the fish',
        ['CutFishing'] = 'Cutting fish',
        ['OpenCheast'] = 'Opening the chest',
    }
}

Lang = Lang or Locale:new({
    phrases = Translations,
    warnOnMissing = true
})