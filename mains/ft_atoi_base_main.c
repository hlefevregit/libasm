#include <stdio.h>
#include <stdlib.h>

int ft_atoi_base(const char *str, int base);

int main(void)
{
    const char *tests[] = {
        "42",
        "   -42",
        "+2A",
        "7fffffff",
        "abc",
        "deadbeef",
        "   +deadBEEF",
        "-101010",
        "ff",
        NULL
    };

    int bases[] = {10, 10, 16, 16, 16, 16, 16, 2, 16};

    for (int i = 0; tests[i] != NULL; i++)
    {
        int base = bases[i];
        int ref = (int)strtol(tests[i], NULL, base);
        int mine = ft_atoi_base(tests[i], base);

        printf("Input: \"%s\" (base %d)\n", tests[i], base);
        printf("strtol     → %d\n", ref);
        printf("ft_atoi_base → %d\n", mine);
        if (ref == mine)
            printf("✅ OK\n");
        else
            printf("❌ Mismatch\n");
        printf("--------\n");
    }

    return 0;
}
