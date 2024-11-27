--
-- Copyright (c) 2024 by Ludicrous Speed, LLC
-- All rights reserved.
--
local provider={name=...,data=3,region="tw",date="2024-11-27T08:12:32Z",numCharacters=33989,db={}}
local F

F = function() provider.db["世界之樹"]={0,"石小傑"} end F()

F = nil
RaiderIO.AddProvider(provider)
