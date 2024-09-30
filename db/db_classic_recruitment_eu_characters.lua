--
-- Copyright (c) 2024 by Ludicrous Speed, LLC
-- All rights reserved.
--
local provider={name=...,data=3,region="eu",date="2024-09-30T06:15:45Z",numCharacters=47,db={}}
local F

F = function() provider.db["MirageRaceway"]={0,"Daloon","Dýnem","Loneta","Sanshein","Taala","Veznik"} end F()
F = function() provider.db["Auberdine"]={12,"Brecknar","Dkpeurtermiq","Ghostdiablo","Healren","Tynagaratea"} end F()
F = function() provider.db["Mandokir"]={22,"Choppeer","Explicita","Explicitø","Fendi","Gryphüs","Grÿphus","Moä","Sylverwing","Titânia","Trankita","Trankïta","Trankös","Títania","Xplicitø"} end F()
F = function() provider.db["Flamegor"]={50,"Ган","Дыкалыч","Киринн","Мыхалыч","Павуву","Пейнфула","Пейнфулаа","Пэйнфула","Пэйнфулла"} end F()
F = function() provider.db["Firemaw"]={68,"Arcusdruid","Husgris","Oranguboo","Oranguroo","Tigersclaw","Zaphyria","Zircona"} end F()
F = function() provider.db["Lakeshire"]={82,"Rizzina"} end F()
F = function() provider.db["Golemagg"]={84,"Yuts"} end F()
F = function() provider.db["Sulfuron"]={86,"Paden"} end F()

F = nil
RaiderIO.AddProvider(provider)
