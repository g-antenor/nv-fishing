Config = {
    Inventory = 'qb',       -- 'qb' or 'ox'
    Util = 'qb',            -- 'qb' or 'ox'

    Fishingrod = "fishingrod",
    Fishbait = "fishbait",
    Knife = "weapon_knife",
    Fishings = {
        [1]  = { model = 'stingray',        skill = math.random(1, 2), difficulty = 50, chance = 50, openOcean = false },
        [2]  = { model = 'flounder',        skill = math.random(1, 2), difficulty = 50, chance = 50, openOcean = false },
        [3]  = { model = 'codfish',         skill = math.random(1, 2), difficulty = 50, chance = 50, openOcean = false },
        [4]  = { model = 'mackerel',        skill = math.random(1, 2), difficulty = 50, chance = 50, openOcean = false },
        [5]  = { model = 'bass',            skill = math.random(1, 2), difficulty = 50, chance = 50, openOcean = false },
        [6]  = { model = 'fishingtin',      skill = math.random(1, 2), difficulty = 50, chance = 50, openOcean = false },
        [7]  = { model = 'fishingboot',     skill = math.random(1, 2), difficulty = 50, chance = 50, openOcean = false },
        [8]  = { model = 'killerwhale',     skill = math.random(5, 7), difficulty = 75, chance = 1, openOcean = true, drop = { 'meat_whale', 'skin_stingray' } },
        [9]  = { model = 'dolphin',         skill = math.random(3, 5), difficulty = 60, chance = 1, openOcean = true, drop = { 'meat_dolphin', 'skin_dolphin' } },
        [10] = { model = 'sharkhammer',     skill = math.random(4, 6), difficulty = 75, chance = 1, openOcean = true, drop = { 'meat_shark', 'skin_shark' } },
        [11] = { model = 'sharktiger',      skill = math.random(4, 6), difficulty = 75, chance = 1, openOcean = true, drop = { 'meat_shark', 'skin_shark' } },
        [12] = { model = 'fishinglootbig',  skill = math.random(4, 6), difficulty = 75, chance = 1, openOcean = false},
    },

    StressDegreeChance = 5,

    Chance = 5,
    Rewards = 'fishinglootbig',
    AmountDrop = {1, 2},
    Drops = {
        '10kgoldchain',
        'goldbar',
        'gold_ring',
    }
}