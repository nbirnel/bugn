Config_saveSession() {
	Local m, text
	
	text := "; bug.n - tiling window management`n; @version " VERSION " (" A_DD "." A_MM "." A_YYYY ")`n`n"
    ; Read our config if it exists, and keep all of the Config_ lines
	If FileExist(Config_filePath) {
		Loop, READ, %Config_filePath%
			If (SubStr(A_LoopReadLine, 1, 7) = "Config_")
				text .= A_LoopReadLine "`n"
			If (SubStr(A_LoopReadLine, 1, 1) = ";")
				text .= A_LoopReadLine "`n"
		text .= "`n"
	}
	FileDelete, %Config_filePath%
	
	Loop, % Manager_monitorCount {
		m := A_Index
		If Not (Monitor_#%m%_aView_#1 = 1)
			text .= "Monitor_#" m "_aView_#1=" Monitor_#%m%_aView_#1 "`n"
		If Not (Monitor_#%m%_aView_#2 = 1)
			text .= "Monitor_#" m "_aView_#2=" Monitor_#%m%_aView_#2 "`n"
		If Not (Monitor_#%m%_showBar = Config_showBar)
			text .= "Monitor_#" m "_showBar=" Monitor_#%m%_showBar "`n"
		Loop, % Config_viewCount {
			If Not (View_#%m%_#%A_Index%_layout_#1 = 1)
				text .= "View_#" m "_#" A_Index "_layout_#1=" View_#%m%_#%A_Index%_layout_#1 "`n"
			If Not (View_#%m%_#%A_Index%_layout_#2 = 1)
				text .= "View_#" m "_#" A_Index "_layout_#2=" View_#%m%_#%A_Index%_layout_#2 "`n"
			If Not (View_#%m%_#%A_Index%_layoutAxis_#1 = Config_layoutAxis_#1)
				text .= "View_#" m "_#" A_Index "_layoutAxis_#1=" View_#%m%_#%A_Index%_layoutAxis_#1 "`n"
			If Not (View_#%m%_#%A_Index%_layoutAxis_#2 = Config_layoutAxis_#2)
				text .= "View_#" m "_#" A_Index "_layoutAxis_#2=" View_#%m%_#%A_Index%_layoutAxis_#2 "`n"
			If Not (View_#%m%_#%A_Index%_layoutAxis_#3 = Config_layoutAxis_#3)
				text .= "View_#" m "_#" A_Index "_layoutAxis_#3=" View_#%m%_#%A_Index%_layoutAxis_#3 "`n"
			If Not (View_#%m%_#%A_Index%_layoutMFact = Config_layoutMFactor)
				text .= "View_#" m "_#" A_Index "_layoutMFact=" View_#%m%_#%A_Index%_layoutMFact "`n"
			If Not (View_#%m%_#%A_Index%_layoutMSplit = 1)
				text .= "View_#" m "_#" A_Index "_layoutMSplit=" View_#%m%_#%A_Index%_layoutMSplit "`n"
		}
	}
	
	FileAppend, %text%, %Config_filePath%
}

