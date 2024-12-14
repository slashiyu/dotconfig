;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; Ignore Applications
#Include "C:\Users\%A_Username%\leverage\config\autohotkey\ignore.ahk"

GroupAdd "IgnoreApplications", "ahk_class Emacs" ; ignore Emacs

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; key bindings

#SuspendExempt
^\:: {
  Suspend(-1)
}
#SuspendExempt False

#HotIf not WinActive("ahk_group IgnoreApplications")

^p:: {
  Send("{Up}")
}

^n:: {
  Send("{Down}")
}

^f:: {
  Send("{Right}")
}

^b:: {
  Send("{Left}")
}

^a:: {
  Send("{Home}")
}

^e:: {
  Send("{End}")
}

^x:: {
  MsgBox("Enable Keys!") ;; for test
}

#HotIf WinActive("ahk_exe vivaldi.exe")
!Space:: {
  Send("{F2}") ;; Quick Commands
}

#Include "C:\Users\%A_Username%\leverage\config\autohotkey\keybindings.ahk"