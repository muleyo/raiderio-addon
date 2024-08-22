--
-- Copyright (c) 2024 by Ludicrous Speed, LLC
-- All rights reserved.
--
local provider={name=...,data=3,region="eu",date="2024-08-22T06:36:20Z",numCharacters=73,db={}}
local F

F = function() provider.db["Lakeshire"]={0,"Aixai","Hanalka","Hildidin","Hildigardt","Hildíbrand","Lêf","Stormdancer"} end F()
F = function() provider.db["Everlook"]={14,"Chùcknourish","Drskrt","Innoblaster","Skrtexecute","Skrtrog","Skrtsp","Tanovdk","Tanovdr","Tanovic"} end F()
F = function() provider.db["Firemaw"]={32,"Lexapriest"} end F()

F = nil
RaiderIO.AddProvider(provider)
