--
-- Copyright (c) 2024 by Ludicrous Speed, LLC
-- All rights reserved.
--
local provider={name=...,data=3,region="eu",date="2024-12-14T06:08:37Z",numCharacters=30,lookup={},recordSizeInBytes=2,encodingOrder={0,1,3}}
local F

-- chunk size: 24
F = function() provider.lookup[1] = "\10\29\10\29\10\29\10\29\10\29\10\29\4\4\4\4\4\4\4\4\4\4\4\8" end F()

F = nil
RaiderIO.AddProvider(provider)
