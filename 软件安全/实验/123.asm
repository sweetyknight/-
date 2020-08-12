 .386
.model flat,stdcall

include msvcrt.inc
includelib msvcrt.lib
include user32.inc
includelib user32.lib
include kernel32.inc
includelib kernel32.lib

.data
s1 db 'this is a simple ',0
s2 db 'program you are annalyzing now!',0
s3 db "hello dou have get the right result?no! it't not over\n",0
s4 db "this is true end! but you should not relax yourself!!!Be careful ",0
s5 db "trap congratulation! now is the end\n",0
s6 db "their sum is %d\n",0
s7 db "can you have ",0
s8 db "the ability of ",0
s9 db "reverse analysis\n",0

.code
start:
	push ebp
	mov ebp,esp
	sub esp,0D8h
	push ebx
	push esi
	push edi
	lea edi,[ebp+0FFFFFF28h]
	mov ecx,36h
	mov eax,0CCCCCCCCh
	rep stos dword ptr es:[edi] 
	
	
	invoke crt_printf,offset s1
	invoke crt_printf,offset s2
	mov         dword ptr [ebp-8],39h
	mov         dword ptr [ebp-14h],3Ch
	mov         eax,dword ptr [ebp-8] 
	cmp         eax,dword ptr [ebp-14h] 
	jle r
	invoke crt_printf,offset s3
	jmp s
	r:
		mov        eax,dword ptr [ebp-14h]
		push        eax 
		mov        ecx,dword ptr [ebp-8]
		push        ecx 
		call compare
	add esp,8
	s:
		mov        dword ptr [ebp-14h],32h
		mov         eax,dword ptr [ebp-8]
		cmp         eax,dword ptr [ebp-14h]
		jle t
	mov        eax,dword ptr [ebp-14h]
	push        eax
	mov        ecx,dword ptr [ebp-8]
	push        ecx
	call compare
	add         esp,8
      t:
	invoke crt_printf,offset s4
	invoke crt_printf,offset s5
	xor         eax,eax
	pop         edi
	pop         esi 
	pop         ebx
	add         esp,0D8h
	pop         ebp
	ret
	
	compare:
	push        ebp
	mov        ebp,esp
	sub         esp,0CCh
	push        ebx
	push        esi
	push        edi
	lea          edi,[ebp+0FFFFFF34h]
	mov         ecx,33h
	mov         eax,0CCCCCCCCh
	rep stos      dword ptr es:[edi]
	mov         eax,dword ptr [ebp+8]
	cmp         eax,dword ptr [ebp+0Ch]
	jl u
	mov         eax,dword ptr [ebp+8]
	sub          eax,dword ptr [ebp+0Ch]
	mov         dword ptr [ebp-8],eax
	jmp v
	u:
	mov         eax,dword ptr [ebp+0Ch]
	sub          eax,dword ptr [ebp+8]
	mov         dword ptr [ebp-8],eax
	v:
	mov         esi,esp
	mov         eax,dword ptr [ebp-8]
	push         eax
	invoke crt_printf,offset s6,eax
	invoke crt_printf,offset s7
	invoke crt_printf,offset s8
	invoke crt_printf,offset s9
	mov         eax,dword ptr [ebp-8]
	pop         edi
	pop         esi
	pop         ebx
	add         esp,0CCh
	mov         esp,ebp
	pop         ebp
	ret

end start
