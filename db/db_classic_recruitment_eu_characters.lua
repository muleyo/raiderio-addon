--
-- Copyright (c) 2024 by Ludicrous Speed, LLC
-- All rights reserved.
--
local provider={name=...,data=3,region="eu",date="2024-09-03T06:15:27Z",numCharacters=19,db={}}
local F

F = function() provider.db["MirageRaceway"]={0,"Daloon","Dýnem","Loneta","Sanshein","Taala","Veznik"} end F()
F = function() provider.db["Gehennas"]={12,"Gillgahr","Hagõ","Hagø"} end F()
F = function() provider.db["Lakeshire"]={18,"Rizzina"} end F()

F = nil
RaiderIO.AddProvider(provider)
