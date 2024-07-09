--
-- Copyright (c) 2023 by Ludicrous Speed, LLC
-- All rights reserved.
--
local provider={name=...,data=3,region="us",date="2024-07-09T06:10:24Z",numCharacters=187,lookup={},recordSizeInBytes=2,encodingOrder={0,1,3}}
local F

-- chunk size: 128
F = function() provider.lookup[1] = "\10\13\10\13\10\13\10\13\10\13\10\13\10\13\10\13\10\13\10\13\10\13\10\13\10\13\10\13\10\13\10\13\10\13\10\13\10\13\10\13\10\13\10\13\10\13\10\13\10\13\10\13\10\13\10\13\10\13\10\13\10\13\10\13\10\13\10\13\10\13\10\13\10\13\10\13\10\13\10\13\10\13\10\13\10\13\10\13\10\29\10\13\10\29\10\29\10\13\10\29\10\21\10\21\10\21\10\21\10\21\10\21\10\21\10\21\10\21\10\21\4\4\4\4\4\16\4\4" end F()

F = nil
RaiderIO.AddProvider(provider)
