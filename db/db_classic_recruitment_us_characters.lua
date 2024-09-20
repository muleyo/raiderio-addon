--
-- Copyright (c) 2024 by Ludicrous Speed, LLC
-- All rights reserved.
--
local provider={name=...,data=3,region="us",date="2024-09-20T06:18:04Z",numCharacters=22,db={}}
local F

F = function() provider.db["Arugal"]={0,"Careface","Chubs","Harrock"} end F()
F = function() provider.db["Benediction"]={6,"Myboiblue"} end F()
F = function() provider.db["Atiesh"]={8,"Elrith"} end F()

F = nil
RaiderIO.AddProvider(provider)
