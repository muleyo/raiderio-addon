--
-- Copyright (c) 2024 by Ludicrous Speed, LLC
-- All rights reserved.
--
local provider={name=...,data=3,region="eu",date="2024-11-26T06:14:18Z",numCharacters=57,db={}}
local F

F = function() provider.db["PyrewoodVillage"]={0,"Ambelin","Ambelintvå","Bearsnout","Daethariel","Dystopatica","Elethia","Ellandrieth","Gnomelie","Gnuttus","Ludidoktor","Mordentha","Noshecant","Paliox","Psyvise","Syreczek","Wariox"} end F()
F = function() provider.db["Flamegor"]={32,"Джексколой","Келлибримбор","Чолик"} end F()
F = function() provider.db["Mandokir"]={38,"Sylverwing"} end F()
F = function() provider.db["Gehennas"]={40,"Jijelt","Zöega"} end F()
F = function() provider.db["Sulfuron"]={44,"Shyyz"} end F()

F = nil
RaiderIO.AddProvider(provider)
