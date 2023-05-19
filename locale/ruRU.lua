local ns = select(2, ...) ---@class ns @The addon namespace.

if ns:IsSameLocale("ruRU") then

	local L = ns.L or ns:NewLocale()
	ns.L = L

	L.LOCALE_NAME = "ruRU"

	--@localization(locale="ruRU", format="lua_additive_table", handle-unlocalized="blank", escape-non-ascii=false, table-name="L")@

end
