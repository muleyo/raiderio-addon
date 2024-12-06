--
-- Copyright (c) 2024 by Ludicrous Speed, LLC
-- All rights reserved.
--
local provider={name=...,data=3,region="eu",date="2024-12-06T06:08:47Z",numCharacters=53,db={}}
local F

F = function() provider.db["PyrewoodVillage"]={0,"Ambelin","Ambelintvå","Bearsnout","Daethariel","Dystopatica","Elethia","Ellandrieth","Gnomelie","Gnuttus","Ludidoktor","Mordentha","Noshecant","Paliox","Psyvise","Wariox"} end F()
F = function() provider.db["Mandokir"]={30,"Sylverwing"} end F()
F = function() provider.db["Firemaw"]={32,"Bluntsy","Skruxy"} end F()
F = function() provider.db["Golemagg"]={36,"Baraka","Justfrosty","Justfrostydd","Justfrostydk","Justfrostydr","Justfrostyh","Justfrostypl","Noctüa","Nöctua","Shamikazze"} end F()
F = function() provider.db["Flamegor"]={56,"Синастрия","Скьолл","Тэтцуо"} end F()

F = nil
RaiderIO.AddProvider(provider)
