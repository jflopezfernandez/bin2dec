
#include "bin2dec.h"


int main(int argc, char *argv[])
{
    if (argc == 1) {
		fprintf(stderr, "No input(s).\n");

		return EXIT_FAILURE;
	}

	while (*++argv) {
		mpz_t n;
		mpz_init_set_str(n, *argv, 2);
		gmp_printf("%Zd\n", n);
		mpz_clear(n);
	}

    return EXIT_SUCCESS;
}

