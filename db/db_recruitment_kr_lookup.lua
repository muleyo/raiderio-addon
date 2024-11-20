--
-- Copyright (c) 2024 by Ludicrous Speed, LLC
-- All rights reserved.
--
local provider={name=...,data=3,region="kr",date="2024-11-20T08:12:29Z",numCharacters=33540,lookup={},recordSizeInBytes=2,encodingOrder={0,1,3}}
local F

-- chunk size: 8
F = function() provider.lookup[1] = "\169\30\169\30\169\30\169\30" end F()

F = nil
RaiderIO.AddProvider(provider)
