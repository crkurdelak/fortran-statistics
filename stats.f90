!---------------------------------------------------------------------------------------------------
! stats.f90
! ckurdelak20@georgefox.edu
! Reads exactly 10 floating point values from a file and computes and prints their statistics
!---------------------------------------------------------------------------------------------------
PROGRAM stats
    ! define vars
    REAL vals(0:9)                                  ! create array of 10 floats
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