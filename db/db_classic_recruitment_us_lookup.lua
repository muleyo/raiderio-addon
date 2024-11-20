--
-- Copyright (c) 2024 by Ludicrous Speed, LLC
-- All rights reserved.
--
local provider={name=...,data=3,region="us",date="2024-11-20T06:09:26Z",numCharacters=44,lookup={},recordSizeInBytes=2,encodingOrder={0,1,3}}
local F

-- chunk size: 52
F = function() provider.lookup[1] = "\10\5\10\5\10\21\10\5\10\5\10\21\10\21\10\21\10\5\10\21\10\5\10\5\10\5\10\5\10\5\10\5\10\5\10\5\10\21\10\21\10\5\10\21\10\21\10\21\10\21\10\5" end F()

F = nil
RaiderIO.AddProvider(provider)
