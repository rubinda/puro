// MPI program, ki na clustru 9 racunalnikov igra ping
// pong s float stevilkami.
//
// Vozlisce 0 poslje vsem ostalim neke floate, ostali jih
// vrnejo in jih vozlisce 0 sesteje po modulu 360. Proces
// se ponavlja dokler ni vsota med 270,505 in 207,515. Takrat
// se izpise kolikokrat je stevilo bilo poslano v stdout
// in v datoteko RESULT.txt
//
//
// Uporabljen pri predmetu Postavitev in upravljanje 
// racunalniskih oblakov, MAG R-IT, FERI, 2018
//
// @author David Rubin
#include <mpi.h>
#include <stdio.h>
#include <stdlib.h>
#include <math.h>
#include <time.h>

int main(int argc, char** argv) {
	// Osnovno vozlisce
	const int root = 0;
	// Za generiranje random stevilk
	srand(time(NULL));
	MPI_Init(NULL, NULL);
	// Stevilo procesov
	int world_size;
	MPI_Comm_size(MPI_COMM_WORLD, &world_size);
	// Rank vozlisca (0 - stevilo_procesov)
	int world_rank;
	MPI_Comm_rank(MPI_COMM_WORLD, &world_rank);
	// Vsota stevil, ki se podajajo (po modulu 360)
	float sum = 0.f;
	// Stevilo podajanj (v enem ciklu se jih izvede World_size-1)
	int ping_count = 0;
	// Vrsta, ki jo posiljamo okoli
	float send_buf;

	// Delaj dokler ni vsota med podanima vrednostnima
	while (sum < 270.505 || sum > 270.515) {
		// Pridobi random float med 0 in 180
		if (world_rank == root) {
			send_buf = ((float)rand()/(float)(RAND_MAX) * 180);
		}
		// Poslji float na vsa ostala vozlisca (naredi root)
		// Sprejmi float iz vozlisca root (naredi rank > 0)
		MPI_Bcast(&send_buf, 1, MPI_FLOAT, root, MPI_COMM_WORLD);
		
		if (world_rank == root) {
			// Izvedlo se je world-size-1 ping pong
			ping_count += (world_size-1);
			float * recv_buf = malloc((world_size-1) * sizeof(float));
			// Sprejmi vse vrednosti od ostalih (root)
			MPI_Gather(&send_buf, 1, MPI_FLOAT,
						recv_buf, 1, MPI_FLOAT, 
						root, MPI_COMM_WORLD);
			// Sestej vrednosti v novo vsoto
			for (int i = 0; i < world_size-1; ++i) {
				sum += recv_buf[i];
				sum = fmod(sum, 360);
			}
			//printf("Trenutna vsota=%f\n", sum);
		} else {
			// Poslji vrednost prejeto v broadcast nazaj na root
			MPI_Gather(&send_buf, 1, MPI_FLOAT,
						NULL, 0, MPI_FLOAT,
						root, MPI_COMM_WORLD);
			// Na slave vozliscih tudi sestevaj (zaradi broadcast je tam *)
			// da lahko zaklucijo in se program ustavi
			for (int i = 0; i < world_size-1; ++i) {
				sum += send_buf;
				sum = fmod(sum, 360);
			}
		}
	}
	// Na vozliscu root se obvesti uporabnika o rezultatih
	if (world_rank == root) {
		FILE *fp;
		fp = fopen("RESULT.txt", "w");
		fprintf(fp, "%d\n", ping_count);
		fclose(fp);
		// Vsota je med postavljenima mejama, izpisi na stdout in v datoteko
		printf("Vseh podajanj je bilo %d\n", ping_count);
		printf("Na koncu je sum enaka %f\n", sum);
	}
	// Zakljuci program
	MPI_Finalize();
	return 0;
}
