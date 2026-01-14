module skyjoUI
        implicit none

        private         ! All entitities default module-private
        public humTurn  ! Make subroutines public

contains
        ! Prompt a human player to take a turn
        subroutine humTurn(pNum, deck, visState, hiddenState)
                implicit none

                ! Initialize player number
                integer, intent(in) :: pNum

                ! Initialize deck
                integer, allocatable, intent(inout) :: deck(:)

                ! Initialize game states
                integer, allocatable, intent(inout) :: visState(:,:,:), hiddenState(:,:,:)
                
                ! Beginning-of-turn prompt
                write(*,"(/,A,I0,A)") "Player #", pNum, "'s turn:"
                
                ! Draw hand
                call writeHand(visState(:,:,pNum))

                ! Prompt the player for their action
                call turnPrompt()

        end subroutine humTurn

        ! Draw a visible hand array
        subroutine writeHand(hand)
                implicit none

                ! Loop indexes
                integer :: i, j

                ! Placeholder character for converting integers to character
                character(2) :: card

                ! Initialize hand array and string
                integer, intent(in), dimension(3,4) :: hand(:,:)
                character(2), dimension(4,5) :: handStr

                ! Add row and column labels
                handStr(1,1:5) = ["  ", "CA", "CB", "CC", "CD"]
                handStr(2,1) = "R1"
                handStr(3,1) = "R2"
                handStr(4, 1) = "R3"

                ! Loop through each element
                do i = 2, 4
                        do j = 2, 5
                                if (hand(i,j) > -3) then
                                        write(card, "(I2)") hand(i,j)
                                        handStr(i, j) = trim(card)
                                else
                                        handStr(i, j) = " X"
                                end if
                        end do
                end do

                ! Write the hand to the console
                write(*,"(*(A2))") ((handStr(i,j), " ", j=1,5), new_line("A"), i=1, 4)

        end subroutine writeHand

        ! Prompt the player for the actions they can take that turn
        subroutine turnPrompt()
                implicit none
                write(*,"(A)") "Choose an action:", "    1. Flip over a card", "    2. Draw a card", "    3. Take card on discard", ">"
        end subroutine turnPrompt
end module skyjoUI
