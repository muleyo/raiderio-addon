--
-- Copyright (c) 2024 by Ludicrous Speed, LLC
-- All rights reserved.
--
local provider={name=...,data=3,region="tw",date="2024-12-18T07:16:47Z",numCharacters=28859,lookup={},recordSizeInBytes=2,encodingOrder={0,1,3}}
local F

-- chunk size: 8
F = function() provider.lookup[1] = ";\4;\4\4\4\8\4" end F()

F = nil
RaiderIO.AddProvider(provider)
