<><><> <><><>

- Run "exec ui/fix.scr" anywhere in your Reborn server's map scripts.

- Without first going to MP options to load in their UI playermodels, players with the Menu Skin will not see their own models when pressing "Esc"; they will be blank boxes instead.
This server-side script fixes client-side consoles from spamming "RE_RegisterModel: NULL name" errors, occuring when the "Esc" menu stays open, by making players 
do stufftext "ui_getplayermodel" only once (after they load into a map), so their models can appear immediately.

<><><> <><><>