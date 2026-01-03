module skyjoGame
        implicit none

        private         ! All entities default module-private
        public initGame ! Make subroutines public

contains
        ! Initialize the game state; fill deck + visible and full game state arrays
        subroutine initGame(deck, nPlayers, visState, hiddenState)
                implicit none
                
                ! Loop indexes and card placeholder
                integer :: i, j, k, n, c
                
                ! Player info
                integer, intent(in) :: nPlayers

                ! Deck fraction
                real :: cFrac

                ! Initialize deck
                integer, allocatable, intent(inout) :: deck(:)

                ! Initialize game state arrays
                integer, allocatable, intent(inout):: visState(:,:,:), hiddenState(:,:,:)
                
                ! Fill deck with correct card numbers
                ! Below 0 numbers
                deck(1:5) = -2
                deck(6:15) = -1
                deck(16:30) = 0

                ! Above 0 numbers
                do i = 1, 12
                        deck(21 + i*10:30 + i*10) = i
                end do

                ! Generate hidden hands
                do i = 1, nPlayers
                        do j = 1, 4
                                do k = 1, 3
                                        call drawCard(deck, c)
                                        hiddenState(k,j,i) = c
                                end do
                        end do
                end do
                
                ! Generate visible hands
                visState(:,:,:) = -10

        end subroutine initGame
        
        ! Draw a card from the deck
        subroutine drawCard(deck, card)
                implicit none

                ! Declare deck
                integer, allocatable, intent(inout) :: deck(:)
                
                ! Declare card
                integer, intent(out) :: card

                ! Declare deck fraction and card number
                integer :: c
                real :: cFrac

                ! Draw a random card
                call random_number(cFrac)
                c = int((cFrac * (size(deck) - 1)) + 1)
                card = deck(c)

                ! Remove that card from the deck
                deck = [deck(:c-1), deck(c+1:)]
                
        end subroutine drawCard

end module skyjoGame
