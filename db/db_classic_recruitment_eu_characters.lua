--
-- Copyright (c) 2024 by Ludicrous Speed, LLC
-- All rights reserved.
--
local provider={name=...,data=3,region="eu",date="2024-09-25T06:18:03Z",numCharacters=28,db={}}
local F

F = function() provider.db["MirageRaceway"]={0,"Daloon","Dýnem","Loneta","Sanshein","Taala","Veznik"} end F()
F = function() provider.db["Flamegor"]={12,"Ган","Дыкалыч","Киринн","Мыхалыч","Павуву","Пейнфула","Пейнфулаа","Пэйнфула","Пэйнфулла"} end F()
F = function() provider.db["Firemaw"]={30,"Arcusdruid","Husgris","Oranguboo","Oranguroo","Tigersclaw","Zaphyria","Zircona"} end F()
F = function() provider.db["Lakeshire"]={44,"Rizzina"} end F()
F = function() provider.db["Golemagg"]={46,"Yuts"} end F()
F = function() provider.db["Sulfuron"]={48,"Paden"} end F()

F = nil
RaiderIO.AddProvider(provider)
