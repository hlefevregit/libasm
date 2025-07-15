#include <stdio.h>
#include <stdlib.h>
#include <string.h>

typedef struct s_list {
    void *content;
    struct s_list *next;
} t_list;

extern void ft_list_sort(t_list **begin_list, int (*cmp)(void *, void *));

int cmp_str(void *a, void *b) {
    return strcmp((char *)a, (char *)b);
}

t_list *new_node(char *s) {
    t_list *node = malloc(sizeof(t_list));
    node->content = s;
    node->next = NULL;
    return node;
}

void print_list(t_list *lst) {
    while (lst) {
        printf("[%s] -> ", (char *)lst->content);
        lst = lst->next;
    }
    printf("NULL\n");
}

int main(void) {
    t_list *lst = new_node("grape");
    lst->next = new_node("orange");
    lst->next->next = new_node("pear");
    lst->next->next->next = new_node("apple");
    lst->next->next->next->next = new_node("banana");

    printf("Liste avant tri :\n");
    print_list(lst);

    ft_list_sort(&lst, cmp_str);

    printf("Liste après tri :\n");
    print_list(lst);
}
