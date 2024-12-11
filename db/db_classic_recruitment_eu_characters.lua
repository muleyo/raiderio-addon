--
-- Copyright (c) 2024 by Ludicrous Speed, LLC
-- All rights reserved.
--
local provider={name=...,data=3,region="eu",date="2024-12-11T06:09:00Z",numCharacters=37,db={}}
local F

F = function() provider.db["PyrewoodVillage"]={0,"Elethia","Ludidoktor","Noshecant","Paliox","Psyvise","Wariox"} end F()
F = function() provider.db["Golemagg"]={12,"Baraka","Justfrostydd","Justfrostydk","Justfrostydr","Justfrostyh","Justfrostypl","Noctüa","Nöctua","Shamikazze"} end F()
F = function() provider.db["Flamegor"]={30,"Синастрия","Скьолл","Тэтцуо"} end F()

F = nil
RaiderIO.AddProvider(provider)
