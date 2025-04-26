	! Initializes all the common variables and their data

        BLOCK DATA INIT
        INTEGER CHRSTA(7), NMYSTA(5,7)
        INTEGER ENEMY(7), LEVEL, LVLIM
        INTEGER PRICES(10), TRNCNT
        CHARACTER*100 HYLLA(10), BCKPCK(5), EQUIP(5)
        CHARACTER*10 NMYIDX(5), RADID, OS
        LOGICAL ALIVE, SHOPPE, AUDIO

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
        COMMON /AUDI/     AUDIO


        ! Stats of character and all of the enemies

                    !HP   STR ACC DEF SPD EXP  GOLD
        DATA CHRSTA /50,  10, 70, 10, 50, 0,   50/

        DATA NMYSTA /30, 100 , 40 , 0, 0, ! HP
     +               10,  10 , 5  , 0, 0, ! STR
     +               70,  70 , 90 , 0, 0, ! ACC
     +               10,  10 , 15 , 0, 0, ! DEF
     +               50,  50 , 50 , 0, 0, ! SPD
     +               10, 100 , 10 , 0, 0, ! EXP
     +               10, 100 , 10 , 0, 0/ ! GOLD

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
     +               'SWORD' ,
     +               'PRIMORDIAL PLUTONIUM PIKE',
     +               'GARGANTUAN GADOLINIUM GAUNTLET',
     +               'ZIRCONIUM ZLASHER',
     +               '',
     +               '',
     +               '',
     +               '',
     +               ''/

        DATA PRICES /10, 20, 100, 50,0,0,0,0,0,0/

        DATA OS /''/

        END

