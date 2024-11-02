--
-- Copyright (c) 2024 by Ludicrous Speed, LLC
-- All rights reserved.
--
local provider={name=...,data=3,region="us",date="2024-11-02T06:15:21Z",numCharacters=94,db={}}
local F

F = function() provider.db["Arugal"]={0,"Careface","Chubs","Harrock"} end F()
F = function() provider.db["Mankrik"]={6,"Zoëy"} end F()

F = nil
RaiderIO.AddProvider(provider)
