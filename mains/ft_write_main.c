#include <unistd.h>
#include <errno.h>
#include <stdio.h>
#include <string.h>

extern ssize_t ft_write(int fd, const void *buf, size_t count);

int main(void) {
    ssize_t r = ft_write(1, "Hello from ft_write\n", 21);
    if (r < 0)
        perror("ft_write");
    else
        printf("ft_write wrote %zd bytes\n", r);

    // test erreur
    r = ft_write(1, NULL, 5);
    if (r < 0)
        perror("ft_write with NULL");

    return 0;
}
