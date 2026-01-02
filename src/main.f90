program main
        use skyjoGame
        implicit none
        
        ! Initialize nubmer of players and computers
        integer :: nPlayers, nComp

        ! Prompt user for number of players and computers
        write(*, advance="no") "Total number of players: "
        read(*,*) nPlayers
        print *
        write(*, advance="no") "Number of computer players: "
        read(*,*) nComp

        !! Start game
        print *
        write(*,*) "Starting game with ", nPlayers, " players, and ", nComp, " computers."

        !! Initialize deck and game states
        integer, dimension(150) :: deck
        integer, dimension(3,4,nPlayers) :: visState, hiddenState

        !! Create deck and states
        call initGame(deck, visState, hiddenState)
        
        !! Debug: print deck
        print *, deck

end program main
