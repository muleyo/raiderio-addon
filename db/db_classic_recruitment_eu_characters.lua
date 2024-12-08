--
-- Copyright (c) 2024 by Ludicrous Speed, LLC
-- All rights reserved.
--
local provider={name=...,data=3,region="eu",date="2024-12-08T06:08:47Z",numCharacters=42,db={}}
local F

F = function() provider.db["PyrewoodVillage"]={0,"Elethia","Ludidoktor","Noshecant","Paliox","Psyvise","Wariox"} end F()
F = function() provider.db["Mandokir"]={12,"Sylverwing"} end F()
F = function() provider.db["Firemaw"]={14,"Bluntsy","Skruxy"} end F()
F = function() provider.db["Golemagg"]={18,"Baraka","Justfrosty","Justfrostydd","Justfrostydk","Justfrostydr","Justfrostyh","Justfrostypl","Noctüa","Nöctua","Shamikazze"} end F()
F = function() provider.db["Flamegor"]={38,"Синастрия","Скьолл","Тэтцуо"} end F()

F = nil
RaiderIO.AddProvider(provider)
