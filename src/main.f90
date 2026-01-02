program main
        use skyjoGame
        implicit none
        
        ! Initialize nubmer of players and computers
        integer :: nPlayers, nComp

        ! Initialize deck and game states
        integer, dimension(150) :: deck
        integer, allocatable :: visState(:,:,:), hiddenState(:,:,:)

        ! Prompt user for number of players and computers
        write(*, "(A)", advance="no") "Total number of players: "
        read(*,*) nPlayers
        print *
        write(*, "(A)", advance="no") "Number of computer players: "
        read(*,*) nComp

        !! Start game
        print *
        write(*,"(A,1X, I0)") "Starting game with", nPlayers, "players and", nComp, "computers."

        !! Allocate state arrays to the right size
        allocate(visState(3,4,nPlayers))
        allocate(hiddenState(3,4,nPlayers))

        !! Create deck and states
        call initGame(deck, visState, hiddenState)
        
        !! Debug: print deck
        print *, deck

end program main
