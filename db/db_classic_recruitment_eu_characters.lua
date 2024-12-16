--
-- Copyright (c) 2024 by Ludicrous Speed, LLC
-- All rights reserved.
--
local provider={name=...,data=3,region="eu",date="2024-12-16T06:08:38Z",numCharacters=27,db={}}
local F

F = function() provider.db["PyrewoodVillage"]={0,"Elethia","Ludidoktor","Noshecant","Paliox","Psyvise","Wariox"} end F()
F = function() provider.db["Golemagg"]={12,"Baraka","Noctüa","Nöctua"} end F()

F = nil
RaiderIO.AddProvider(provider)
