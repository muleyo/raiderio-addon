--
-- Copyright (c) 2024 by Ludicrous Speed, LLC
-- All rights reserved.
--
local provider={name=...,data=3,region="us",date="2024-08-29T06:14:38Z",numCharacters=26,db={}}
local F

F = function() provider.db["Mankrik"]={0,"Coofoosuh","Deameus","Fyring","Koochlair","Peenlss","Saviorsux","ßananadin"} end F()
F = function() provider.db["Benediction"]={14,"Clutchkyro","Myboiblue"} end F()

F = nil
RaiderIO.AddProvider(provider)
