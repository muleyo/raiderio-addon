--
-- Copyright (c) 2024 by Ludicrous Speed, LLC
-- All rights reserved.
--
local provider={name=...,data=3,region="us",date="2024-11-28T06:09:05Z",numCharacters=57,db={}}
local F

F = function() provider.db["Whitemane"]={0,"Gsm","Gunpowder","Jadey","Tramclam","Vrokar"} end F()
F = function() provider.db["Mankrik"]={10,"Ayahuascå","Ayå","Blazem","Davinthian","Dethknel","Galacnocok","Grukori","Huuzzin","Kadron","Mayorsluv","Message","Oakenhooves","Reeana","Reeath","Reeck","Reegue","Reeny","Screamzz","Steelhorns","Styggmz","Styggz","Tassadór","Tyder","Tydesin","Tydison","Weast","Zulabiba"} end F()
F = function() provider.db["Atiesh"]={64,"Immadk","Immaheal"} end F()
F = function() provider.db["Benediction"]={68,"Baraz"} end F()

F = nil
RaiderIO.AddProvider(provider)
