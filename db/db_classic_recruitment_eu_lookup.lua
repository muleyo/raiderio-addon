--
-- Copyright (c) 2024 by Ludicrous Speed, LLC
-- All rights reserved.
--
local provider={name=...,data=3,region="eu",date="2024-11-18T06:08:56Z",numCharacters=91,lookup={},recordSizeInBytes=2,encodingOrder={0,1,3}}
local F

-- chunk size: 128
F = function() provider.lookup[1] = "\10\5\10\5\10\13\10\5\10\13\10\13\10\5\10\5\10\5\10\13\10\13\10\13\10\13\10\13\10\13\10\13\10\5\10\5\10\13\10\13\10\13\10\13\10\13\10\13\10\5\10\13\10\13\10\13\10\13\10\13\10\13\10\13\10\13\10\5\10\13\10\13\10\13\10\13\10\13\10\13\10\13\10\13\10\13\10\13\10\13\10\13\10\13\10\13\10\9\10\9\10\9\10\13\10\13\10\13\10\13\10\13\10\13\10\13\10\21\4\4\4\4\4\4\4\4\4\8" end F()

F = nil
RaiderIO.AddProvider(provider)
