--
-- Copyright (c) 2024 by Ludicrous Speed, LLC
-- All rights reserved.
--
local provider={name=...,data=3,region="eu",date="2024-12-10T06:08:55Z",numCharacters=39,db={}}
local F

F = function() provider.db["PyrewoodVillage"]={0,"Elethia","Ludidoktor","Noshecant","Paliox","Psyvise","Wariox"} end F()
F = function() provider.db["Firemaw"]={12,"Bluntsy","Skruxy"} end F()
F = function() provider.db["Golemagg"]={16,"Baraka","Justfrostydd","Justfrostydk","Justfrostydr","Justfrostyh","Justfrostypl","Noctüa","Nöctua","Shamikazze"} end F()
F = function() provider.db["Flamegor"]={34,"Синастрия","Скьолл","Тэтцуо"} end F()

F = nil
RaiderIO.AddProvider(provider)
