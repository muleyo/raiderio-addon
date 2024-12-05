--
-- Copyright (c) 2024 by Ludicrous Speed, LLC
-- All rights reserved.
--
local provider={name=...,data=3,region="tw",date="2024-12-05T07:18:13Z",numCharacters=31465,db={}}
local F

F = function() provider.db["世界之樹"]={0,"石小傑"} end F()
F = function() provider.db["暗影之月"]={2,"Jackj"} end F()

F = nil
RaiderIO.AddProvider(provider)
