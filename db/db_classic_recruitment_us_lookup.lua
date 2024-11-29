--
-- Copyright (c) 2024 by Ludicrous Speed, LLC
-- All rights reserved.
--
local provider={name=...,data=3,region="us",date="2024-11-29T06:08:52Z",numCharacters=57,lookup={},recordSizeInBytes=2,encodingOrder={0,1,3}}
local F

-- chunk size: 70
F = function() provider.lookup[1] = "\10\21\10\21\10\21\10\21\10\21\10\5\10\5\10\21\10\5\10\5\10\21\10\21\4\4\10\21\10\5\10\21\10\5\10\5\10\5\10\5\10\5\10\5\10\5\10\5\10\21\10\21\10\5\10\21\10\21\10\21\10\21\10\5\4\4\4\8\4\8" end F()

F = nil
RaiderIO.AddProvider(provider)
