--
-- Copyright (c) 2024 by Ludicrous Speed, LLC
-- All rights reserved.
--
local provider={name=...,data=3,region="tw",date="2024-09-22T06:52:12Z",numCharacters=23987,db={}}
local F

F = function() provider.db["眾星之子"]={0,"魘塵"} end F()

F = nil
RaiderIO.AddProvider(provider)
