--
-- Copyright (c) 2024 by Ludicrous Speed, LLC
-- All rights reserved.
--
local provider={name=...,data=3,region="eu",date="2024-08-24T06:15:43Z",numCharacters=66,lookup={},recordSizeInBytes=2,encodingOrder={0,1,3}}
local F

-- chunk size: 18
F = function() provider.lookup[1] = "\10\25\10\25\10\25\10\25\10\25\10\25\10\25\10\25\10\25" end F()

F = nil
RaiderIO.AddProvider(provider)
