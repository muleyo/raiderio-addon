--
-- Copyright (c) 2024 by Ludicrous Speed, LLC
-- All rights reserved.
--
local provider={name=...,data=3,region="eu",date="2024-12-14T06:08:37Z",numCharacters=30,db={}}
local F

F = function() provider.db["PyrewoodVillage"]={0,"Elethia","Ludidoktor","Noshecant","Paliox","Psyvise","Wariox"} end F()
F = function() provider.db["Flamegor"]={12,"Синастрия","Скьолл","Тэтцуо"} end F()
F = function() provider.db["Golemagg"]={18,"Baraka","Noctüa","Nöctua"} end F()

F = nil
RaiderIO.AddProvider(provider)
