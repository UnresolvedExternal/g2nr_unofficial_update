###################################
##      ������������ ������      ##
###################################

!include "MUI.nsh"
!include "FileFunc.nsh"

###################################
##            ��������           ##
###################################

!define MOD_VERSION "23"
!define MOD_NAME "G2a_NR_ScriptPatch_v${MOD_VERSION}"
!define MOD_NAME_RU "������������� ���������� �2��"
!define MOD_DETAILED_VERSION "1.${MOD_VERSION}.30.8"
!define MOD_AUTHOR "Fizzban, Efectivo, Dimus, D36, Kvincius"
!define INSTALLER_NAME "G2a_NR_ScriptPatch_v${MOD_VERSION}_install"
!define UNINSTALLER_NAME "G2a_NR_ScriptPatch_v${MOD_VERSION}_uninstall"

Name "${MOD_NAME}"
OutFile "${INSTALLER_NAME}.exe"

VIProductVersion "${MOD_DETAILED_VERSION}"
VIAddVersionKey "FileVersion" "${INSTALLER_VERSION}"
VIAddVersionKey "LegalCopyright" "� ${MOD_AUTHOR}"
VIAddVersionKey "FileDescription" "${MOD_NAME_RU}"
VIAddVersionKey "ProductVersion" "1.${MOD_VERSION}"

Unicode true
SetCompressor lzma

###################################
##      ��������� ����������     ##
###################################

!define MUI_ICON "G2a_NR_ScriptPatch_v${MOD_VERSION}.ico"
!define MUI_UNICON "G2a_NR_ScriptPatch_v${MOD_VERSION}.ico"
!define MUI_HEADERIMAGE
!define MUI_HEADERIMAGE_BITMAP "logo.bmp"
!define MUI_HEADERIMAGE_UNBITMAP "logo.bmp"
!define MUI_WELCOMEFINISHPAGE_BITMAP "pic.bmp"
!define MUI_UNWELCOMEFINISHPAGE_BITMAP "pic.bmp"

Caption "${MOD_NAME_RU} (v${MOD_VERSION}) - ���������"
!define MUI_TEXT_WELCOME_INFO_TITLE " "
!define MUI_TEXT_WELCOME_INFO_TEXT "������ ���������� ���������� ��������� ��������� ������ � ����������� � ���� ������� 2: ���� ������. ��������� ������������� �� ������� ������ ���� �� ������ � ������������� Player Kit. ������ ���������� ����� ������ ������ �� ��������������: ������ ����� ���� �����������!"

!define MUI_TEXT_DIRECTORY_SUBTITLE " "
DirText "��������� ��������� ������������� ���������� � ��������� �����. \
$\n$\n����� ���������� ������������� ���������� � ������ �����, ������� ������ '����� ...' � ������� ��."

!define MUI_TEXT_COMPONENTS_TITLE "����� ����������� ��� ���������"
!define MUI_TEXT_COMPONENTS_SUBTITLE " "
!define MUI_COMPONENTSPAGE_TEXT_TOP "�������� ���������� ����������, ������� �� ������ ����������.$\n������� ������ '����������' ��� �����������."
!define MUI_COMPONENTSPAGE_TEXT_COMPLIST "���������� ��� ���������:"
!define MUI_COMPONENTSPAGE_SMALLDESC

!define MUI_TEXT_INSTALLING_TITLE "����������� ������..."
!define MUI_TEXT_INSTALLING_SUBTITLE " "

!define MUI_TEXT_FINISH_INFO_TITLE "$\t   $\n$\t��������� ���������!"
!define MUI_TEXT_FINISH_INFO_TEXT "�������� ����! ������� ������ '������' ��� ����������."

UninstallCaption "${MOD_NAME_RU} (v${MOD_VERSION}) - ��������"

!define MUI_UNTEXT_COMPONENTS_TITLE "����� ����������� ��� ��������"
!define MUI_UNTEXT_COMPONENTS_SUBTITLE " "

!define MUI_UNTEXT_FINISH_INFO_TITLE " "
!define MUI_UNTEXT_FINISH_INFO_TEXT "��� ��������� ���������� �������������� ���������� ������� �� ����� � �����. ������� ������ '������' ��� ����������."

BrandingText " "

###################################
##     ��������  ������������    ##
###################################

!insertmacro MUI_PAGE_WELCOME
!insertmacro MUI_PAGE_DIRECTORY
!insertmacro MUI_PAGE_COMPONENTS
!insertmacro MUI_PAGE_INSTFILES
!insertmacro MUI_PAGE_FINISH

###################################
##    ��������  ��������������   ##
###################################

!define MUI_COMPONENTSPAGE_TEXT_TOP "�������� ���������� �������������� ����������, ������� �� ������ �������.$\n������� ������ '�������' ��� �����������."
!define MUI_COMPONENTSPAGE_TEXT_COMPLIST "���������� ��� ��������:"
!insertmacro MUI_UNPAGE_COMPONENTS
!insertmacro MUI_UNPAGE_INSTFILES
!insertmacro MUI_UNPAGE_FINISH

###################################
##             �����             ##
###################################

!insertmacro MUI_LANGUAGE "Russian"

###################################
##            �������            ##
###################################

!macro GMF_Delete FILENAME
	IfFileExists "${FILENAME}" "" +2
	Delete "${FILENAME}"
!macroend

###################################
##          �����������          ##
###################################

Section "�������� �����" SecMain
	SectionIn RO
	CreateDirectory "$INSTDIR\saves_G2a_NR_ScriptPatch_v${MOD_VERSION}\current"

	IfFileExists "$INSTDIR\data\MENU_AutoScale_G2.vdf" menu_found menu_not_found
	menu_found:
	SetOutPath "$INSTDIR\data\ModVDF"
	File "g2a_nr_scriptpatch_v${MOD_VERSION}_autoscale.mod"
	goto check_end
	menu_not_found:
	check_end:

	SetOutPath "$INSTDIR\data\ModVDF"
	File "g2a_nr_scriptpatch_v${MOD_VERSION}.mod"

	SetOutPath "$INSTDIR\system"
	File "G2a_NR_ScriptPatch_v${MOD_VERSION}.ico"
	File "G2a_NR_ScriptPatch_v${MOD_VERSION}.ini"
	File "G2a_NR_ScriptPatch_v${MOD_VERSION}.rtf"

	SetOutPath "$INSTDIR"
	File "Changelog_G2a_NR_ScriptPatch_v${MOD_VERSION}.txt"
	WriteUninstaller "$INSTDIR\${UNINSTALLER_NAME}.exe"

	WriteRegStr HKCU "Software\${MOD_NAME}" "InstallLocation" $INSTDIR
	WriteRegStr HKLM "Software\Microsoft\Windows\CurrentVersion\Uninstall\${MOD_NAME}" "DisplayName" "${MOD_NAME_RU} (v${MOD_VERSION})" 
	WriteRegStr HKLM "Software\Microsoft\Windows\CurrentVersion\Uninstall\${MOD_NAME}" "DisplayVersion" "${MOD_DETAILED_VERSION}" 
	WriteRegStr HKLM "Software\Microsoft\Windows\CurrentVersion\Uninstall\${MOD_NAME}" "InstallLocation" "$INSTDIR"
	WriteRegStr HKLM "Software\Microsoft\Windows\CurrentVersion\Uninstall\${MOD_NAME}" "UninstallString" "$INSTDIR\${UNINSTALLER_NAME}.exe"
	WriteRegStr HKLM "Software\Microsoft\Windows\CurrentVersion\Uninstall\${MOD_NAME}" "HelpLink" "http://worldofplayers.ru/threads/36817"
	WriteRegStr HKLM "Software\Microsoft\Windows\CurrentVersion\Uninstall\${MOD_NAME}" "Publisher" "${MOD_AUTHOR}"
	WriteRegStr HKLM "Software\Microsoft\Windows\CurrentVersion\Uninstall\${MOD_NAME}" "DisplayIcon" "$INSTDIR\system\G2a_NR_ScriptPatch_v${MOD_VERSION}.ico"
	WriteRegDWORD HKLM "Software\Microsoft\Windows\CurrentVersion\Uninstall\${MOD_NAME}" "EstimatedSize" "230000"
SectionEnd

Section /o "����������� ����" SecAdditional_1
	SetOutPath "$INSTDIR\data\ModVDF"
	File "g2a_nr_scriptpatch_v${MOD_VERSION}_autoscale.mod"
SectionEnd

Section /o "����������� ������� �������" SecAdditional_2
	SetOutPath "$INSTDIR\data\ModVDF"
	File "g2a_nr_scriptpatch_v${MOD_VERSION}_speech.mod"
	SetOutPath "$INSTDIR"
	File "Speech_Changelog.txt"
SectionEnd

Section /o "����������� ���������� ������" SecAdditional_3
	SetOutPath "$INSTDIR\data\ModVDF"
	File "g2a_nr_scriptpatch_v${MOD_VERSION}_wasteland.mod"
SectionEnd

###################################
##         �������������         ##
###################################

Section "Un.������� ����������" SecUninstall_Main
	SectionIn RO
	Call Un.GMF_Delete_Components
	Delete "$INSTDIR\${UNINSTALLER_NAME}.exe"
	DeleteRegKey HKLM "Software\Microsoft\Windows\CurrentVersion\Uninstall\${MOD_NAME}"
SectionEnd

Section /o "Un.������� ����������" SecUninstall_Saves
	RMDir /r "$INSTDIR\saves_G2a_NR_ScriptPatch_v${MOD_VERSION}"
SectionEnd

###################################
##     �������� �����������      ##
###################################

LangString DESC_SecMain ${LANG_RUSSIAN} "�������� ���������� ����������."
LangString DESC_SecAdditional_1 ${LANG_RUSSIAN} "����������� ���� ��������, ������������� � �������� ���� ��� ������� ����������."
LangString DESC_SecAdditional_2 ${LANG_RUSSIAN} "������������� ����������� ������� ������� �� ������ (������ 1.14)."
LangString DESC_SecAdditional_3 ${LANG_RUSSIAN} "��� Wasteland, ����������� � ����������� ����� ���������� ������ �� �������� ������ 1."

!insertmacro MUI_FUNCTION_DESCRIPTION_BEGIN
!insertmacro MUI_DESCRIPTION_TEXT ${SecMain} $(DESC_SecMain)
!insertmacro MUI_DESCRIPTION_TEXT ${SecAdditional_1} $(DESC_SecAdditional_1)
!insertmacro MUI_DESCRIPTION_TEXT ${SecAdditional_2} $(DESC_SecAdditional_2)
!insertmacro MUI_DESCRIPTION_TEXT ${SecAdditional_3} $(DESC_SecAdditional_3)
!insertmacro MUI_FUNCTION_DESCRIPTION_END

###################################
##            �������            ##
###################################

Function .onInit
	SetSilent normal
	!insertmacro MUI_LANGDLL_DISPLAY
	ReadRegStr $INSTDIR HKCU "Software\${MOD_NAME}" "InstallLocation"
	StrCmp $INSTDIR "" "" InstallPathIsFound
	StrCpy $INSTDIR "$PROGRAMFILES\Akella\Gothic II"
	InstallPathIsFound:
FunctionEnd

Function .onVerifyInstDir
	IfFileExists "$INSTDIR\system\GothicStarter.exe" CheckIsSuccessful
	Abort
	CheckIsSuccessful:
FunctionEnd

Function Un.GMF_Delete_Components
	!insertmacro GMF_Delete "$INSTDIR\system\G2a_NR_ScriptPatch_v${MOD_VERSION}.ico"
	!insertmacro GMF_Delete "$INSTDIR\system\G2a_NR_ScriptPatch_v${MOD_VERSION}.ini"
	!insertmacro GMF_Delete "$INSTDIR\system\G2a_NR_ScriptPatch_v${MOD_VERSION}.rtf"
	!insertmacro GMF_Delete "$INSTDIR\Data\ModVDF\g2a_nr_scriptpatch_v${MOD_VERSION}.mod"
	!insertmacro GMF_Delete "$INSTDIR\Data\ModVDF\g2a_nr_scriptpatch_v${MOD_VERSION}_autoscale.mod"
	!insertmacro GMF_Delete "$INSTDIR\Data\ModVDF\g2a_nr_scriptpatch_v${MOD_VERSION}_speech.mod"
	!insertmacro GMF_Delete "$INSTDIR\Data\ModVDF\g2a_nr_scriptpatch_v${MOD_VERSION}_wasteland.mod"
	!insertmacro GMF_Delete "$INSTDIR\Data\ModVDF\g2a_nr_scriptpatch_v${MOD_VERSION}_hotfix.mod"
	!insertmacro GMF_Delete "$INSTDIR\Changelog_G2a_NR_ScriptPatch_v${MOD_VERSION}.txt"
	!insertmacro GMF_Delete "$INSTDIR\Speech_Changelog.txt"
FunctionEnd
