!---------------------------------------------------------------------------------------------------
! stats.f90
! ckurdelak20@georgefox.edu
! Reads exactly 10 floating point values from a file and computes and prints their statistics
!---------------------------------------------------------------------------------------------------


!---------------------------------------------------------------------------------------------------
! stats_fns
! additional functions to compute statistics
!---------------------------------------------------------------------------------------------------
MODULE stats_fns
    PUBLIC :: mean
    PUBLIC :: std

    CONTAINS
        !---------------------------------------------------------------------------------------------------
        ! mean(vals)
        ! Calculates and returns the mean of an array of 10 floating point values.
        ! param vals: An array of 10 floating point values
        ! return: The mean of vals
        !---------------------------------------------------------------------------------------------------
        REAL FUNCTION mean(vals)
            REAL vals(0:9)
            REAL :: sum

            ! sum the values
            sum = 0
            DO i = 0, 9
                sum = sum + vals(i)
            END DO

            ! divide the sum by 10 to get the mean
            mean = sum / 10

            RETURN
        END FUNCTION mean


        !---------------------------------------------------------------------------------------------------
        ! std(vals)
        ! Calculates and returns the standard deviation of an array of 10 floating point values.
        ! param vals: An array of 10 floating point values
        ! return: The standard deviation of vals
        !---------------------------------------------------------------------------------------------------
        REAL FUNCTION std(vals)
            REAL vals(0:9)
            REAL :: mean_val
            ! the sum of the squares of the differences of the values and the mean
            REAL :: sum_sq_diffs

            ! formula: std = sqrt((sum 0:9((vals(i) - mean_val)^2))/9)
            mean_val = mean(vals)
            ! calculate sum_sq_diffs
            sum_diffs = 0
            DO i = 0, 9
                sum_sq_diffs = sum_sq_diffs + (vals(i) - mean_val) ** 2
            END DO

            ! calculate std
            std = SQRT((sum_sq_diffs) / 9)

            RETURN
        END FUNCTION std
END MODULE stats_fns


!---------------------------------------------------------------------------------------------------
! stats
! Reads exactly 10 floating point values from a file and computes and prints their statistics
!---------------------------------------------------------------------------------------------------
PROGRAM stats
    USE stats_fns
    ! define vars
    REAL vals(0:9)                                  ! create array of 10 floats
    REAL :: val_mean, val_min, val_max, val_std     ! create vars for stats
    CHARACTER*10 :: format_string = '(A, F64.2)'    ! 10-character format string for output

    ! get values from grades.dat
    ! 1 is the unit number that indicates the file
    OPEN(1, FILE='grades.dat', ACCESS='SEQUENTIAL', FORM='FORMATTED', RECL=10)
    ! read the values from the file into the array
    READ(1, *) vals
    CLOSE(1)

    ! compute stats
    val_mean = mean(vals)
    val_min = MIN(vals(0), vals(1), vals(2), vals(3), vals(4), vals(5), vals(6), vals(7), vals(8), vals(9))
    val_max = MAX(vals(0), vals(1), vals(2), vals(3), vals(4), vals(5), vals(6), vals(7), vals(8), vals(9))
    val_std = std(vals)

    ! print results
    WRITE(*, format_string) 'Mean:', val_mean
    WRITE(*, format_string) 'Min:', val_min
    WRITE(*, format_string) 'Max:', val_max
    WRITE(*, format_string) 'Std Dev:', val_std
END PROGRAM stats