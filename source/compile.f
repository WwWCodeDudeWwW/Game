	PROGRAM COMPILE

		CALL SYSTEM('gfortran -c source/main_game.f -o 
     +			     object/main_game.o')
     +
		CALL SYSTEM('gfortran -c source/rooms.f -o 
     +			     object/rooms.o')

		CALL SYSTEM('gfortran -c source/battle.f -o 
     +			     object/battle.o')

		CALL SYSTEM('gfortran -c source/shop.f -o 
     +			     object/shop.o')

		CALL SYSTEM('gfortran -c source/graphic.f -o 
     +			     object/graphic.o')

		CALL SYSTEM('gfortran -c source/audio.f -o
     +			     object/audio.o')

		CALL SYSTEM('gfortran -c source/init.f -o
     +			     object/init.o')

		CALL SYSTEM('gfortran -static -static-libgfortran 
     +			     -static-libgcc object/init.o 
     +			     object/main_game.o object/rooms.o 
     +			     object/battle.o object/shop.o 
     +			     object/graphic.o object/audio.o -o game')
      
	END PROGRAM COMPILE
