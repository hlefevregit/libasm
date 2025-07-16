#include <stdio.h>
#include <stdlib.h>
#include <string.h>

// Structure list
typedef struct s_list
{
    void *content;
    struct s_list *next;
} t_list;

// Prototype ASM
void ft_list_remove_if(t_list **begin_list, void *data_ref, int (*cmp)(void*, void*), void (*free_fn)(void*));

// Fonction de comparaison (strcmp wrapper)
int cmp_str(void *a, void *b)
{
    return strcmp((char *)a, (char *)b);
}

// Fonction pour free un noeud (pour les strings)
void free_content(void *data)
{
    free(data);
}

// Ajout en tête de liste
void ft_list_push_front(t_list **begin, void *data)
{
    t_list *new = malloc(sizeof(t_list));
    if (!new) return;
    new->content = data;
    new->next = *begin;
    *begin = new;
}

// Affichage de la liste
void print_list(t_list *lst)
{
    while (lst)
    {
        printf("[%s] -> ", (char *)lst->content);
        lst = lst->next;
    }
    printf("NULL\n");
}

// Libère toute la liste (utile si erreur)
void free_list(t_list *lst)
{
    t_list *tmp;
    while (lst)
    {
        tmp = lst->next;
        free(lst->content);
        free(lst);
        lst = tmp;
    }
}

int main(void)
{
    t_list *list = NULL;

    // Création de la liste : [apple] -> [banana] -> [apple] -> [cherry] -> [apple]
    ft_list_push_front(&list, strdup("apple"));
    ft_list_push_front(&list, strdup("cherry"));
    ft_list_push_front(&list, strdup("apple"));
    ft_list_push_front(&list, strdup("banana"));
    ft_list_push_front(&list, strdup("apple"));

    printf("Liste avant suppression :\n");
    print_list(list);

    // Appel de ta fonction ASM pour supprimer tous les "apple"
    ft_list_remove_if(&list, "apple", cmp_str, free_content);

    printf("\nListe après suppression de \"apple\" :\n");
    print_list(list);

    // Nettoyage mémoire
    free_list(list);
    return 0;
}
