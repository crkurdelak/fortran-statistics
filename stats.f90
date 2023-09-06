!---------------------------------------------------------------------------------------------------
! stats.f90
! ckurdelak20@georgefox.edu
! Reads exactly 10 floating point values from a file and computes and prints their statistics
!---------------------------------------------------------------------------------------------------

!---------------------------------------------------------------------------------------------------
! mean(vals)
! Calculates and returns the mean of an array of 10 floating point values.
! param vals: An array of 10 floating point values
! return: The mean of vals
!---------------------------------------------------------------------------------------------------
REAL FUNCTION mean(vals)
    IMPLICIT NONE
    REAL, DIMENSION(5) :: vals
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
    IMPLICIT NONE
    REAL, DIMENSION(5) :: vals
    REAL :: mean_val
    REAL :: sum_diffs           ! the sum of the differences of the values and the mean

    ! formula: std = sqrt((sum 0:9(vals(i) - mean_val)^2)/9)
    mean_val = mean(vals)
    ! calculate sum_diffs
    sum_diffs = 0
    DO i = 0, 9
        sum_diffs = sum_diffs + (vals(i) - mean)
    END DO

    ! calculate std
    std = SQRT((sum_diffs ** 2) / 9)

    RETURN
END FUNCTION std


PROGRAM stats
    IMPLICIT NONE                                   ! switch off implicit name-based typing
    ! define vars
    REAL, DIMENSION(5) :: vals                      ! create array of 10 floats
    REAL :: val_mean, val_min, val_max, val_std     ! create vars for stats
    CHARACTER*10 :: format_string = '(A, F64.2)'    ! 10-character format string for output

    ! TODO get values from grades.dat


    ! compute stats
    ! val_mean = mean(vals)
    val_min = MIN(vals(0), vals(1), vals(2), vals(3), vals(4), vals(5), vals(6), vals(7), vals(8), vals(9))
    val_max = MAX(vals(0), vals(1), vals(2), vals(3), vals(4), vals(5), vals(6), vals(7), vals(8), vals(9))
    ! val_std = std(vals)
    ! TODO define mean and stdev functions

    ! print results
    WRITE(*, format_string) 'Mean:', val_mean
    WRITE(*, format_string) 'Min:', val_min
    WRITE(*, format_string) 'Max:', val_max
    WRITE(*, format_string) 'Std Dev:', val_std
END PROGRAM stats