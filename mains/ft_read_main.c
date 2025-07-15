#include <stdio.h>
#include <unistd.h>
#include <errno.h>
#include <string.h>

// Déclaration de ta fonction ft_read
extern ssize_t ft_read(int fd, void *buf, size_t count);

int main(void)
{
    char buffer[128];
    ssize_t bytes_read;

    printf("Tapez quelque chose : ");
    fflush(stdout); // force l'affichage avant lecture

    // Lire depuis stdin (fd = 0)
    bytes_read = ft_read(0, buffer, sizeof(buffer) - 1);

    if (bytes_read < 0)
    {
        perror("ft_read");
        return 1;
    }

    // Terminer proprement la chaîne
    buffer[bytes_read] = '\0';

    printf("ft_read a lu %zd octets : \"%s\"\n", bytes_read, buffer);

    return 0;
}

