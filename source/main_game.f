!	main_game.f is for all the game data that will be accessed by all of the other scripts
!	it also contains the initialization of the actual game

	PROGRAM GAME

	INTEGER CHRSTA(7), NMYSTA(5,7), BOSS(7), ENEMY(7), LEVEL, LVLIM
	INTEGER PRICES(10), N, TRM, TRNCNT
	CHARACTER(100) HYLLA(10), BCKPCK(5), LINE, EQUIP(5)
	CHARACTER(10) NMYIDX(5), STRING, RADID
	LOGICAL ALIVE, SHOPPE

	! Stats of character and all of the enemies

		    !HP   STR ACC DEF SPD EXP  GOLD
	DATA CHRSTA /50,  10, 70, 10, 50, 0,   30/

	DATA NMYSTA /30, 100 , 40 , 0, 0, ! HP
     +		     10,  10 , 5  , 0, 0, ! STR
     +	     	     70,  70 , 90 , 0, 0, ! ACC
     +		     10,  10 , 15 , 0, 0, ! DEF
     +		     50,  50 , 50 , 0, 0, ! SPD
     +		     10, 100 , 10 , 0, 0, ! EXP
     +		     10, 100 , 10 , 0, 0/ ! GOLD

	! ID to use for identifying an enemy

	DATA NMYIDX /'goblin', 'boss', 'skeleton', ' ', ' '/

	! The NMYINI subroutine puts the stats of the corresponding enemy from NMYSTA into ENEMY

	DATA ENEMY  /0, 0, 0, 0, 0, 0, 0/
	
	! ID and turn count for the radiation condition

	DATA RADID  /''/

	DATA TRNCNT /0/

	! The backpack and the equipped items

	DATA BCKPCK /'', '', '', '', ''/

	DATA EQUIP  /'', '', '', '', ''/

	! current level and the amount of xp needed to reach the next one

	DATA LEVEL  /1/
	
	DATA LVLIM  /50/

	! the inventory of the shop and the prices corresponding to the items

	DATA HYLLA  /'POTION',
     +		     'SWORD' ,
     +		     'PRIMORDIAL PLUTONIUM PIKE',
     +		     'GARGANTUAN GADOLINIUM GAUNTLET',
     +		     'ZIRCONIUM ZLASHER',
     +		     '',
     +		     '',
     +		     '',
     +		     '',
     +		     ''/
	DATA PRICES /10, 20, 100, 50,0,0,0,0,0,0/

	! making the data common

	COMMON /BATTLE/   CHRSTA, NMYSTA
	COMMON /NMY/      ENEMY
	COMMON /NMYIDX/   NMYIDX
	COMMON /RADID/      RADID
	COMMON /LIFE/     ALIVE
	COMMON /SHOPP/    SHOPPE
	COMMON /BACKPACK/ BCKPCK
	COMMON /LEVELS/   LEVEL,  LVLIM
	COMMON /SHOPPER/  HYLLA
	COMMON /PRICE/    PRICES
	COMMON /EQUIPITY/ EQUIP

	
	! SHOPPE is so the rooms subroutine knows when to put a shop in the room

	SHOPPE = .FALSE.

	! ALIVE is for telling if the player is alive or dead

	ALIVE = .TRUE.

	! Start screen printing from text.txt with 2s delay between lines

	PRINT *, 'START THE GAME'
	PRINT *, '**************'
!	OPEN(10, FILE='text/start.txt', STATUS='OLD')
!
!10	CONTINUE

!	READ(10, '(A)', END=99) LINE
!	WRITE(*, '(A)') LINE
!	CALL SLEEP(2)
!	GOTO 10

!99	CONTINUE
!	CLOSE(10)	

	! initializing the group of several rooms

!	CALL HALA(6, 5, 5)

!	BCKPCK(1) = 'ZIRCONIUM ZLASHER'
!	CALL INVENT()

!	STRING = 'boss'

!	CALL STRID(STRING)

	OPEN(20, FILE='text/end.txt', STATUS='OLD')

20	CONTINUE

	READ(20, '(A)', END=999) LINE
	WRITE(*, '(A)') LINE
	CALL SLEEP(2)
	GOTO 20

999	CONTINUE
	CLOSE(20)	


	PRINT *, ' '
	PRINT *, ' CREDITS'
	PRINT *, '*********'

        OPEN(30, FILE='text/credits.txt', STATUS='OLD')

30      CONTINUE

        READ(30, '(A)', END=9) LINE
        WRITE(*, '(A)') LINE
        CALL SLEEP(2)
        GOTO 30

9       CONTINUE
        CLOSE(30)

	
	

	END PROGRAM GAME


