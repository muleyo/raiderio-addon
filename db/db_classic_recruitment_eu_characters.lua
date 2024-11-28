--
-- Copyright (c) 2024 by Ludicrous Speed, LLC
-- All rights reserved.
--
local provider={name=...,data=3,region="eu",date="2024-11-28T06:09:05Z",numCharacters=57,db={}}
local F

F = function() provider.db["PyrewoodVillage"]={0,"Ambelin","Ambelintvå","Bearsnout","Daethariel","Dystopatica","Elethia","Ellandrieth","Gnomelie","Gnuttus","Ludidoktor","Mordentha","Noshecant","Paliox","Psyvise","Syreczek","Wariox"} end F()
F = function() provider.db["Flamegor"]={32,"Джексколой","Келлибримбор","Чолик"} end F()
F = function() provider.db["Mandokir"]={38,"Sylverwing"} end F()
F = function() provider.db["Firemaw"]={40,"Bluntsy","Skruxy"} end F()

F = nil
RaiderIO.AddProvider(provider)
