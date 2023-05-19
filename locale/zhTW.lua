local ns = select(2, ...) ---@class ns @The addon namespace.

if ns:IsSameLocale("zhTW") then

	local L = ns.L or ns:NewLocale()
	ns.L = L

	L.LOCALE_NAME = "zhTW"

	--@localization(locale="zhTW", format="lua_additive_table", handle-unlocalized="blank", escape-non-ascii=false, table-name="L")@

end
