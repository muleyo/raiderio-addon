--
-- Copyright (c) 2024 by Ludicrous Speed, LLC
-- All rights reserved.
--
local provider={name=...,data=3,region="eu",date="2024-09-28T06:15:30Z",numCharacters=33,db={}}
local F

F = function() provider.db["MirageRaceway"]={0,"Daloon","Dýnem","Loneta","Sanshein","Taala","Veznik"} end F()
F = function() provider.db["Auberdine"]={12,"Brecknar","Dkpeurtermiq","Ghostdiablo","Healren","Tynagaratea"} end F()
F = function() provider.db["Flamegor"]={22,"Ган","Дыкалыч","Киринн","Мыхалыч","Павуву","Пейнфула","Пейнфулаа","Пэйнфула","Пэйнфулла"} end F()
F = function() provider.db["Firemaw"]={40,"Arcusdruid","Husgris","Oranguboo","Oranguroo","Tigersclaw","Zaphyria","Zircona"} end F()
F = function() provider.db["Lakeshire"]={54,"Rizzina"} end F()
F = function() provider.db["Golemagg"]={56,"Yuts"} end F()
F = function() provider.db["Sulfuron"]={58,"Paden"} end F()

F = nil
RaiderIO.AddProvider(provider)
