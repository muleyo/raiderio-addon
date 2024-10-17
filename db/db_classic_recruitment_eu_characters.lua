--
-- Copyright (c) 2024 by Ludicrous Speed, LLC
-- All rights reserved.
--
local provider={name=...,data=3,region="eu",date="2024-10-17T06:18:06Z",numCharacters=42,db={}}
local F

F = function() provider.db["MirageRaceway"]={0,"Daloon","Dýnem","Loneta","Sanshein","Taala","Veznik"} end F()
F = function() provider.db["Auberdine"]={12,"Brecknar","Dkpeurtermiq","Ghostdiablo","Healren","Tynagaratea"} end F()
F = function() provider.db["Mandokir"]={22,"Choppeer","Explicita","Explicitø","Fendi","Gryphüs","Grÿphus","Moä","Rieh","Sylverwing","Titânia","Trankita","Trankïta","Trankös","Títania","Xplicitø"} end F()
F = function() provider.db["Firemaw"]={52,"Arcusdruid","Dmentor","Husgris","Oranguboo","Oranguroo","Tigersclaw","Zaphyria","Zircona"} end F()
F = function() provider.db["Golemagg"]={68,"Hypatus","Zigros"} end F()
F = function() provider.db["Gehennas"]={72,"Hairypowder"} end F()
F = function() provider.db["Lakeshire"]={74,"Tâhrox"} end F()

F = nil
RaiderIO.AddProvider(provider)
