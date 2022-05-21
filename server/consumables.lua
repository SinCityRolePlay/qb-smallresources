QBCore = exports['qb-core']:GetCoreObject()

----------- / alcohol

QBCore.Functions.CreateUseableItem("vodka", function(source, item)
    TriggerClientEvent("consumables:client:DrinkAlcohol", source, item.name)
end)

QBCore.Functions.CreateUseableItem("beer", function(source, item)
    TriggerClientEvent("consumables:client:DrinkAlcohol", source, item.name)
end)

QBCore.Functions.CreateUseableItem("whiskey", function(source, item)
    TriggerClientEvent("consumables:client:DrinkAlcohol", source, item.name)
end)

----------- / Eat
QBCore.Functions.CreateUseableItem("drink6", function(source, item)
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
    TriggerClientEvent("consumables:client:DrinkCocktail", src, item.name)
end)

QBCore.Functions.CreateUseableItem("drink7", function(source, item)
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
    TriggerClientEvent("consumables:client:DrinkCocktail", src, item.name)
end)

QBCore.Functions.CreateUseableItem("drink8", function(source, item)
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
    TriggerClientEvent("consumables:client:DrinkCocktail", src, item.name)
end)

QBCore.Functions.CreateUseableItem("drink10", function(source, item)
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
    TriggerClientEvent("consumables:client:DrinkCocktail", src, item.name)
end)

-------------------------------------
------------food eating--------------
-------------------------------------
QBCore.Functions.CreateUseableItem("kurkakola", function(source, item)
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
	if Player.Functions.RemoveItem(item.name, 1, item.slot) then
        TriggerClientEvent("consumables:client:DrinkSoda", src, item.name)
    end
end)

QBCore.Functions.CreateUseableItem("sandwich", function(source, item)
    local Player = QBCore.Functions.GetPlayer(source)
	if Player.Functions.RemoveItem(item.name, 1, item.slot) then
        TriggerClientEvent("consumables:client:Eat", source, item.name)
    end
end)

QBCore.Functions.CreateUseableItem("twerks_candy", function(source, item)
    local Player = QBCore.Functions.GetPlayer(source)
	if Player.Functions.RemoveItem(item.name, 1, item.slot) then
        TriggerClientEvent("consumables:client:Eat", source, item.name)
    end
end)

QBCore.Functions.CreateUseableItem("snikkel_candy", function(source, item)
    local Player = QBCore.Functions.GetPlayer(source)
	if Player.Functions.RemoveItem(item.name, 1, item.slot) then
        TriggerClientEvent("consumables:client:Eat", source, item.name)
    end
end)

QBCore.Functions.CreateUseableItem("tosti", function(source, item)
    local Player = QBCore.Functions.GetPlayer(source)
	if Player.Functions.RemoveItem(item.name, 1, item.slot) then
        TriggerClientEvent("consumables:client:Eat", source, item.name)
    end
end)


-------------------------------------
-----------Hunting Items-------------
-------------------------------------
QBCore.Functions.CreateUseableItem("chickenmeatcooked", function(source, item)
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
	if Player.Functions.RemoveItem(item.name, 1, item.slot) then
        TriggerClientEvent("consumables:client:Eat", src, item.name)
    end
end)
QBCore.Functions.CreateUseableItem("cowmeatcooked", function(source, item)
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
	if Player.Functions.RemoveItem(item.name, 1, item.slot) then
        TriggerClientEvent("consumables:client:Eat", src, item.name)
    end
end)
QBCore.Functions.CreateUseableItem("boarmeatcooked", function(source, item)
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
	if Player.Functions.RemoveItem(item.name, 1, item.slot) then
        TriggerClientEvent("consumables:client:Eat", src, item.name)
    end
end)
QBCore.Functions.CreateUseableItem("monkeymeatcooked", function(source, item)
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
	if Player.Functions.RemoveItem(item.name, 1, item.slot) then
        TriggerClientEvent("consumables:client:Eat", src, item.name)
    end
end)
QBCore.Functions.CreateUseableItem("wolfmeatcooked", function(source, item)
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
	if Player.Functions.RemoveItem(item.name, 1, item.slot) then
        TriggerClientEvent("consumables:client:Eat", src, item.name)
    end
end)
QBCore.Functions.CreateUseableItem("deermeatcooked", function(source, item)
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
	if Player.Functions.RemoveItem(item.name, 1, item.slot) then
        TriggerClientEvent("consumables:client:Eat", src, item.name)
    end
end)
QBCore.Functions.CreateUseableItem("huskymeatcooked", function(source, item)
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
	if Player.Functions.RemoveItem(item.name, 1, item.slot) then
        TriggerClientEvent("consumables:client:Eat", src, item.name)
    end
end)
QBCore.Functions.CreateUseableItem("pigmeatcooked", function(source, item)
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
	if Player.Functions.RemoveItem(item.name, 1, item.slot) then
        TriggerClientEvent("consumables:client:Eat", src, item.name)
    end
end)
QBCore.Functions.CreateUseableItem("lionmeatcooked", function(source, item)
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
	if Player.Functions.RemoveItem(item.name, 1, item.slot) then
        TriggerClientEvent("consumables:client:Eat", src, item.name)
    end
end)
QBCore.Functions.CreateUseableItem("rabbitmeatcooked", function(source, item)
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
	if Player.Functions.RemoveItem(item.name, 1, item.slot) then
        TriggerClientEvent("consumables:client:Eat", src, item.name)
    end
end)
QBCore.Functions.CreateUseableItem("dolphinmeatcooked", function(source, item)
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
	if Player.Functions.RemoveItem(item.name, 1, item.slot) then
        TriggerClientEvent("consumables:client:Eat", src, item.name)
    end
end)
QBCore.Functions.CreateUseableItem("hammerheadmeatcooked", function(source, item)
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
	if Player.Functions.RemoveItem(item.name, 1, item.slot) then
        TriggerClientEvent("consumables:client:Eat", src, item.name)
    end
end)
QBCore.Functions.CreateUseableItem("killerwhalemeatcooked", function(source, item)
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
	if Player.Functions.RemoveItem(item.name, 1, item.slot) then
        TriggerClientEvent("consumables:client:Eat", src, item.name)
    end
end)
QBCore.Functions.CreateUseableItem("stingraymeatcooked", function(source, item)
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
	if Player.Functions.RemoveItem(item.name, 1, item.slot) then
        TriggerClientEvent("consumables:client:Eat", src, item.name)
    end
end)
QBCore.Functions.CreateUseableItem("humpbackmeatcooked", function(source, item)
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
	if Player.Functions.RemoveItem(item.name, 1, item.slot) then
        TriggerClientEvent("consumables:client:Eat", src, item.name)
    end
end)
QBCore.Functions.CreateUseableItem("sharkmeatcooked", function(source, item)
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
	if Player.Functions.RemoveItem(item.name, 1, item.slot) then
        TriggerClientEvent("consumables:client:Eat", src, item.name)
    end
end)

-------------------------------------
---------Burgershot Items------------
-------------------------------------
QBCore.Functions.CreateUseableItem("bs_fries", function(source, item)
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
	if Player.Functions.RemoveItem(item.name, 1, item.slot) then
        TriggerClientEvent("consumables:client:EatFries", src, item.name)
    end
end)
QBCore.Functions.CreateUseableItem("bs_moneyshot", function(source, item)
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
	if Player.Functions.RemoveItem(item.name, 1, item.slot) then
        TriggerClientEvent("consumables:client:Eat", src, item.name)
    end
end)
QBCore.Functions.CreateUseableItem("bs_thebleeder", function(source, item)
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
	if Player.Functions.RemoveItem(item.name, 1, item.slot) then
        TriggerClientEvent("consumables:client:Eat", src, item.name)
    end
end)
QBCore.Functions.CreateUseableItem("bs_fowlburger", function(source, item)
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
	if Player.Functions.RemoveItem(item.name, 1, item.slot) then
        TriggerClientEvent("consumables:client:Eat", src, item.name)
    end
end)
QBCore.Functions.CreateUseableItem("bs_heartstopper", function(source, item)
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
	if Player.Functions.RemoveItem(item.name, 1, item.slot) then
        TriggerClientEvent("consumables:client:EatHeartstopper", src, item.name)
    end
end)
QBCore.Functions.CreateUseableItem("bs_torpedo", function(source, item)
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
	if Player.Functions.RemoveItem(item.name, 1, item.slot) then
        TriggerClientEvent("consumables:client:Eat", src, item.name)
    end
end)
QBCore.Functions.CreateUseableItem("bs_vegan", function(source, item)
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
	if Player.Functions.RemoveItem(item.name, 1, item.slot) then
        TriggerClientEvent("consumables:client:Eat", src, item.name)
    end
end)

----------------------- Noodle Exchange ----------------------------------------
QBCore.Functions.CreateUseableItem("ne_caliroll", function(source, item)
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
    if Player.Functions.RemoveItem(item.name, 1, item.slot) then
        TriggerClientEvent("consumables:client:EatNoodleExchange", src, item.name)
    end
end)
QBCore.Functions.CreateUseableItem("ne_musubi", function(source, item)
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
    if Player.Functions.RemoveItem(item.name, 1, item.slot) then
        TriggerClientEvent("consumables:client:EatNoodleExchange", src, item.name)
    end
end)
QBCore.Functions.CreateUseableItem("ne_salmonhandroll", function(source, item)
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
    if Player.Functions.RemoveItem(item.name, 1, item.slot) then
        TriggerClientEvent("consumables:client:EatNoodleExchange", src, item.name)
    end
end)
QBCore.Functions.CreateUseableItem("ne_salmonnigri", function(source, item)
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
    if Player.Functions.RemoveItem(item.name, 1, item.slot) then
        TriggerClientEvent("consumables:client:EatNoodleExchange", src, item.name)
    end
end)
QBCore.Functions.CreateUseableItem("ne_tempuraroll", function(source, item)
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
    if Player.Functions.RemoveItem(item.name, 1, item.slot) then
        TriggerClientEvent("consumables:client:EatNoodleExchange", src, item.name)
    end
end)
QBCore.Functions.CreateUseableItem("ne_volcanoroll", function(source, item)
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
    if Player.Functions.RemoveItem(item.name, 1, item.slot) then
        TriggerClientEvent("consumables:client:EatNoodleExchange", src, item.name)
    end
end)
QBCore.Functions.CreateUseableItem("ne_greentea", function(source, item)
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
    if Player.Functions.RemoveItem(item.name, 1, item.slot) then
        TriggerClientEvent("consumables:client:DrinkNoodleExchange", src, item.name)
    end
end)
----------------------- End Noodle Exchange ----------------------------------------

----------- / Drink
QBCore.Functions.CreateUseableItem("bs_milkshake", function(source, item)
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
	if Player.Functions.RemoveItem(item.name, 1, item.slot) then
        TriggerClientEvent("consumables:client:DrinkCoffee", src, item.name)
    end
end)
QBCore.Functions.CreateUseableItem("bs_softdrink", function(source, item)
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
	if Player.Functions.RemoveItem(item.name, 1, item.slot) then
        TriggerClientEvent("consumables:client:DrinkSoftdrink", src, item.name)
    end
end)
QBCore.Functions.CreateUseableItem("bs_coffee", function(source, item)
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
	if Player.Functions.RemoveItem(item.name, 1, item.slot) then
        TriggerClientEvent("consumables:client:DrinkCoffee", src, item.name)
    end
end)
QBCore.Functions.CreateUseableItem("water_bottle", function(source, item)
    local Player = QBCore.Functions.GetPlayer(source)
	if Player.Functions.RemoveItem(item.name, 1, item.slot) then
        TriggerClientEvent("consumables:client:Drink", source, item.name)
    end
end)

QBCore.Functions.CreateUseableItem("coffee", function(source, item)
    local Player = QBCore.Functions.GetPlayer(source)
	if Player.Functions.RemoveItem(item.name, 1, item.slot) then
        TriggerClientEvent("consumables:client:Drink", source, item.name)
    end
end)
QBCore.Functions.CreateUseableItem("frappuccino", function(source, item)
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
	if Player.Functions.RemoveItem(item.name, 1, item.slot) then
        TriggerClientEvent("consumables:client:frappuccino", src, item.name)
    end
end)
QBCore.Functions.CreateUseableItem("mocha_latte", function(source, item)
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
	if Player.Functions.RemoveItem(item.name, 1, item.slot) then
        TriggerClientEvent("consumables:client:mocha_latte", src, item.name)
    end
end)
QBCore.Functions.CreateUseableItem("cappuccino", function(source, item)
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
	if Player.Functions.RemoveItem(item.name, 1, item.slot) then
        TriggerClientEvent("consumables:client:cappuccino", src, item.name)
    end
end)
QBCore.Functions.CreateUseableItem("americano", function(source, item)
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
	if Player.Functions.RemoveItem(item.name, 1, item.slot) then
        TriggerClientEvent("consumables:client:americano", src, item.name)
    end
end)
QBCore.Functions.CreateUseableItem("macciato", function(source, item)
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
	if Player.Functions.RemoveItem(item.name, 1, item.slot) then
        TriggerClientEvent("consumables:client:macciato", src, item.name)
    end
end)
QBCore.Functions.CreateUseableItem("irish_creme", function(source, item)
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
	if Player.Functions.RemoveItem(item.name, 1, item.slot) then
        TriggerClientEvent("consumables:client:irish_creme", src, item.name)
    end
end)
QBCore.Functions.CreateUseableItem("cold_brew", function(source, item)
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
	if Player.Functions.RemoveItem(item.name, 1, item.slot) then
        TriggerClientEvent("consumables:client:cold_brew", src, item.name)
    end
end)
QBCore.Functions.CreateUseableItem("espresso", function(source, item)
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
	if Player.Functions.RemoveItem(item.name, 1, item.slot) then
        TriggerClientEvent("consumables:client:espresso", src, item.name)
    end
end)
---- CyberBar

QBCore.Functions.CreateUseableItem("cb_pocky", function(source, item)
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
	if Player.Functions.RemoveItem(item.name, 1, item.slot) then
        TriggerClientEvent("consumables:client:EatPocky", src, item.name)
    end
end)
QBCore.Functions.CreateUseableItem("cb_rice_crackers", function(source, item)
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
	if Player.Functions.RemoveItem(item.name, 1, item.slot) then
        TriggerClientEvent("consumables:client:EatRiceCrackers", src, item.name)
    end
end)
QBCore.Functions.CreateUseableItem("cb_mochi_donut", function(source, item)
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
	if Player.Functions.RemoveItem(item.name, 1, item.slot) then
        TriggerClientEvent("consumables:client:EatMochiDonut", src, item.name)
    end
end)
QBCore.Functions.CreateUseableItem("cb_blueberry_ramune", function(source, item)
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
	if Player.Functions.RemoveItem(item.name, 1, item.slot) then
        TriggerClientEvent("consumables:client:DrinkRamuneSoda", src, item.name)
    end
end)
QBCore.Functions.CreateUseableItem("cb_melon_ramune", function(source, item)
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
	if Player.Functions.RemoveItem(item.name, 1, item.slot) then
        TriggerClientEvent("consumables:client:DrinkRamuneSoda", src, item.name)
    end
end)
QBCore.Functions.CreateUseableItem("cb_strawberry_ramune", function(source, item)
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
	if Player.Functions.RemoveItem(item.name, 1, item.slot) then
        TriggerClientEvent("consumables:client:DrinkRamuneSoda", src, item.name)
    end
end)
QBCore.Functions.CreateUseableItem("cb_boba_milktea", function(source, item)
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
	if Player.Functions.RemoveItem(item.name, 1, item.slot) then
        TriggerClientEvent("consumables:client:DrinkBobaMilktea", src, item.name)
    end
end)
QBCore.Functions.CreateUseableItem("kurkakola", function(source, item)
    local Player = QBCore.Functions.GetPlayer(source)
	if Player.Functions.RemoveItem(item.name, 1, item.slot) then
        TriggerClientEvent("consumables:client:Drink", source, item.name)
    end
end)

----------- / Drug

QBCore.Functions.CreateUseableItem("joint", function(source, item)
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
	if Player.Functions.GetItemByName('lighter') ~= nil and Player.Functions.RemoveItem(item.name, 1, item.slot) then
        TriggerClientEvent("consumables:client:UseJoint", src)
    else
        TriggerClientEvent('QBCore:Notify', src, "You\'re missing something to flame with..", "error")
    end
end)

QBCore.Functions.CreateUseableItem("cokebaggy", function(source)
    TriggerClientEvent("consumables:client:Cokebaggy", source)
end)

QBCore.Functions.CreateUseableItem("crack_baggy", function(source)
    TriggerClientEvent("consumables:client:Crackbaggy", source)
end)

QBCore.Functions.CreateUseableItem("xtcbaggy", function(source, _)
    TriggerClientEvent("consumables:client:EcstasyBaggy", source)
end)

QBCore.Functions.CreateUseableItem("wine_bottle", function(source, item)
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
	if Player.Functions.RemoveItem(item.name, 1, item.slot) then
        TriggerClientEvent("consumables:client:DrinkWine",src,item.name)  
    end 
end)

QBCore.Functions.CreateUseableItem("wine", function(source, item)
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
	if Player.Functions.RemoveItem(item.name, 1, item.slot) then
        TriggerClientEvent("consumables:client:DrinkWine",src,item.name)  
    end 
end)

QBCore.Functions.CreateUseableItem("oxy", function(source, item)
    local src = source
    TriggerClientEvent("consumables:client:oxy", src)
end)

QBCore.Functions.CreateUseableItem("meth", function(source)
    TriggerClientEvent("consumables:client:meth", source)
end)

QBCore.Functions.CreateUseableItem("gelatti_joint", function(source, item)
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
	if Player.Functions.GetItemByName('lighter') ~= nil and Player.Functions.RemoveItem(item.name, 1, item.slot) then
        TriggerClientEvent("consumables:client:gelatti_joint", src)
    else
        TriggerClientEvent('QBCore:Notify', src, "You\'re missing something to flame with..", "error")
    end
end)

QBCore.Functions.CreateUseableItem("gary_payton_joint", function(source, item)
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
	if Player.Functions.GetItemByName('lighter') ~= nil and Player.Functions.RemoveItem(item.name, 1, item.slot) then
        TriggerClientEvent("consumables:client:gary_payton_joint", src)
    else
        TriggerClientEvent('QBCore:Notify', src, "You\'re missing something to flame with..", "error")
    end
end)

QBCore.Functions.CreateUseableItem("cereal_milk_joint", function(source, item)
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
	if Player.Functions.GetItemByName('lighter') ~= nil and Player.Functions.RemoveItem(item.name, 1, item.slot) then
        TriggerClientEvent("consumables:client:cereal_milk_joint", src)
    else
        TriggerClientEvent('QBCore:Notify', src, "You\'re missing something to flame with..", "error")
    end
end)

QBCore.Functions.CreateUseableItem("cheetah_piss_joint", function(source, item)
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
	if Player.Functions.GetItemByName('lighter') ~= nil and Player.Functions.RemoveItem(item.name, 1, item.slot) then
        TriggerClientEvent("consumables:client:cheetah_piss_joint", src)
    else
        TriggerClientEvent('QBCore:Notify', src, "You\'re missing something to flame with..", "error")
    end
end)

QBCore.Functions.CreateUseableItem("snow_man_joint", function(source, item)
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
	if Player.Functions.GetItemByName('lighter') ~= nil and Player.Functions.RemoveItem(item.name, 1, item.slot) then
        TriggerClientEvent("consumables:client:snow_man_joint", src)
    else
        TriggerClientEvent('QBCore:Notify', src, "You\'re missing something to flame with..", "error")
    end
end)

QBCore.Functions.CreateUseableItem("georgia_pie_joint", function(source, item)
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
	if Player.Functions.GetItemByName('lighter') ~= nil and Player.Functions.RemoveItem(item.name, 1, item.slot) then
        TriggerClientEvent("consumables:client:georgia_pie_joint", src)
    else
        TriggerClientEvent('QBCore:Notify', src, "You\'re missing something to flame with..", "error")
    end
end)

QBCore.Functions.CreateUseableItem("jefe_joint", function(source, item)
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
	if Player.Functions.GetItemByName('lighter') ~= nil and Player.Functions.RemoveItem(item.name, 1, item.slot) then
        TriggerClientEvent("consumables:client:jefe_joint", src)
    else
        TriggerClientEvent('QBCore:Notify', src, "You\'re missing something to flame with..", "error")
    end
end)

QBCore.Functions.CreateUseableItem("cake_mix_joint", function(source, item)
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
	if Player.Functions.GetItemByName('lighter') ~= nil and Player.Functions.RemoveItem(item.name, 1, item.slot) then
        TriggerClientEvent("consumables:client:cake_mix_joint", src)
    else
        TriggerClientEvent('QBCore:Notify', src, "You\'re missing something to flame with..", "error")
    end
end)

QBCore.Functions.CreateUseableItem("white_runtz_joint", function(source, item)
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
	if Player.Functions.GetItemByName('lighter') ~= nil and Player.Functions.RemoveItem(item.name, 1, item.slot) then
        TriggerClientEvent("consumables:client:white_runtz_joint", src)
    else
        TriggerClientEvent('QBCore:Notify', src, "You\'re missing something to flame with..", "error")
    end
end)

QBCore.Functions.CreateUseableItem("blueberry_cruffin_joint", function(source, item)
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
	if Player.Functions.GetItemByName('lighter') ~= nil and Player.Functions.RemoveItem(item.name, 1, item.slot) then
        TriggerClientEvent("consumables:client:blueberry_cruffin_joint", src)
    else
        TriggerClientEvent('QBCore:Notify', src, "You\'re missing something to flame with..", "error")
    end
end)

QBCore.Functions.CreateUseableItem("grabba_leaf_joint", function(source, item)
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
	if Player.Functions.GetItemByName('lighter') ~= nil and Player.Functions.RemoveItem(item.name, 1, item.slot) then
        TriggerClientEvent("consumables:client:grabba_leaf_joint", src)
    else
        TriggerClientEvent('QBCore:Notify', src, "You\'re missing something to flame with..", "error")
    end
end)

QBCore.Functions.CreateUseableItem("whitecherry_gelato_joint", function(source, item)
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
	if Player.Functions.GetItemByName('lighter') ~= nil and Player.Functions.RemoveItem(item.name, 1, item.slot) then
        TriggerClientEvent("consumables:client:whitecherry_gelato_joint", src)
    else
        TriggerClientEvent('QBCore:Notify', src, "You\'re missing something to flame with..", "error")
    end
end)

----------- / Tools

QBCore.Functions.CreateUseableItem("armor", function(source)
    TriggerClientEvent("consumables:client:UseArmor", source)
end)

QBCore.Functions.CreateUseableItem("heavyarmor", function(source)
    TriggerClientEvent("consumables:client:UseHeavyArmor", source)
end)

QBCore.Commands.Add("resetarmor", "Resets Vest (Police Only)", {}, false, function(source)
    local Player = QBCore.Functions.GetPlayer(source)
    if Player.PlayerData.job.name == "police" then
        TriggerClientEvent("consumables:client:ResetArmor", source)
    else
        TriggerClientEvent('QBCore:Notify', source,  "For Police Officer Only", "error")
    end
end)

QBCore.Functions.CreateUseableItem("binoculars", function(source)
    TriggerClientEvent("binoculars:Toggle", source)
end)

QBCore.Functions.CreateUseableItem("parachute", function(source, item)
    local Player = QBCore.Functions.GetPlayer(source)
	if Player.Functions.RemoveItem(item.name, 1, item.slot) then
        TriggerClientEvent("consumables:client:UseParachute", source)
    end
end)

QBCore.Commands.Add("resetparachute", "Resets Parachute", {}, false, function(source)
	TriggerClientEvent("consumables:client:ResetParachute", source)
end)

RegisterNetEvent('qb-smallpenis:server:AddParachute', function()
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
    Player.Functions.AddItem("parachute", 1)
end)

----------- / Firework

QBCore.Functions.CreateUseableItem("firework1", function(source, item)
    local src = source
    TriggerClientEvent("fireworks:client:UseFirework", src, item.name, "proj_indep_firework")
end)

QBCore.Functions.CreateUseableItem("firework2", function(source, item)
    local src = source
    TriggerClientEvent("fireworks:client:UseFirework", src, item.name, "proj_indep_firework_v2")
end)

QBCore.Functions.CreateUseableItem("firework3", function(source, item)
    local src = source
    TriggerClientEvent("fireworks:client:UseFirework", src, item.name, "proj_xmas_firework")
end)

QBCore.Functions.CreateUseableItem("firework4", function(source, item)
    local src = source
    TriggerClientEvent("fireworks:client:UseFirework", src, item.name, "scr_indep_fireworks")
end)

QBCore.Functions.CreateUseableItem('pink_jellybean', function(source, item)
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
    if Player.Functions.RemoveItem('pink_jellybean', 1, item.slot) then
        TriggerClientEvent('consumables:client:EatJellybean', src, item.name)
    end
end)
  
QBCore.Functions.CreateUseableItem('purple_jellybean', function(source, item)
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
    if Player.Functions.RemoveItem('purple_jellybean', 1, item.slot) then
    TriggerClientEvent('consumables:client:EatJellybean', src, item.name)
  end
end)

QBCore.Functions.CreateUseableItem('blue_jellybean', function(source, item)
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
    if Player.Functions.RemoveItem('blue_jellybean', 1, item.slot) then
    TriggerClientEvent('consumables:client:EatJellybean', src, item.name)
  end
end)

QBCore.Functions.CreateUseableItem('green_jellybean', function(source, item)
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
    if Player.Functions.RemoveItem('green_jellybean', 1, item.slot) then
    TriggerClientEvent('consumables:client:EatJellybean', src, item.name)
  end
end)

QBCore.Functions.CreateUseableItem('rainbow_jellybean', function(source, item)
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
    if Player.Functions.RemoveItem('rainbow_jellybean', 1, item.slot) then
    TriggerClientEvent('consumables:client:EatJellybean', src, item.name)
  end
end)

----------- / Lockpicking

QBCore.Functions.CreateUseableItem("lockpick", function(source)
    TriggerClientEvent("lockpicks:UseLockpick", source, false)
end)

QBCore.Functions.CreateUseableItem("advancedlockpick", function(source)
    TriggerClientEvent("lockpicks:UseLockpick", source, true)
end)

----------- / Unused

-- QBCore.Functions.CreateUseableItem("smoketrailred", function(source, item)
--     local Player = QBCore.Functions.GetPlayer(source)
-- 	if Player.Functions.RemoveItem(item.name, 1, item.slot) then
--         TriggerClientEvent("consumables:client:UseRedSmoke", source)
--     end
-- end)
