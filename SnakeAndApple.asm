[org 0x0100]
jmp start
    str1: db 'Project : Snake and Apple (-Sheraz-BDS_3B1)'
    str1Len: dw 50
    End: db 'Game  End!'
    EndLength: dw 10
    GameName:db 'SNAKE'   
    GameLength_: dw   5
    ScoreName: db   'YOUR SCORE = '
    ScoreLen:dw   13
    scorenum:      dw   0
    LivesName: db   'LIVES = 1 '
    Liveslen:dw   10
    Live:      dw   1
    Line:        db   '='
    Line1:       db   ':'
    apple:dw 2000
    myLoc:dw 3000
    count: dw 0
    temp: dw 0
    snake: db ':','o','o','o','o'
    snakelen: dw 5   
clearscreen:     
    push es
    push ax
    push di

    mov  ax, 0xb800
    mov  es, ax
    mov  di, 0

    next_location3:
        mov  word [es:di], 0x2020
        add  di, 2
        cmp  di, 4000
        jne  next_location3

    pop  di 
    pop  ax
    pop  es
    ret
clearscreen3:     
    push es
    push ax
    push di

    mov  ax, 0xb800
    mov  es, ax
    mov  di, 0

    next_location1:
        mov  word [es:di], 0x0720
        add  di, 2
        cmp  di, 4000
        jne  next_location1

    pop  di 
    pop  ax
    pop  es
    ret
clearscreen4:     
    push es
    push ax
    push di

    mov  ax, 0xb800
    mov  es, ax
    mov  di, 0

    nextlocation:
        mov  word [es:di], 0x4020
        add  di, 2
        cmp  di, 4000
        jne  nextlocation

    pop  di 
    pop  ax
    pop  es
    ret


movupdirec:
    push bp
    mov bp, sp
    push ax
    push bx
    push cx
    push dx
    push es
    push di
    push si
    mov bx, [bp+4]            
    mov dx, [bx]
    mov cx, [bp+8]
    sub dx, 160
    check_next:
        cmp dx, [bx]
        je no_movee
        add bx, 2
        loop check_next
    updirec_mov:
    mov si, [bp+6]            
    ;snake location 
    mov bx, [bp+4]            
    mov dx, [bx]
    sub dx, 160
    mov di, dx
    mov ax, 0xb800
    mov es, ax
    mov ah, 0x09
    mov al, [si]
;head
    mov [es:di],ax             
    mov cx, [bp+8]
    mov di, [bx]
    inc si
    mov ah, 0x09
    mov al, [si]
    mov [es:di],ax
    loc_sort:
        mov ax, [bx]
        mov [bx], dx
        mov dx, ax
        add bx, 2        
        loop loc_sort
    mov di, dx
    mov ax, 0x0720
    mov [es:di], ax
    no_movee:
    pop si
    pop di
    pop es
    pop dx
    pop cx
    pop bx
    pop ax
    pop bp
    ret 6

movleftdirec:
    push bp
    mov bp, sp
    push ax
    push bx
    push cx
    push dx
    push es
    push di
    push si
    mov bx, [bp + 4]            
    mov dx, [bx]
    mov cx, [bp + 8]
    sub dx, 2
    check_acci:
        cmp dx, [bx]
        je no_move
        add bx, 2
        loop check_acci
    leftdirec_move:
    mov si, [bp + 6]            
    mov bx, [bp + 4]            
    mov dx, [bx]
    sub dx, 2
    mov di, dx
    mov ax, 0xb800
    mov es, ax
    mov ah, 0x09
    mov al, [si]
    mov [es:di],ax            
     mov ah, 0x09
    mov cx, [bp + 8]
    mov di, [bx]
    inc si
    mov al, [si]
    mov [es:di],ax
    location_sort:
        mov ax, [bx]
        mov [bx], dx
        mov dx, ax
        add bx, 2   
        loop location_sort
    mov di, dx
    mov ax, 0x0720
    mov [es:di], ax
    no_move:
    pop si
    pop di
    pop es
    pop dx
    pop cx
    pop bx
    pop ax
    pop bp
    ret 6
movdowndirec:
    push bp
    mov bp, sp
    push ax
    push bx
    push cx
    push dx
    push es
    push di
    push si    
    mov bx, [bp+4]         
    mov dx, [bx]
    mov cx, [bp+8]
    add dx, 160
    check_accid:
        cmp dx, [bx]
        je no_moveee
        add bx, 2
        loop check_accid
    mov_downdirec:
    mov si, [bp+6]            
    mov bx, [bp+4]            
    mov dx, [bx]
    add dx, 160
    mov di, dx
    mov ax, 0xb800
    mov es, ax
    mov ah, 0x09
    mov al, [si]
    mov [es:di], ax          
    mov cx, [bp+8]            
    mov di, [bx]
    inc si
    mov ah, 0x09
    mov al, [si]
    mov [es:di],ax
    Sort_Loc:
        mov ax, [bx]
        mov [bx], dx
        mov dx, ax
        add bx, 2
        loop Sort_Loc
    mov di, dx
    mov ax, 0x0720
    mov [es:di], ax
    no_moveee:
    pop si
    pop di
    pop es
    pop dx
    pop cx
    pop bx
    pop ax
    pop bp
    ret 6
moverightdirec:
    push bp
    mov bp, sp
    push ax
    push bx
    push cx
    push dx
    push es
    push di
    push si
    mov bx, [bp + 4]           
    mov dx, [bx]

    mov cx, [bp + 8]
    add dx, 2
    check_aacci:
        cmp dx, [bx]
        je noo_mov
        add bx, 2
        loop check_aacci
    mov_rightdirec:
    mov si, [bp + 6]           
    mov bx, [bp + 4]            
    mov dx, [bx]
    add dx, 2
    mov di, dx
    mov ax, 0xb800
    mov es, ax
    mov ah, 0x09
    mov al, [si]
    mov [es:di], ax             
    mov cx, [bp + 8]            
    mov di, [bx]
    inc si
    mov ah, 0x09
    mov al, [si]
    mov [es:di],ax
    Location_Soort:
        mov ax, [bx]
        mov [bx], dx
        mov dx, ax
        add bx, 2 
        loop Location_Soort
    mov di, dx
    mov ax, 0x0720
    mov [es:di], ax
    noo_mov:
    pop si
    pop di
    pop es
    pop dx
    pop cx
    pop bx
    pop ax
    pop bp
    ret 6
snake_movement:
    push ax
    push bx
    recurse:
    mov ah,0
    int 0x16
    cmp ah,0x48
    je updirec
    cmp ah,0x4B
    je leftdirec
    cmp ah,0x4D
    je rightdirec
    cmp ah,0x50
    je downdirec
    cmp ah,1
    jne recurse      
    ;Escape check
    mov ah,0x4c
    je exit
    ;UpWard Movement
    updirec:
        push word [snakelen]
        mov bx, snake
        push bx
        mov bx, snakeLOC
        push bx
        call movupdirec   
        jmp appletouch
    downdirec:
        push word [snakelen]
        mov bx, snake
        push bx
        mov bx, snakeLOC
        push bx
        call movdowndirec
        jmp appletouch
    leftdirec:
        push word [snakelen]
        mov bx, snake
        push bx
        mov bx, snakeLOC
        push bx
        call movleftdirec
        jmp appletouch
    rightdirec:
        push word [snakelen]
        mov bx, snake
        push bx
        mov bx, snakeLOC
        push bx
        call moverightdirec
        jmp appletouch
    appletouch:
        call check_out   
        push word [apple]
        push word [snakelen]
        mov bx, snake          
        push bx
        mov bx, snakeLOC
        push bx
        call increase_snake_size
        jmp recurse
    exit:
        pop bx
        pop ax
        ret
buildsnake:
    push bp
    mov bp, sp
    push ax
    push bx
    push si
    push cx
    push dx
    mov si, [bp+6]        ;snake
    mov cx, [bp+8]        ;length of snake
    mov di, 2000
    mov ax, 0xb800
    mov es, ax
    mov ah, 0x09
    mov bx, [bp+4]
    next_char:
        mov al, [si]
        mov [es:di], ax
        mov [bx], di
        inc si
        add bx, 2
        add di, 2
        loop next_char
    pop dx
    pop cx
    pop si
    pop bx
    pop ax
    pop bp
    ret 6

boundarry:
    push bp
    mov  bp, sp
    push es
    push ax
    push cx 
    push si 
    push di 

    mov ax, 0xb800 
    mov es, ax 
    mov ah,10
    mov di, 2              
    mov si, [bp + 6]
    mov cx, 80
Print: 
        mov al, [si]
        mov [es:di], ax 
        mov ah,10
        add di, 2
         loop Print

    pop di 
    pop si 
    pop cx 
    pop ax 
    pop es 
    pop bp 
    ret 2

lowBoundary:
    push bp
    mov  bp, sp
    push es
    push ax
    push cx 
    push si 
    push di 

    mov ax, 0xb800 
    mov es, ax
    mov ah,10 
    mov di, 3682              


    mov si, [bp + 6]
    mov cx, 78
   mov ah,10


    pri3: 
        mov al, [si]
        mov [es:di], ax 
       mov ah,10
        add di, 2
        loop pri3

    mov dx, 3842
    push dx
    mov dx, ScoreName 
    push dx 
    push word [ScoreLen]
    call PrintName

    mov dx, 3868
    push dx
    mov dx, [scorenum]
    push dx 
    call disNUM


    mov dx, 3970
    push dx
    mov dx, LivesName 
    push dx 
    push word [Liveslen]
    call PrintName

    mov dx, 3986
    push dx
    mov dx, [Live]
    push dx 
    call disNUM



    pop di 
    pop si 
    pop cx 
    pop ax 
    pop es 
    pop bp 
    ret 2


Hboundarry:
    push bp
    mov  bp, sp
    push es
    push ax
    push cx 
    push si 
    push di 

    mov ax, 0xb800 
    mov es, ax
    mov ah,10 
    mov di, 160              
    mov si, [bp + 4]
    mov cx, 22
    pri2: 
        mov al, [si]
        mov [es:di], ax
mov ah,10 
        add di, 158
        mov [es:di], ax 
mov ah,10
        add di, 2
        loop pri2 
    pop di 
    pop si 
    pop cx 
    pop ax 
    pop es 
    pop bp 
    ret 2
PrintName:
    push bp
    mov  bp, sp
    push es
    push ax
    push cx 
    push si 
    push di 
    mov ax, 0xb800 
    mov es, ax 
mov ah,10
  
    ; mov di, 3842             
    mov di, [bp+8]
    mov si, [bp+6]
    mov cx, [bp+4]

    next_cchar: 
        mov al, [si]
        mov [es:di], ax 
mov ah,10
        add di, 2 
        add si, 1 
       loop next_cchar
    pop di 
    pop si 
    pop cx 
    pop ax 
    pop es 
    pop bp 
    ret 6 
;display food
print_apple:
    push bp
    mov bp, sp
    push ax
    push di
    push es

    mov ax, 0xb800
    mov es, ax
mov ah,20
    mov di, [bp+4]        
    mov ax, 0x4001
    mov [es:di], ax

    pop es
    pop di
    pop ax
    pop bp
    ret 2

disNUM: 
    push bp 
    mov  bp, sp
    push es 
    push ax 
    push bx 
    push cx 
    push dx 
    push di 
    mov ax, [bp+4]   
    mov bx, 10       
    mov cx, 0        
    nextnnum: 
        mov dx, 0    
        div bx       
        add dl, 0x30 
        push dx      
        inc cx       
        cmp ax, 0    
        jnz nextnnum 
    mov ax, 0xb800 
    mov es, ax 
mov ah,10
    mov di, [bp + 6]
    nextposition: 
        pop dx          
        mov dh, 0x03    
        mov [es:di], dx 
mov ah,10
        add di, 2 
        loop nextposition    

    pop di 
    pop dx 
    pop cx 
    pop bx 
    pop ax 
    pop es
    pop bp 
    ret 4 
check_out:
push ax
push di
push cx


    mov ax, [snakeLOC]
    cmp ax, 160
    jb END
    mov di, 160              
    mov cx, 22


    check1: 
        cmp ax, di
        je END
        add di, 158
        cmp ax, di
        je END
        add di, 2

        loop check1 
    
    mov di, 3680
    cmp ax, di
    ja END
    jmp else

    END:
    call GameEnd
else:
pop cx
pop di
pop ax
ret

increase_snake_size:
    push bp
    mov bp, sp
    push ax
    push bx
    push cx
    push dx
    push es
    push di
    push si
    mov bx, [bp+4]
    mov dx, [bp+10]
    cmp [bx], dx
    jne noo_inc
    ;else
    mov cx, [bp+8]        
    shl cx, 1
    sub cx, 2
    add bx, cx      
    mov dx, [bx]
    sub dx, [bx-2]       
     mov ax, [bx]
    add ax, dx          
    mov dx, ax
    add cx, 2
    shr cx,1
    inc cx
    mov [snakelen], cx
    add bx, 2
    mov [bx], dx
    mov si, [bp + 6]
    inc si
    mov ax, 0xb800
    mov es, ax
    mov di, dx
    mov al, [si]
    mov [es:di], ax
    add word [scorenum], 5
    mov ax, 0xb800 
    mov es, ax 
    mov di, [myLoc]             
    mov ax, 0x0720 
    mov [es:di], ax
    push 3868
    push word [scorenum]
    call disNUM
   push 3986
    push word [Live]
    call disNUM   
    call genran   
    push word [apple]
    call print_apple
    noo_inc:
    pop si
    pop di
    pop es
    pop dx
    pop cx
    pop bx
    pop ax
    pop bp
    ret 8
genran:        
push cx
push dx
push ax
push bx
push si
push di
mov word [temp], 0
randomstart:
   push cx
   mov ah, 00h  
   int 1ah                          
   pop cx
   mov [temp], dh
   xor dh, dh
   push dx
   xor dx, dx
   mov dl, [temp]
   pop si 
   add dx, si
   mov bx, 11111   ; set limit to 11111
   mov ax, dx
   cmp ax, bx       
   ja randomstart 
   mov bx, 0   ; set limit to 0
   mov ax, dx   
   cmp ax, bx
   jb randomstart 
   mov cx, [count]
   add dx, cx
   add cx, 1000
   add word [count], 1000
   cmp word [count], 4000
   jne L11
        mov word [count], 0
        xor cx,cx

   L11:
   cmp dx, 162
   jb randomstart
   cmp dx, 3680
   ja randomstart
   mov [temp], cx
   mov cx, dx
   shr cx, 1
   jnc move
      add dx, 1
    move:
    mov di, 160              
    mov cx, 25
    check: 
        cmp di, dx
        je randomstart
        add di, 158
        cmp di, dx
        je randomstart

        add di, 2
        cmp di, dx
        je randomstart
        loop check 
   mov cx, [temp]
;    mov word [apple], 0
   mov word [apple ], dx
;    add bp, 2
;    dec di
;    cmp di, 0
;    jne genran
    pop di
    pop si
    pop bx
    pop ax
    pop dx
    pop cx
    ret 
GameEnd:
push cx
push dx
push ax
push bx
push si
push di
    call clearscreen4
    mov dx, 2000
    push dx
    mov dx, End 
    push dx 
    push word [EndLength]
    call PrintName
pop di
pop si
pop bx
pop ax
pop dx
pop cx
mov ax, 0x4c00
int 0x21
ret 


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;Start;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

start:
    call clearscreen

    mov dx, 1950
    push dx
    mov dx, str1 
    push dx 
    push word [str1Len]
    call PrintName
    mov ah, 01
    int 0x21
    call clearscreen3
    mov ax, Line
    push ax
    call boundarry
    mov ax, Line1
    push ax
    call Hboundarry
    mov ax, Line
    push ax
    call lowBoundary
    push word [snakelen]
    mov bx, snake
    push bx
    mov bx, snakeLOC
    push bx
    call buildsnake
    call genran  
    push word [apple]
    call print_apple
    push word [myLoc]
    call snake_movement
    mov ax, 0x4c00
    int 0x21    
    snakeLOC: dw 0
