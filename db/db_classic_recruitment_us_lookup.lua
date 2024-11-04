--
-- Copyright (c) 2024 by Ludicrous Speed, LLC
-- All rights reserved.
--
local provider={name=...,data=3,region="us",date="2024-11-04T06:15:07Z",numCharacters=108,lookup={},recordSizeInBytes=2,encodingOrder={0,1,3}}
local F

-- chunk size: 30
F = function() provider.lookup[1] = "\10\5\10\5\10\5\10\5\10\5\10\5\10\5\10\5\10\5\10\5\10\5\10\5\10\5\10\5\10\5" end F()

F = nil
RaiderIO.AddProvider(provider)
