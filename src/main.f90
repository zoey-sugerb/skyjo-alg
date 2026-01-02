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
        write(*, "(A)", advance="no") "Number of computer players: "
        read(*,*) nComp

        !! Start game
        write(*,"(2(A,1X,I0,1X),A)") "Starting game with", nPlayers, "players and", nComp, "computers."

        !! Allocate state arrays to the right size
        allocate(visState(3,4,nPlayers))
        allocate(hiddenState(3,4,nPlayers))

        !! Create deck and states
        call initGame(deck, visState, hiddenState)
        
        !! Debug: print deck
        print *, deck

end program main
