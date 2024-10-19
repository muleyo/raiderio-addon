--
-- Copyright (c) 2024 by Ludicrous Speed, LLC
-- All rights reserved.
--
local provider={name=...,data=3,region="kr",date="2024-10-19T09:14:32Z",numCharacters=30933,lookup={},recordSizeInBytes=2,encodingOrder={0,1,3}}
local F

-- chunk size: 8
F = function() provider.lookup[1] = "\22\4\22\4;\4\22\4" end F()

F = nil
RaiderIO.AddProvider(provider)
