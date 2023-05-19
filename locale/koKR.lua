local ns = select(2, ...) ---@class ns @The addon namespace.

if ns:IsSameLocale("koKR") then

	local L = ns.L or ns:NewLocale()
	ns.L = L

	L.LOCALE_NAME = "koKR"

	--@localization(locale="koKR", format="lua_additive_table", handle-unlocalized="blank", escape-non-ascii=false, table-name="L")@

end
