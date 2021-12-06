<#
https://adventofcode.com/2021/day/4

--- Day 4: Giant Squid ---
You're already almost 1.5km (almost a mile) below the surface of the ocean, already so deep that you can't see any sunlight. What you can see, however, is a giant squid that has attached itself to the outside of your submarine.

Maybe it wants to play bingo?

Bingo is played on a set of boards each consisting of a 5x5 grid of numbers. Numbers are chosen at random, and the chosen number is marked on all boards on which it appears. (Numbers may not appear on all boards.) If all numbers in any row or any column of a board are marked, that board wins. (Diagonals don't count.)

The submarine has a bingo subsystem to help passengers (currently, you and the giant squid) pass the time. It automatically generates a random order in which to draw numbers and a random set of boards (your puzzle input). For example:

7,4,9,5,11,17,23,2,0,14,21,24,10,16,13,6,15,25,12,22,18,20,8,19,3,26,1

22 13 17 11  0
 8  2 23  4 24
21  9 14 16  7
 6 10  3 18  5
 1 12 20 15 19

 3 15  0  2 22
 9 18 13 17  5
19  8  7 25 23
20 11 10 24  4
14 21 16 12  6

14 21 17 24  4
10 16 15  9 19
18  8 23 26 20
22 11 13  6  5
 2  0 12  3  7
After the first five numbers are drawn (7, 4, 9, 5, and 11), there are no winners, but the boards are marked as follows (shown here adjacent to each other to save space):

22 13 17 11  0         3 15  0  2 22        14 21 17 24  4
 8  2 23  4 24         9 18 13 17  5        10 16 15  9 19
21  9 14 16  7        19  8  7 25 23        18  8 23 26 20
 6 10  3 18  5        20 11 10 24  4        22 11 13  6  5
 1 12 20 15 19        14 21 16 12  6         2  0 12  3  7
After the next six numbers are drawn (17, 23, 2, 0, 14, and 21), there are still no winners:

22 13 17 11  0         3 15  0  2 22        14 21 17 24  4
 8  2 23  4 24         9 18 13 17  5        10 16 15  9 19
21  9 14 16  7        19  8  7 25 23        18  8 23 26 20
 6 10  3 18  5        20 11 10 24  4        22 11 13  6  5
 1 12 20 15 19        14 21 16 12  6         2  0 12  3  7
Finally, 24 is drawn:

22 13 17 11  0         3 15  0  2 22        14 21 17 24  4
 8  2 23  4 24         9 18 13 17  5        10 16 15  9 19
21  9 14 16  7        19  8  7 25 23        18  8 23 26 20
 6 10  3 18  5        20 11 10 24  4        22 11 13  6  5
 1 12 20 15 19        14 21 16 12  6         2  0 12  3  7
At this point, the third board wins because it has at least one complete row or column of marked numbers (in this case, the entire top row is marked: 14 21 17 24 4).

The score of the winning board can now be calculated. Start by finding the sum of all unmarked numbers on that board; in this case, the sum is 188. Then, multiply that sum by the number that was just called when the board won, 24, to get the final score, 188 * 24 = 4512.

To guarantee victory against the giant squid, figure out which board will win first. What will your final score be if you choose that board?

Your puzzle answer was 29440.

--- Part Two ---
On the other hand, it might be wise to try a different strategy: let the giant squid win.

You aren't sure how many bingo boards a giant squid could play at once, so rather than waste time counting its arms, the safe thing to do is to figure out which board will win last and choose that one. That way, no matter which boards it picks, it will win for sure.

In the above example, the second board is the last to win, which happens after 13 is eventually called and its middle column is completely marked. If you were to keep playing until this point, the second board would have a sum of unmarked numbers equal to 148 for a final score of 148 * 13 = 1924.

Figure out which board will win last. Once it wins, what would its final score be?

Your puzzle answer was 13884.

Both parts of this puzzle are complete! They provide two gold stars: **
#>

$ExampleInput = @'
7,4,9,5,11,17,23,2,0,14,21,24,10,16,13,6,15,25,12,22,18,20,8,19,3,26,1

22 13 17 11  0
 8  2 23  4 24
21  9 14 16  7
 6 10  3 18  5
 1 12 20 15 19

 3 15  0  2 22
 9 18 13 17  5
19  8  7 25 23
20 11 10 24  4
14 21 16 12  6

14 21 17 24  4
10 16 15  9 19
18  8 23 26 20
22 11 13  6  5
 2  0 12  3  7
'@

$PuzzleInput = @'
84,28,29,75,58,71,26,6,73,74,41,39,87,37,16,79,55,60,62,80,64,95,46,15,5,47,2,35,32,78,89,90,96,33,4,69,42,30,54,85,65,83,44,63,20,17,66,81,67,77,36,68,82,93,10,25,9,34,24,72,91,88,11,38,3,45,14,56,22,61,97,27,12,48,18,1,31,98,86,19,99,92,8,43,52,23,21,0,7,50,57,70,49,13,51,40,76,94,53,59

31 93 46 11 30
 2 45 40 69 33
82 21 37 99 86
57 16 34 94 85
60 49 28 14 65

96  2 20 41 24
29 15 27 83 48
 7 93 99 82 26
 3 91 66 35 85
62 78 67  4 22

10 87 50 84 40
78  5 17 59 44
38 88 15 46 32
 8 72 74 90 23
64 93 49 39 20

25 41 32 30 39
 6 66 38 95  5
31 13 56 67 34
69 18 64 44 96
75 14 88 97 40

39 62 50 10 68
18  7 95 72 82
83 23 19 70 71
11 64 30  8  3
 6 81 27 34 99

40 52 66 20 49
93 74 16 35 29
97 88  6 98 81
62 55 99 47 12
83 76 57 75 22

52 76 43 86 99
58 26 61 36 42
11 69 65  3 49
33  7 71  8 25
50 82 32 16 64

45 38 88 96  8
22 17  5 60 66
87 12 61 59  2
 0 37 18 15 98
 7 62 23 56 92

20  7 12 26 69
81 63 89 57 19
18 44 61 64 53
47 27  8 30  0
60 99 28  6 96

70 50 63 56 26
55 97 65  5 96
72 68 29 91 61
34  0 14 28  4
45 53 78 80 47

19 12 92 80 97
22 37 38  9 82
86 72 99 59 89
73 18 21 87 46
33 77 71 54 94

66 99 10 44 48
38 45  4 63 62
50 27 88 56 89
81 91 72 90 32
76 29 17  6  7

71 39 10 77 50
97 95 90 98  4
66 32 73 35 16
 1 99  7 96 23
74 31 94 37  5

20 72 78  5 69
88  8 55 80 30
62 58  4 53 47
45 13  7 14 52
86 12 66 74 76

95 53 59 68 37
63 40 20 46 43
 5 27 67 84 39
99 51 12 76 50
78 23 89 22 57

 0 96  2 88 11
98 52 70 28 22
60 50 18 49 41
97  6 68 21 47
90 57 58 99 48

 7  3 77 61 34
57 69 64 68 58
 8 49 33 22 15
63 10  4 95 59
28 20 71 44 75

90 68 15 99 38
16 80 56 70  3
88 52 18  4 39
40 85 89 84 44
65 73 71 79  2

66 43 12 10 70
79 57 54 41  6
46 73 40  3 52
36 21 38  8 62
 7 26 42 32  0

57 51 69 34 43
14  9 96 88 74
90 22 83 30 71
80 64 91 48 97
54 38 89 66 16

51  4 49  2 59
53 40 33 54 45
69 41 92 26 60
93 72 94 90 35
76  8 75 38 52

 5 75 19 28 39
14 80 27 64 78
24 69 23 96 42
 0 81 10 20 13
36 57 17 76 52

38 25  7 88 33
24 41 96 85 64
52 89 63 93 18
94 20  0 98 28
 9 30 27 79 83

74 97 15 55 67
92 28 24 11 38
 8 70 65 63 45
83 22 30 76 96
21 85 29 59 36

 1 79 29  0 75
68 58 61 84 51
85 74 46 69  3
94 16 41 43 15
57 21 48 22 42

61  5  1 25 28
50 40 74 14 94
32  0 68 15 54
60 45 51 31 97
56 52  8  9 63

20 36 72 74 83
 4 88 35 62 24
68 39 58 30 34
61 41 42 93 66
48 12 57  6 11

89 52 47 66 64
67 28 30 46 22
44 79 23 86 80
81 25 10 53 94
56 87 74 60 75

38 62 76 43 50
83 53 64  4 44
52 47 91 49  7
 0 85 96 78 86
32  8 81 87 90

76 67 31 74 87
15 70  9 83 78
60 46 86 73 72
71 53 82 89 28
39 97 68 96 11

88  7 32 40 94
39 68 13  6  9
20 55 72 49 25
56 86 78 12 18
27 34 19 48 44

88 19 29 87 28
53 47 40 74 77
 3 93 14 38 33
78 39 26 32 22
75  0  2 95 54

52 35 43 77 79
53 56 93 92 12
15 23 16 10 66
63 96 58 60 94
 6 55 76 21 89

55 11 26 37 18
77 80  0 30 58
 2 97 13 27 98
68 40 91 56 20
78 42 45 87 24

62 71 79 12 66
 9 73 30 70 88
18 72 27  5 75
49  3 47 33  6
55 63 98 15 21

20 52 46 33 27
80  2 48 29 62
 9 32  5 41 53
74 39 87 12 73
96 79 61 63 22

30 48 26 21 83
56 94 39 47 99
93 66 25 76 57
60 96 62 13 84
71 42 28 31 20

30 77 49 36 34
53 75 11 38 61
41 72  4 58 92
91 10 21 51 31
89 43 14 23 45

30 76 12  1 21
31  0 82  2  8
26 28 61 32 99
65 46 16 39 74
60 63  5 50 42

31 90 72 81  8
17 94 45 20 38
30 28 68  0 25
84 10 37 61 83
87 70 32 64 99

21 28 99 30  2
86 64 53 54 84
82 13 79 96 55
76  3 12 92 98
27 89 10 37 95

74 38 98 18 55
62 82 93 85 46
43  3 26 84 86
97  1 19 12 67
94 72 68 88  0

41 97 88  0 40
20  5 51 42 87
38  9 11 50  6
35 25 54 12 81
75 58 57 94 26

 2 30 22 48 88
60 86 69 31 57
97 58 95 47 71
85 63 81 80 73
25 92 62 11 83

 3 93 20 74 86
21 31 73 35 91
41 28 25  4 92
19  5 38 52 59
37 16 48 85 68

26 32 66 93 68
74 90 70 41 57
99 94 51  3 46
 1 24 17 54 39
53 60 50 96 49

50 27 72 42 84
82 62 39 33 31
99  4 20  3 70
11 28 57 55 12
61 29 14 60 90

60 23 66 99  3
 6 24 42 51 45
41 39 53 25 72
32 57  5 74  4
78 44 67  7 50

 8 39  4 42 50
27 25 77 94 90
52 45 59 60 84
 0 78 36 86 22
56  1 71 82 29

78 11 49 67 93
99 76 12 37  1
17 35 19 92 91
22 54 31 72 36
61 96 63 26 33

 1 69 71 21 72
87 92 32 29 80
40 39 52 42 75
26 24 11 44 23
10 99 62 36 98

60 47 49 24 66
 2 19 38 57 94
54 22 17 33 42
65 80 48 86 20
53 27 59 30 11

 3 81 64 69 82
93 80 71 51 46
76  7 38 57 91
37 88  8 65 54
36 25  1 95 77

75 56 19 21 34
15  7 24 41 86
68 29 85 80 88
18 58 81 44 62
 0 52 89 47 59

49 98 57 90 46
76 88 84 60  6
38 78 77 83 99
79 48  5 63 74
66 30 37  4 47

56 37 93 43 11
81 87 85 52 94
64 91 36 97 27
18 31 26 22 78
50 54 32 69 96

73 20 51 50 30
48 83 22 76 85
26  3 63 67 92
97  0 87 88  1
18 33 86 77 52

 1 18 50  7 22
11 96 47 94 67
58 36 43 65  6
91 53 23 34 44
81 30 83 86 55

 1 36 10 84 90
55 35 74 23 26
29 53 76 40 85
89 77 16 17 93
11 19 65  5 49

99 48 88 10 79
84 75 66 74 58
 3 26 92 91 86
87 98 52 45 21
56 51  0 85 69

53 45 75  5 82
44 90 11  2 85
69 19 46 89 47
 4 22 16 84 52
81  1 39  9 38

18 57 15 30 35
 9 32 52 44 25
69 43 61  3 51
 2  8 80 85 33
72 13 45 10 87

52 24 26 74 49
 0 37 61 91 54
70 96 60 80 39
11 75 85 46 18
16 90 20 66 67

13 74 92 11  7
59 46 41 12 55
27 77 89 70 96
81  5 29 32 51
84 75 33 63 99

87 58 84  6 68
65  9 75 48 90
41 94 89 64 21
95 81 72 32 30
83 17 63 52 97

89  0 61 92 16
44 65 25 66 20
29 27 37 94 68
10 63 12 48 77
 6 32 82  4 40

 1 20 69 80 45
 8  7 15 27 19
40 87  2 98 32
35 79 84 71 14
24 43 23 29  6

59 62 32 74 58
78 61 85  4 75
40 30 24 31 46
89 39 23 63 37
45 29 44 21 19

88 44 39 81 43
26 18 10 73  3
62 63 74 53 60
 0 65 84 54 21
14 25 76 13  2

61 57 77  0 92
12 27 68 89 72
86 21 44 43 40
41 74 26 73 66
 9 59 32  3  8

20 93 99 67 28
53 52 19 72 23
31 65 25 88 10
61 37 43  9 76
60 33 87  3 96

83 15 46 70 80
90 69  1  6 64
43 33 17 99 53
98 25 30  8 31
66 94 13 12 75

18 52 83  3 19
41 51 60 13 54
33  5 69 99  8
27 44 31 34  4
17 25  1 68 79

92 23 93 26 75
50 28 30 42 25
77 83 56 95 34
57 13 27 65 81
 7 71 40 94  9

16 28  3 39 82
 7 99 44 69  8
49 51 93 34  6
60 84  0 92  2
76 88 38 68 24

23 99 47 36 77
20 90  4 78 93
71 88 52 28 92
97 31 25 95 39
 6 21 68 45 53

 0 51 69 75 56
10 47 12 52  6
65 87 77 85 42
98 23 25 97 30
84 86 67 35 22

24 36 70 99 98
94  1 59 67 35
81 25  6 61 68
72 53  9 40 92
97 73 91 41 10

 1 78  3 66 15
39 29 24 76 98
10 25 90 30 55
41 96 83 72 51
46 87 42 26 44

20 60 59  4 21
50 71 45 31  1
49 75 37 54 28
84 46 98 24  2
96 16 51 79 35

59 46 65 39 95
92  5 10 63 36
16 90 56 89 70
83 45 24 64 74
55 27 54  2 51

16 23 63 62 57
17 26 58 83 60
39 68 22 98 48
65 50 76  3 14
24 75 25  7 86

35 26 74 81 56
62 84 34 30 33
 5 73 21 15 93
78 77 69 49 43
44 11 54 51 87

56 78 74 24 39
70 85  6 84  9
97 65 16 82  5
 2 12 20 79 42
14 37 15 69 26

42 31 88 46 71
65 97 11 34 48
85 96 27  0  7
41  9  5 72 53
37 93 98 57 64

 1 10 55 57 99
61 92 82 86 56
19 16 43 84 87
42  6 79 46 17
51 44 64 73 35

17  0 84 15 34
57 92 41 82 40
 8 38 16 35  4
 6 33 79 97 96
52 11 21 10 73

89  2 81 22 34
77 87 84 11 80
85 67 96 49 40
19  3 76 98 16
29  1 20 35 82

 4 57 84 91  6
 8 16 69  1  0
73  2 41 20  5
98 40 96 82 93
12 51 23 68 83

64 52 50  1 94
97 58 24 90  5
 9 75  3 61 37
84 91 34 29  8
30 74  4 18 45

92 63 96 34  9
14 25 89  4 98
23 67 90 74 77
61  3 93 55 82
51 65 48 36  8

70 65 20 76 50
17  1 33 15 22
 3 98 44 91 55
59 83  2 67 87
14 63 56 86 37

61 53 45 88 36
96 74 15 39 42
32 55 44 46 86
79 94 27 54 57
65  3 21 17 75

14 26 18 54 20
24 22 90  0 16
70 28 33 12 27
45 95 30 65 75
19 81 39  2 84

48 23 67 75 86
40 46 87 27 93
79 44 13  3 53
24 98 54 34  8
49  1 39 28 35

 3 29 16  5 80
86 50  6 45 88
22 71 73 34 94
81 28 68 20 30
33 37 95 35 57

49  1  6 26 30
56  5 63 79 15
34 52 87 19 66
59 96 80 42 58
50 32 72 38 74

83 90 18 23 64
87 89 62 31 66
81 49  9  8 56
51 85 63 32 50
95 47 11 98 17

68 83 80 25 48
72 39  7 20 30
32 38 12 66 64
29 10 44 23 45
58 15 91 81 95

90 67 30 22 58
35 50 63 59 19
54  4 41 38 65
43 47 56 96 20
87 57 33 37 49
'@

Class BingoCard {
    [PSCustomObject[]]$Squares
    [Boolean]$Bingo = $false
    BingoCard ([String]$Board) {
        $this.Squares = $Board.Split("`r`n") | Where-Object {$_ -notlike $Null} | ForEach-Object {
            $_ -split '\s+' | Where-Object {$_ -match '\d+'} | ForEach-Object {
                [PSCustomObject]@{
                    Value  = [int]$_
                    Called = $false
                }
            }
        }
        If ($this.Squares.Count -ne 25) {
            Throw "Failed to build board"
        }
    }
    [Boolean] Mark ([Int]$Num) {
        $Result = $False
        $this.Squares | Where-Object {$_.Value -eq $Num} | ForEach-Object {$_.Called = $True}
        If (
            @($this.Squares[0..4] | Where-Object {$_.Called -eq $True}).Count -eq 5 -or
            @($this.Squares[5..9] | Where-Object {$_.Called -eq $True}).Count -eq 5 -or
            @($this.Squares[10..14] | Where-Object {$_.Called -eq $True}).Count -eq 5 -or
            @($this.Squares[15..19] | Where-Object {$_.Called -eq $True}).Count -eq 5 -or
            @($this.Squares[20..24] | Where-Object {$_.Called -eq $True}).Count -eq 5 -or
            @($this.Squares[0, 5, 10, 15, 20] | Where-Object {$_.Called -eq $True}).Count -eq 5 -or
            @($this.Squares[1, 6, 11, 16, 21] | Where-Object {$_.Called -eq $True}).Count -eq 5 -or
            @($this.Squares[2, 7, 12, 17, 22] | Where-Object {$_.Called -eq $True}).Count -eq 5 -or
            @($this.Squares[3, 8, 13, 18, 23] | Where-Object {$_.Called -eq $True}).Count -eq 5 -or
            @($this.Squares[4, 9, 14, 19, 24] | Where-Object {$_.Called -eq $True}).Count -eq 5
        ) {
            $this.Bingo = $true
            $Result = $true
        }

        Return $Result
    }
}

$Data = $ExampleInput
$Data = $PuzzleInput

#Region: Build Boards
$i = 0
$arrBoards = $Data.Split("`r`n") | Select-Object -Skip 1 | ForEach-Object {
    If ($i -ge 1 -and $i -le 5) {
        $Board += $_
        If ($i -eq 5) {
            $Board -join "`r`n"
            $i = 0
        } Else {
            $i++
        }
    } Else {
        $Board = @()
        $i++
    }
}

$BingoCards = $arrBoards | ForEach-Object {[BingoCard]::New($_)}
#EndRegion: Build Boards

#Region: Play until we have a winner
$Numbers = $Data.Split("`r`n")[0].split(",")
ForEach ($Call in $Numbers) {
    Write-Verbose $Call -Verbose
    $R = $BingoCards.mark($Call)
    If ($R -eq $true) {
        Break
    }
}
#EndRegion: Play until we have a winner

# Calculate score of the winning board
$UnmarkedSum = $BingoCards | Where-Object Bingo | Select-Object -ExpandProperty Squares | Where-Object {-not $_.Called} | Select-Object -ExpandProperty Value | Measure-Object -Sum | Select-Object -ExpandProperty Sum
$Answer_Puzzle_1 = $UnmarkedSum * $Call
$Answer_Puzzle_1

# Example: 4512
# Puzzle:  29440


# Part 2

# Rebuild Boards using Region above (FIX: Make this a function.)

$LastCard = $False
$Numbers = $Data.Split("`r`n")[0].split(",")
ForEach ($Call in $Numbers) {
    Write-Verbose $Call -Verbose
    [void]($BingoCards.mark($Call))
    If (-not $LastCard -and @($BingoCards | Where-Object {-not $_.Bingo}).count -eq 1 ) {
        $BingoCards = $BingoCards | Where-Object {-not $_.Bingo}
        $LastCard = $True
    }
    If ($LastCard -and $BingoCards.Bingo) {
        Break
    }
}
$UnmarkedSum = $BingoCards | Select-Object -ExpandProperty Squares | Where-Object {-not $_.Called} | Select-Object -ExpandProperty Value | Measure-Object -Sum | Select-Object -ExpandProperty Sum
$Answer_Puzzle_2 = $UnmarkedSum * $Call
$Answer_Puzzle_2

# Example: 1924
# Puzzle:  13884