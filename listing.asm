; ================================================================================
; superfluous_mov.Program.BugBugBug()
; 178 (0xB2) bytes
; 48 (0x30) instructions

00007F06A0BA07E0 55                   push    rbp
00007F06A0BA07E1 C5F877               vzeroupper
00007F06A0BA07E4 488BEC               mov     rbp,rsp

;             var P = Vector256.Create(100);
00007F06A0BA07E7 B864000000           mov     eax,64h
00007F06A0BA07EC C5F96EC0             vmovd   xmm0,eax
00007F06A0BA07F0 C4E27D58C0           vpbroadcastd ymm0,xmm0

;             var e1 = P.AsUInt64().GetElement(0);
00007F06A0BA07F5 C5FC28C8             vmovaps ymm1,ymm0
00007F06A0BA07F9 C4E1F97EC8           vmovq   rax,xmm1

;             var e0 = (uint) e1;
00007F06A0BA07FE 8BF8                 mov     edi,eax

;             e1 >>= 32;
00007F06A0BA0800 48C1E820             shr     rax,20h

;             var e3 = P.AsUInt64().GetElement(1);
00007F06A0BA0804 C5FC28C8             vmovaps ymm1,ymm0
00007F06A0BA0808 C4E3F916CE01         vpextrq rsi,xmm1,1

;             var e2 = (uint) e3;
00007F06A0BA080E 8BD6                 mov     edx,esi

;             e3 >>= 32;
00007F06A0BA0810 48C1EE20             shr     rsi,20h

;             var tmp = ExtractVector128(P, 1);
00007F06A0BA0814 C4E37D39C001         vextracti128 xmm0,ymm0,1

;             var e5 = tmp.AsUInt64().GetElement(0);
00007F06A0BA081A C4E1F97EC1           vmovq   rcx,xmm0

;             var e4 = (uint) e5;
00007F06A0BA081F 448BC1               mov     r8d,ecx

;             e5 >>= 32;
00007F06A0BA0822 48C1E920             shr     rcx,20h

;             var e7 = tmp.AsUInt64().GetElement(1);
00007F06A0BA0826 C4C3F916C101         vpextrq r9,xmm0,1

;             var e6 = (uint) e7;
00007F06A0BA082C 458BD1               mov     r10d,r9d

;             e7 >>= 32;
00007F06A0BA082F 49C1E920             shr     r9,20h

;             var p0 = ParallelBitDeposit((uint) e0, 0x0707070707070707);
00007F06A0BA0833 8BFF                 mov     edi,edi
00007F06A0BA0835 49BB0707070707070707 mov     r11,707070707070707h
00007F06A0BA083F C4C2C3F5FB           pdep    rdi,rdi,r11

;             var p1 = ParallelBitDeposit((uint) e1, 0x0707070707070707);
00007F06A0BA0844 8BC0                 mov     eax,eax
00007F06A0BA0846 C4C2FBF5C3           pdep    rax,rax,r11

;             var p2 = ParallelBitDeposit((uint) e2, 0x0707070707070707);
00007F06A0BA084B 8BD2                 mov     edx,edx
00007F06A0BA084D C4C2EBF5D3           pdep    rdx,rdx,r11

;             var p3 = ParallelBitDeposit((uint) e3, 0x0707070707070707);
00007F06A0BA0852 8BF6                 mov     esi,esi
00007F06A0BA0854 C4C2CBF5F3           pdep    rsi,rsi,r11

;             var p4 = ParallelBitDeposit((uint) e4, 0x0707070707070707);
00007F06A0BA0859 458BC0               mov     r8d,r8d
00007F06A0BA085C C442BBF5C3           pdep    r8,r8,r11

;             var p5 = ParallelBitDeposit((uint) e5, 0x0707070707070707);
00007F06A0BA0861 8BC9                 mov     ecx,ecx
00007F06A0BA0863 C4C2F3F5CB           pdep    rcx,rcx,r11

;             var p6 = ParallelBitDeposit((uint) e6, 0x0707070707070707);
00007F06A0BA0868 458BD2               mov     r10d,r10d
00007F06A0BA086B C442ABF5D3           pdep    r10,r10,r11

;             var p7 = ParallelBitDeposit((uint) e7, 0x0707070707070707);
00007F06A0BA0870 458BC9               mov     r9d,r9d
00007F06A0BA0873 C442B3F5CB           pdep    r9,r9,r11

;       return p0+p1+p2+p3+p4+p5+p6+p7;
00007F06A0BA0878 4803C7               add     rax,rdi
00007F06A0BA087B 4803C2               add     rax,rdx
00007F06A0BA087E 4803C6               add     rax,rsi
00007F06A0BA0881 4903C0               add     rax,r8
00007F06A0BA0884 4803C1               add     rax,rcx
00007F06A0BA0887 4903C2               add     rax,r10
00007F06A0BA088A 4903C1               add     rax,r9

00007F06A0BA088D C5F877               vzeroupper
00007F06A0BA0890 5D                   pop     rbp
00007F06A0BA0891 C3                   ret

; ================================================================================
; superfluous_mov.Program.Main(System.String[])
; 39 (0x27) bytes
; 12 (0xC) instructions

00007F06A0BA0390 55                   push    rbp
00007F06A0BA0391 4883EC10             sub     rsp,10h
00007F06A0BA0395 488D6C2410           lea     rbp,[rsp+10h]
00007F06A0BA039A 48897DF8             mov     [rbp-8],rdi

;             Console.WriteLine(BugBugBug());
00007F06A0BA039E E8F5BAFFFF           call    superfluous_mov.Program.BugBugBug()
00007F06A0BA03A3 488BF8               mov     rdi,rax
00007F06A0BA03A6 E82DFFFFFF           call    System.Console.WriteLine(UInt64)

;       Console.ReadLine();
00007F06A0BA03AB E8C8FEFFFF           call    System.Console.ReadLine()

;         }
00007F06A0BA03B0 90                   nop
00007F06A0BA03B1 488D6500             lea     rsp,[rbp]
00007F06A0BA03B5 5D                   pop     rbp
00007F06A0BA03B6 C3                   ret
