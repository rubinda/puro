# N03-MPI-PingPong
V virtualna okolja iz N02 namestite OpenMPI.

Nato napišite program PingPong, ki v OpenMPI iz glavnega vozlišča (rank 0) pošlje eno število s plavajočo vejico (naključno število med 0,00 do 180,00) na vsakega odjemalca (rank 1 ... rank 8). Nato vsak odjelamec število pošlje nazaj glavnemu vozlišču (rank 0), ki to prejeto število prišteje vsoti po modulu s 360. Pošiljanje ping-pong ponovite tako dolgo, da je vsota prejetih števil na krožnici na intervalu med 270,505 in 270,515 (vsota ostankov pri deljenju po modulu s 360).

Na koncu glavno vozlišče izpiše število podaj parov sporočil ping-pong na terminal in v datoteko RESULT.TXT.

