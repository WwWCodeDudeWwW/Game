!	main_game.f is for all the game data that will be accessed by all of the other scripts
!	it also contains the initialization of the actual game

	PROGRAM GAME

	EXTERNAL INIT

	INTEGER CHRSTA(7), NMYSTA(5,7), ENEMY(7), LEVEL, LVLIM
	INTEGER PRICES(10), N, TRM, TRNCNT
	CHARACTER(100) HYLLA(10), BCKPCK(5), LINE, EQUIP(5)
	CHARACTER(10) NMYIDX(5), STRING, RADID, OS
	LOGICAL ALIVE, SHOPPE, SOUND
	
	! making the data common

	COMMON /BATTLE/   CHRSTA, NMYSTA
	COMMON /NMY/      ENEMY
	COMMON /NMYIDX/   NMYIDX
	COMMON /RADID/    RADID
	COMMON /TURNS/    TRNCNT
	COMMON /LIFE/     ALIVE
	COMMON /SHOPP/    SHOPPE
	COMMON /BACKPACK/ BCKPCK
	COMMON /LEVELS/   LEVEL,  LVLIM
	COMMON /SHOPPER/  HYLLA
	COMMON /PRICE/    PRICES
	COMMON /EQUIPITY/ EQUIP
	COMMON /OS/       OS
	COMMON /AUDI/     SOUND

	! checking what OS the game is running on to use the appropriate sound player
	
	CALL CHEKOS(OS)
	PRINT *, OS

	! SHOPPE is so the rooms subroutine knows when to put a shop in the room

	SHOPPE = .FALSE.

	! ALIVE is for telling if the player is alive or dead

	ALIVE = .TRUE.

	! Start screen printing from text.txt with 2s delay between lines

	SOUND = .TRUE.

	PRINT *, 'START THE GAME'
	PRINT *, '**************'
!	OPEN(10, FILE='text/start.txt', STATUS='OLD')

!10	CONTINUE

!	READ(10, '(A)', END=99) LINE
!	WRITE(*, '(A)') LINE
!	CALL SLEEP(2)
!	GOTO 10

!99	CONTINUE
!	CLOSE(10)	

	! initializing the group of several rooms

!	CALL HALA(6, 5, 5)

	PRINT *, 'PRICES: ', PRICES

!	CALL SHOP()
!	CALL INVENT()

!	STRING = 'boss'

!	CALL STRID(STRING)

!	CALL AUDIO('test.wav')		

	END PROGRAM GAME


