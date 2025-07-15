#include <stdio.h>
#include <stdlib.h>
#include <string.h>

// Déclaration de ta fonction
extern char *ft_strdup(const char *s);

int main(void)
{
    const char *original = "Bonjour l'assembleur !";
    char *dup = ft_strdup(original);

    if (!dup)
    {
        perror("ft_strdup");
        return 1;
    }

    printf("Original : \"%s\"\n", original);
    printf("Dup      : \"%s\"\n", dup);

    // Comparaison de contenu et d'adresse
    if (strcmp(original, dup) == 0 && original != dup)
        printf("✅ ft_strdup a bien dupliqué la chaîne\n");
    else
        printf("❌ Problème avec la duplication\n");

    free(dup); // Important : libérer la mémoire allouée
    return 0;
}
