--
-- Copyright (c) 2024 by Ludicrous Speed, LLC
-- All rights reserved.
--
local provider={name=...,data=3,region="us",date="2024-09-04T06:14:42Z",numCharacters=22,db={}}
local F

F = function() provider.db["Mankrik"]={0,"Coofoosuh","Deameus","Fyring","Koochlair","Peenlss","Saviorsux","ßananadin"} end F()
F = function() provider.db["Arugal"]={14,"Careface","Chubs","Harrock"} end F()
F = function() provider.db["Benediction"]={20,"Clutchkyro","Myboiblue"} end F()

F = nil
RaiderIO.AddProvider(provider)
