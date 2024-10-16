--
-- Copyright (c) 2024 by Ludicrous Speed, LLC
-- All rights reserved.
--
local provider={name=...,data=3,region="eu",date="2024-10-16T06:15:46Z",numCharacters=41,db={}}
local F

F = function() provider.db["MirageRaceway"]={0,"Daloon","Dýnem","Loneta","Sanshein","Taala","Veznik"} end F()
F = function() provider.db["Auberdine"]={12,"Brecknar","Dkpeurtermiq","Ghostdiablo","Healren","Tynagaratea"} end F()
F = function() provider.db["Mandokir"]={22,"Choppeer","Explicita","Explicitø","Fendi","Gryphüs","Grÿphus","Moä","Rieh","Sylverwing","Titânia","Trankita","Trankïta","Trankös","Títania","Xplicitø"} end F()
F = function() provider.db["Firemaw"]={52,"Arcusdruid","Husgris","Oranguboo","Oranguroo","Tigersclaw","Zaphyria","Zircona"} end F()
F = function() provider.db["Golemagg"]={66,"Hypatus","Zigros"} end F()
F = function() provider.db["Gehennas"]={70,"Hairypowder"} end F()
F = function() provider.db["Lakeshire"]={72,"Tâhrox"} end F()

F = nil
RaiderIO.AddProvider(provider)
