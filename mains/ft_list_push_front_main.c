#include <stdio.h>
#include <stdlib.h>
#include <string.h>

// Définition de la structure t_list (doit être identique à celle utilisée en assembleur)
typedef struct s_list {
	void *content;
	struct s_list *next;
} t_list;

// Prototype de ta fonction en assembleur
void ft_list_push_front(t_list **lst, t_list *new);

// Helper pour créer un nouvel élément de liste
t_list *create_node(char *str)
{
	t_list *node = malloc(sizeof(t_list));
	if (!node)
		return NULL;
	node->content = strdup(str); // Copie la chaîne
	node->next = NULL;
	return node;
}

// Helper pour afficher la liste
void print_list(t_list *lst)
{
	while (lst)
	{
		printf("[%s] -> ", (char *)lst->content);
		lst = lst->next;
	}
	printf("NULL\n");
}

int main(void)
{
	t_list *head = NULL;

	t_list *node1 = create_node("world");
	t_list *node2 = create_node("hello");

	// Pousser dans la liste
	ft_list_push_front(&head, node1);
	ft_list_push_front(&head, node2);

	// Affichage attendu : [hello] -> [world] -> NULL
	printf("Liste après push_front :\n");
	print_list(head);

	// Libération
	free(node1->content);
	free(node1);
	free(node2->content);
	free(node2);

	return 0;
}
