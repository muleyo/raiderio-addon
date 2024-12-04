--
-- Copyright (c) 2024 by Ludicrous Speed, LLC
-- All rights reserved.
--
local provider={name=...,data=3,region="tw",date="2024-12-04T00:40:30Z",numCharacters=32050,db={}}
local F

F = function() provider.db["世界之樹"]={0,"石小傑"} end F()

F = nil
RaiderIO.AddProvider(provider)
