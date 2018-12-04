		include	"Version.h"

KL_FIND_COMMAND	equ	$BCD4
TXT_OUTPUT	equ	$BB5A

		org	$C000

rom_type	defb	1

rom_version	defb	0,1,2

rsx_names	defw	rsx_name_table

		jp	init_rom

extra_rsxs	jp 	M4_CMD_SOCKET
		jp	M4_CMD_CONNECT
		jp	M4_GET_SOCKET_STATE
		jp	M4_CMD_NET_RECEIVE_DATA
		jp	M4_CMD_NET_LOOKUP_IP
		jp	M4_CMD_NET_SEND_CUSTOM_DATA
		jp	M4_CMD_CLOSE_CONNECTION

rsx_name_table	defb	'NET RSX',' '+$80
		defb	$91
		defb	$92
		defb	$93
		defb	$94
		defb	$95
		defb	$96
		defb	$97
		defb	0

init_rom	push	af
		push	hl

		ld	hl,versionstring
_print_loop	ld	a,(hl)
		or	a
		jr	z,_exit

		call	TXT_OUTPUT

		inc	hl
		jr	_print_loop

_exit		pop	hl
		pop	af

		scf

		ret

		include	"M4Driver.asm"

versionstring	defm	" Net RSX "
		Version

		defb	"b",$0d,$0a,$0a,0

		defs	$ffff-$,0
