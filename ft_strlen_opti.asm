section .text
global ft_strlen

ft_strlen:
    ; Entrée : RDI = pointeur vers la chaîne
    ; Sortie : RAX = longueur

    mov     rsi, rdi        ; RSI = ptr de départ
.loop:
    mov     rax, [rsi]      ; lit 8 octets de la chaîne
    ; Chercher un \0 dans RAX
    mov     rcx, 0x7efefefefefefeff
    add     rcx, rax
    xor     rax, -1
    xor     rax, rcx
    and     rax, 0x8080808080808080
    jnz     .found_null     ; si 1 bit = 1, alors un '\0' est dans ces 8 octets
    add     rsi, 8
    jmp     .loop

.found_null:
    ; Recherche fine caractère par caractère
    mov     rcx, 0
.check:
    mov     al, [rsi + rcx]
    test    al, al
    je      .done
    inc     rcx
    jmp     .check

.done:
    ; RSI = pointeur initial + (blocs * 8)
    ; RCX = position du '\0' dans le bloc
    sub     rsi, rdi        ; distance parcourue par blocs
    add     rax, rcx        ; longueur totale = blocs + position
    mov     rax, rsi
    add     rax, rcx
    ret