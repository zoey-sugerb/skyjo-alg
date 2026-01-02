module skyjoGame
        implicit none

        private         ! All entities default module-private
        public initGame ! Make subroutines public

contains
        ! Initialize the game state; fill deck + visible and full game state arrays
        subroutine initGame(deck, visState, hiddenState)
                implicit none
                
                ! Loop index
                integer :: i

                ! Initialize deck
                integer, intent(inout) :: deck(:)

                ! Initialize game state arrays
                integer, intent(inout):: visState(:,:,:), hiddenState(:,:,:)

                ! Fill deck with correct card numbers
                ! Below 0 numbers
                deck(1:5) = -2
                deck(6:15) = -1
                deck(16:30) = 0

                ! Above 0 numbers
                do i = 1, 12
                        deck(21 + i*10:30 + i*10) = i
                end do

        end subroutine initGame
end module skyjoGame
