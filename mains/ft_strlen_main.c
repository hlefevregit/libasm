#include <stdio.h>
#include <string.h>

extern size_t ft_strlen(const char *s);

int main(void)
{
    const char *test1 = "Hello, world!";
    const char *test2 = "";
    const char *test3 = "1234567890abcdefghijklmnopqrstuvwxyz";

    printf("Test 1 : \"%s\"\n", test1);
    printf("ft_strlen = %zu, strlen = %zu\n\n", ft_strlen(test1), strlen(test1));

    printf("Test 2 : \"%s\"\n", test2);
    printf("ft_strlen = %zu, strlen = %zu\n\n", ft_strlen(test2), strlen(test2));

    printf("Test 3 : \"%s\"\n", test3);
    printf("ft_strlen = %zu, strlen = %zu\n\n", ft_strlen(test3), strlen(test3));

    return 0;
}