module skyjoGame
        implicit none

        private ! All entities default module-private

contains
        ! Initialize the game state; output deck + visible and full game state arrays
        function initGame(nPlayers, nComps) result(deck, visState, hiddenState)
                implicit none
                
                ! Loop index
                integer :: i

                ! Initialize deck
                integer, dimension(150) :: deck

                ! Initialize game state arrays
                integer, dimension(3, 4, n):: visState, hiddenState

                ! Fill deck with correct card numbers
                ! Below 0 numbers
                deck(1:5) = -2
                deck(6:15) = -1
                deck(16:30) = 0

                ! Above 0 numbers
                do i = 1, 12
                        deck(21 + i*10) = i
                end do

        end function initGame
end module skyjoGame
