--
-- Copyright (c) 2024 by Ludicrous Speed, LLC
-- All rights reserved.
--
local provider={name=...,data=3,region="us",date="2024-09-19T06:16:13Z",numCharacters=21,db={}}
local F

F = function() provider.db["Arugal"]={0,"Careface","Chubs","Harrock"} end F()
F = function() provider.db["Benediction"]={6,"Myboiblue"} end F()
F = function() provider.db["Atiesh"]={8,"Elrith"} end F()

F = nil
RaiderIO.AddProvider(provider)
