#include <stdio.h>
#include <string.h>

// Déclaration
extern char *ft_strcpy(char *dest, const char *src);

int main() {
    char buffer[100];

    const char *src = "Coucou l'assembleur !";
    char *ret = ft_strcpy(buffer, src);

    printf("Résultat : \"%s\"\n", buffer);
    printf("Retour   : %p == %p ?\n", (void*)ret, (void*)buffer);

    return 0;
}
