local ns = select(2, ...) ---@class ns @The addon namespace.

if ns:IsSameLocale("ptBR") then

	local L = ns.L or ns:NewLocale()
	ns.L = L

	L.LOCALE_NAME = "ptBR"

	--@localization(locale="ptBR", format="lua_additive_table", handle-unlocalized="blank", escape-non-ascii=false, table-name="L")@

end
