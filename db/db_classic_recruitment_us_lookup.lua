--
-- Copyright (c) 2024 by Ludicrous Speed, LLC
-- All rights reserved.
--
local provider={name=...,data=3,region="us",date="2024-12-04T06:08:53Z",numCharacters=54,lookup={},recordSizeInBytes=2,encodingOrder={0,1,3}}
local F

-- chunk size: 44
F = function() provider.lookup[1] = "\10\21\10\21\10\21\10\21\10\21\10\13\10\13\10\13\10\21\10\21\4\4\10\21\10\21\10\21\10\21\10\21\10\21\10\21\10\21\4\4\4\8\4\8" end F()

F = nil
RaiderIO.AddProvider(provider)
