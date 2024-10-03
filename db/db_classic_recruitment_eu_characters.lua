--
-- Copyright (c) 2024 by Ludicrous Speed, LLC
-- All rights reserved.
--
local provider={name=...,data=3,region="eu",date="2024-10-03T06:16:59Z",numCharacters=51,db={}}
local F

F = function() provider.db["MirageRaceway"]={0,"Daloon","Dýnem","Loneta","Sanshein","Taala","Veznik"} end F()
F = function() provider.db["Auberdine"]={12,"Brecknar","Dkpeurtermiq","Ghostdiablo","Healren","Tynagaratea"} end F()
F = function() provider.db["Mandokir"]={22,"Choppeer","Explicita","Explicitø","Fendi","Gryphüs","Grÿphus","Moä","Sylverwing","Titânia","Trankita","Trankïta","Trankös","Títania","Xplicitø"} end F()
F = function() provider.db["Flamegor"]={50,"Ган","Дыкалыч","Киринн","Мыхалыч","Павуву","Пейнфула","Пейнфулаа","Пэйнфула","Пэйнфулла"} end F()
F = function() provider.db["Firemaw"]={68,"Arcusdruid","Husgris","Oranguboo","Oranguroo","Ornális","Tigersclaw","Zaphyria","Zircona"} end F()
F = function() provider.db["Golemagg"]={84,"Smiskey","Tovalina","Tovaliza","Yuts"} end F()
F = function() provider.db["Sulfuron"]={92,"Paden"} end F()
F = function() provider.db["Gehennas"]={94,"Zínet"} end F()

F = nil
RaiderIO.AddProvider(provider)
