
	SUBROUTINE ROOMS(SIZE1, SIZE2, DEST1, DEST2)
		INTEGER SIZE1, SIZE2, DEST1, DEST2
		INTEGER ROOM(SIZE1, SIZE2), COORD(2)
		INTEGER CHRSTA(7), NMYSTA(7)
		REAL R, P
		INTEGER RAND, PAND
		CHARACTER(1) CHOICE
		CHARACTER(4) WRDROM(SIZE1, SIZE2)
		LOGICAL ALIVE, SHOPPE	
	
		COMMON /LIFE/ ALIVE
		COMMON /SHOPP/ SHOPPE
		COMMON /BATTLE/ CHRSTA, NMYSTA

		COORD(1) = 1
		COORD(2) = 1	

		DO I=1, SIZE1
			DO J=1, SIZE2
				ROOM(I, J) = 0
			END DO
		END DO

		IF (SHOPPE) THEN
                        CALL RANCOR(SIZE1, SIZE2, R, P)

                        RAND = R
                        PAND = P

                        DO WHILE(RAND .EQ. DEST1 .AND. PAND .EQ. DEST2)

                                R = REAL(R)
                                P = REAL(P)

                                CALL RANCOR(SIZE1, SIZE2, R, P)

                                RAND = R
                                PAND = P

                        END DO

                        ROOM(RAND, PAND) = 4
                END IF


		ROOM(COORD(1), COORD(2)) = 1
		ROOM(DEST1, DEST2) = 2

		DO WHILE (ROOM(COORD(1), COORD(2)) .NE. 3)

			IF (.NOT. ALIVE) THEN
				RETURN
			END IF

			CALL PRTROM(SIZE1, SIZE2, ROOM)
			CALL WORDS(SIZE1, SIZE2, ROOM, WRDROM)


			PRINT *, '----------------'
			PRINT *, 'WHERE DO YOU GO?'
			PRINT *, '----------------'
			PRINT *, '------------'
			PRINT *, '|    ', 'U', '    |'
			PRINT *, '| L', '     ', 'R |'
			PRINT *, '|    ', 'D', '    |'
			PRINT *, '------------' 
			READ *, CHOICE
			PRINT *, ''

			CALL WALK(SIZE1, SIZE2, ROOM, COORD, CHOICE)
	
		END DO
	END SUBROUTINE ROOMS

	
	SUBROUTINE WALK(SIZE1, SIZE2, ROOM, COORD, CHOICE)
		INTEGER SIZE1, SIZE2, ENCNUM, ENCRAT, NUM 
		INTEGER ROOM(SIZE1, SIZE2), COORD(2)
		CHARACTER(1) CHOICE
		CHARACTER(10) NMY
		REAL R, P
		LOGICAL ALIVE

		COMMON /LIFE/ ALIVE

		CALL STEP(SIZE1, SIZE2, ROOM, COORD, CHOICE)
			
                CALL RANDOM_SEED()
                CALL RANDOM_NUMBER(R)

                ENCNUM = INT(101*R)

                ENCRAT = 20


		CALL RANDOM_SEED()
		CALL RANDOM_NUMBER(P)
		
		NUM = INT(101*P)
		
		IF (NUM .GE. 50) THEN
			NMY = 'skeleton'
		ELSE
			NMY = 'goblin'
		END IF
		

                IF (ENCNUM .LT. ENCRAT) THEN
			PRINT *, 'YOU HAVE STUMBLED UPON A ', NMY, '!'
                	CALL STRID(NMY)
			IF (.NOT. ALIVE) THEN
				RETURN
			END IF
                END IF

                IF (ROOM(COORD(1), COORD(2)) .EQ. 3) THEN

                	PRINT *, 'YOU GOT OUT!'

		ELSE IF (ROOM(COORD(1), COORD(2)) .EQ. 5) THEN
			CALL SHOP()

                END IF
	END SUBROUTINE WALK

	SUBROUTINE STEP(SIZE1, SIZE2, ROOM, COORD, CHOICE)
		INTEGER SIZE1, SIZE2
		INTEGER ROOM(SIZE1, SIZE2), COORD(2)
		CHARACTER(1) CHOICE

		ROOM(COORD(1), COORD(2)) = 0
		IF (CHOICE .EQ. 'C') THEN
			PRINT *, COORD
		ELSE IF (CHOICE .EQ. 'D' .AND. COORD(1) + 1 .LE. SIZE1) THEN
			COORD(1) = COORD(1) + 1
		ELSE IF (CHOICE .EQ. 'U' .AND. COORD(1) - 1 .GE. 1) THEN
			COORD(1) = COORD(1) - 1
		ELSE IF (CHOICE .EQ. 'R' .AND. COORD(2) + 1 .LE. SIZE2) THEN
			COORD(2) = COORD(2) + 1
		ELSE IF (CHOICE .EQ. 'L' .AND. COORD(2) - 1 .GE. 1) THEN
			COORD(2) = COORD(2) - 1
		ELSE
			PRINT *, 'YOU HIT A WALL'
		END IF

		ROOM(COORD(1), COORD(2)) = ROOM(COORD(1), COORD(2)) + 1

	END SUBROUTINE STEP
	

	SUBROUTINE PRTROM(SIZE1, SIZE2, ROOM)
		INTEGER SIZE1, SIZE2, ROOM(SIZE1,SIZE2)

		DO I=1, SIZE1
			WRITE(*, '(100I3)') (ROOM(I, J), J=1, SIZE2)
		END DO

	END SUBROUTINE PRTROM
	

	SUBROUTINE HALA(ITER, SIZE1, SIZE2)
                INTEGER ITER, SIZE1, SIZE2, RAND, PAND
                REAL R, P
		LOGICAL SHOPPE, ALIVE
		CHARACTER(10) BOSS

		COMMON /SHOPP/ SHOPPE
		COMMON /LIFE/ ALIVE

                DO I=1, ITER
                        CALL RANCOR(SIZE1, SIZE2, R, P)
			
			IF (MOD(I, 2) .EQ. 0) THEN
				SHOPPE = .TRUE.
			END IF
				
			RAND = R
			PAND = P

			IF (RAND .EQ. 1 .AND. PAND .EQ. 1) THEN 
				RAND = RAND + 1
			END IF
			
                        CALL ROOMS(SIZE1, SIZE2, RAND, PAND)

			SHOPPE = .FALSE.
                END DO

		BOSS = 'boss'

		IF (.NOT. ALIVE) THEN
			RETURN
		END IF

		CALL STRID(BOSS)

        END SUBROUTINE HALA


	
	SUBROUTINE RANCOR(SIZE1, SIZE2, NMR1, NMR2)
		INTEGER SIZE1, SIZE2
		INTEGER RAND, PAND
		REAL NMR1, NMR2
		
		CALL RANDOM_SEED()
		CALL RANDOM_NUMBER(NMR1)
		CALL RANDOM_NUMBER(NMR2)

		NMR1 = INT(NMR1*SIZE1) + 1
		NMR2 = INT(NMR2*SIZE2) + 1
	
	END SUBROUTINE RANCOR


        SUBROUTINE WORDS(SIZE1, SIZE2, ROOM, WRDROM)
		INTEGER SIZE1, SIZE2
		CHARACTER(4) WRDROM(SIZE1, SIZE2)
		INTEGER ROOM(SIZE1, SIZE2)

                DO I=1, SIZE1
                        DO J=1, SIZE2
                                IF (ROOM(I, J) .EQ. 1) THEN
                                	WRDROM(I, J) = 'YOU'
                                ELSE IF (ROOM(I, J) .EQ. 4) THEN
                                        WRDROM(I, J) = 'SHOP'
                                ELSE IF (ROOM(I, J) .EQ. 2) THEN
                                        WRDROM(I, J) = 'EXIT'
                                ELSE
                                        WRDROM(I, J) = ' '
				END IF
			END DO
		END DO

		DO K=1, SIZE1
			WRITE(*, '(100A4)') (WRDROM(K, L), L=1, SIZE2)
		END DO

        END SUBROUTINE WORDS



