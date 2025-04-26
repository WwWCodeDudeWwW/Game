	PROGRAM COMPILE

		CALL SYSTEM('gfortran -c -static -static-libgfortran 
     +			     -static-libgcc source/main_game.f -o 
     +			     object/main_game.o')
     +
		CALL SYSTEM('gfortran -c -static -static-libgfortran 
     +			     -static-libgcc source/rooms.f -o 
     +			     object/rooms.o')

		CALL SYSTEM('gfortran -c -static -static-libgfortran 
     +			     -static-libgcc source/battle.f -o 
     +			     object/battle.o')

		CALL SYSTEM('gfortran -c -static -static-libgfortran 
     +			     -static-libgcc source/shop.f -o 
     +			     object/shop.o')

		CALL SYSTEM('gfortran -c -static -static-libgfortran 
     +			     -static-libgcc source/graphic.f -o 
     +			     object/graphic.o')

		CALL SYSTEM('gfortran -c -static -static-libgfortran 
     +			     -static-libgcc source/audio.f -o
     +			     object/audio.o')

		CALL SYSTEM('gfortran -static -static-libgfortran 
     +			     -static-libgcc object/main_game.o 
     +			     object/rooms.o object/battle.o 
     +			     object/shop.o object/graphic.o 
     +			     object/audio.o -o game')
      
	END PROGRAM COMPILE
