--
-- Copyright (c) 2024 by Ludicrous Speed, LLC
-- All rights reserved.
--
local provider={name=...,data=3,region="kr",date="2024-11-22T08:08:38Z",numCharacters=33502,db={}}
local F

F = function() provider.db["아즈샤라"]={0,"Luntik","Naussea","Plastelin","Xyu"} end F()

F = nil
RaiderIO.AddProvider(provider)
