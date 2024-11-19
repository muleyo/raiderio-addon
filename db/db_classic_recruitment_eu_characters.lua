--
-- Copyright (c) 2024 by Ludicrous Speed, LLC
-- All rights reserved.
--
local provider={name=...,data=3,region="eu",date="2024-11-19T06:09:00Z",numCharacters=52,db={}}
local F

F = function() provider.db["Mandokir"]={0,"Sylverwing"} end F()
F = function() provider.db["PyrewoodVillage"]={2,"Ambelin","Ambelintvå","Bearsnout","Daethariel","Dystopatica","Ellandrieth","Gnomelie","Gnuttus","Mordentha","Syreczek"} end F()
F = function() provider.db["Flamegor"]={22,"Джексколой","Келлибримбор","Чолик"} end F()
F = function() provider.db["Firemaw"]={28,"Arcusdruid","Husgris","Oranguboo","Oranguroo","Tigersclaw","Zaphyria","Zircona"} end F()
F = function() provider.db["Golemagg"]={42,"Pivvo"} end F()
F = function() provider.db["Gehennas"]={44,"Jijelt","Zöega"} end F()
F = function() provider.db["Sulfuron"]={48,"Shyyz"} end F()

F = nil
RaiderIO.AddProvider(provider)
