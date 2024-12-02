--
-- Copyright (c) 2024 by Ludicrous Speed, LLC
-- All rights reserved.
--
local provider={name=...,data=3,region="kr",date="2024-12-02T08:11:53Z",numCharacters=32716,lookup={},recordSizeInBytes=2,encodingOrder={0,1,3}}
local F

-- chunk size: 16
F = function() provider.lookup[1] = "\169\30\169\30\169\30\169\30;\4;\4;\4;\4" end F()

F = nil
RaiderIO.AddProvider(provider)
