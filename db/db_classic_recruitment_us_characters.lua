--
-- Copyright (c) 2024 by Ludicrous Speed, LLC
-- All rights reserved.
--
local provider={name=...,data=3,region="us",date="2024-11-03T06:15:47Z",numCharacters=91,db={}}
local F

F = function() provider.db["Mankrik"]={0,"Zoëy"} end F()

F = nil
RaiderIO.AddProvider(provider)
