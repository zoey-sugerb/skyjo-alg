program main
        use skyjoGame
        use skyjoUI
        implicit none
        
        ! Initialize nubmer of players and computers
        integer :: nPlayers, nComp

        ! Initialize deck and game states
        integer, allocatable :: deck(:)
        integer, allocatable :: visState(:,:,:), hiddenState(:,:,:)

        ! Prompt user for number of players and computers
        write(*, "(A)", advance="no") "Total number of players: "
        read(*,*) nPlayers
        write(*, "(A)", advance="no") "Number of computer players: "
        read(*,*) nComp

        ! Start game
        write(*,"(2(A,1X,I0,1X),A)") "Starting game with", nPlayers, "players and", nComp, "computers."
        
        ! Allocate deck to the right size
        allocate(deck(150))

        ! Allocate state arrays to the right size
        allocate(visState(3,4,nPlayers))
        allocate(hiddenState(3,4,nPlayers))

        ! Create deck and states
        call initGame(deck, nPlayers, visState, hiddenState)
        
        ! Play turns
        call humTurn(1, deck, visState, hiddenState)
end program main
