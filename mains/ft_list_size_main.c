#include <stdio.h>
#include <stdlib.h>

// Structure de liste conforme à ton projet
typedef struct s_list {
    void *content;
    struct s_list *next;
} t_list;

// Prototype de ta fonction en ASM
extern int ft_list_size(t_list *lst);

// Fonction utilitaire pour créer un nouvel élément
t_list *new_node(char *content) {
    t_list *node = malloc(sizeof(t_list));
    if (!node) return NULL;
    node->content = content;
    node->next = NULL;
    return node;
}

int main(void) {
    t_list *list = NULL;

    // Test avec liste vide
    printf("Liste vide → taille = %d\n", ft_list_size(list));

    // Test avec 1 élément
    list = new_node("one");
    printf("1 élément → taille = %d\n", ft_list_size(list));

    // Test avec plusieurs éléments
    list->next = new_node("two");
    list->next->next = new_node("three");
    printf("3 éléments → taille = %d\n", ft_list_size(list));

    // Libération mémoire (optionnel pour ce test simple)
    free(list->next->next);
    free(list->next);
    free(list);

    return 0;
}
