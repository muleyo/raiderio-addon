--
-- Copyright (c) 2024 by Ludicrous Speed, LLC
-- All rights reserved.
--
local provider={name=...,data=3,region="us",date="2024-12-05T06:08:36Z",numCharacters=53,db={}}
local F

F = function() provider.db["Whitemane"]={0,"Gsm","Gunpowder","Jadey","Tramclam","Vrokar"} end F()
F = function() provider.db["Arugal"]={10,"Careface","Chubs","Harrock"} end F()
F = function() provider.db["Mankrik"]={16,"Blazem","Galacnocok","Huuzzin","Kadron","Message","Styggmz","Styggz","Tyder","Tydesin","Tydison","Weast"} end F()
F = function() provider.db["Atiesh"]={38,"Immadk","Immaheal"} end F()
F = function() provider.db["Benediction"]={42,"Baraz"} end F()

F = nil
RaiderIO.AddProvider(provider)
