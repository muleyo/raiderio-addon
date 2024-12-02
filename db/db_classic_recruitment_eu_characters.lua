--
-- Copyright (c) 2024 by Ludicrous Speed, LLC
-- All rights reserved.
--
local provider={name=...,data=3,region="eu",date="2024-12-02T06:09:31Z",numCharacters=66,db={}}
local F

F = function() provider.db["PyrewoodVillage"]={0,"Ambelin","Ambelintvå","Bearsnout","Daethariel","Dystopatica","Elethia","Ellandrieth","Gnomelie","Gnuttus","Ludidoktor","Mordentha","Noshecant","Paliox","Psyvise","Syreczek","Wariox"} end F()
F = function() provider.db["Flamegor"]={32,"Джексколой","Келлибримбор","Синастрия","Скьолл","Тэтцуо","Чолик"} end F()
F = function() provider.db["Mandokir"]={44,"Sylverwing"} end F()
F = function() provider.db["Firemaw"]={46,"Bluntsy","Skruxy"} end F()
F = function() provider.db["Golemagg"]={50,"Justfrosty","Justfrostydd","Justfrostydk","Justfrostydr","Justfrostyh","Justfrostypl","Shamikazze"} end F()

F = nil
RaiderIO.AddProvider(provider)
