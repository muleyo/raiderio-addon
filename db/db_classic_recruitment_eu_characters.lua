--
-- Copyright (c) 2024 by Ludicrous Speed, LLC
-- All rights reserved.
--
local provider={name=...,data=3,region="eu",date="2024-08-29T06:14:38Z",numCharacters=26,db={}}
local F

F = function() provider.db["MirageRaceway"]={0,"Daloon","Dýnem","Loneta","Sanshein","Taala","Veznik"} end F()
F = function() provider.db["Everlook"]={12,"Chùcknourish","Drskrt","Innoblaster","Skrtexecute","Skrtrog","Skrtsp","Tanovdk","Tanovdr","Tanovic"} end F()
F = function() provider.db["Gehennas"]={30,"Hagõ","Hagø"} end F()

F = nil
RaiderIO.AddProvider(provider)
