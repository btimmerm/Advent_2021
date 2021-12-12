<#
https://adventofcode.com/2021/day/12

--- Day 12: Passage Pathing ---
With your submarine's subterranean subsystems subsisting suboptimally, the only way you're getting out of this cave anytime soon is by finding a path yourself. Not just a path - the only way to know if you've found the best path is to find all of them.

Fortunately, the sensors are still mostly working, and so you build a rough map of the remaining caves (your puzzle input). For example:

start-A
start-b
A-c
A-b
b-d
A-end
b-end
This is a list of how all of the caves are connected. You start in the cave named start, and your destination is the cave named end. An entry like b-d means that cave b is connected to cave d - that is, you can move between them.

So, the above cave system looks roughly like this:

    start
    /   \
c--A-----b--d
    \   /
     end
Your goal is to find the number of distinct paths that start at start, end at end, and don't visit small caves more than once. There are two types of caves: big caves (written in uppercase, like A) and small caves (written in lowercase, like b). It would be a waste of time to visit any small cave more than once, but big caves are large enough that it might be worth visiting them multiple times. So, all paths you find should visit small caves at most once, and can visit big caves any number of times.

Given these rules, there are 10 paths through this example cave system:

start,A,b,A,c,A,end
start,A,b,A,end
start,A,b,end
start,A,c,A,b,A,end
start,A,c,A,b,end
start,A,c,A,end
start,A,end
start,b,A,c,A,end
start,b,A,end
start,b,end
(Each line in the above list corresponds to a single path; the caves visited by that path are listed in the order they are visited and separated by commas.)

Note that in this cave system, cave d is never visited by any path: to do so, cave b would need to be visited twice (once on the way to cave d and a second time when returning from cave d), and since cave b is small, this is not allowed.

Here is a slightly larger example:

dc-end
HN-start
start-kj
dc-start
dc-HN
LN-dc
HN-end
kj-sa
kj-HN
kj-dc
The 19 paths through it are as follows:

start,HN,dc,HN,end
start,HN,dc,HN,kj,HN,end
start,HN,dc,end
start,HN,dc,kj,HN,end
start,HN,end
start,HN,kj,HN,dc,HN,end
start,HN,kj,HN,dc,end
start,HN,kj,HN,end
start,HN,kj,dc,HN,end
start,HN,kj,dc,end
start,dc,HN,end
start,dc,HN,kj,HN,end
start,dc,end
start,dc,kj,HN,end
start,kj,HN,dc,HN,end
start,kj,HN,dc,end
start,kj,HN,end
start,kj,dc,HN,end
start,kj,dc,end
Finally, this even larger example has 226 paths through it:

fs-end
he-DX
fs-he
start-DX
pj-DX
end-zg
zg-sl
zg-pj
pj-he
RW-he
fs-DX
pj-RW
zg-RW
start-pj
he-WI
zg-he
pj-fs
start-RW
How many paths through this cave system are there that visit small caves at most once?

Your puzzle answer was 5333.
#>

#Region: Inputs
$ExampleInput = @'
start-A
start-b
A-c
A-b
b-d
A-end
b-end
'@

$ExampleInput2 = @'
dc-end
HN-start
start-kj
dc-start
dc-HN
LN-dc
HN-end
kj-sa
kj-HN
kj-dc
'@

$ExampleInput3 = @'
fs-end
he-DX
fs-he
start-DX
pj-DX
end-zg
zg-sl
zg-pj
pj-he
RW-he
fs-DX
pj-RW
zg-RW
start-pj
he-WI
zg-he
pj-fs
start-RW
'@

$PuzzleInput = @'
pq-GX
GX-ah
mj-PI
ey-start
end-PI
YV-mj
ah-iw
te-GX
te-mj
ZM-iw
te-PI
ah-ZM
ey-te
ZM-end
end-mj
te-iw
te-vc
PI-pq
PI-start
pq-ey
PI-iw
ah-ey
pq-iw
pq-start
mj-GX
'@
#EndRegion: Inputs


#Region: Part 1

Class Cave {
    [string]$Name
    [string[]]$Paths
    [int]$Visits
    [boolean]$Blocked = $False
    Cave ([string]$Name, [string]$Path) {
        $this.Name = $Name
        $this.Paths += $Path
    }
    Cave ([System.collections.hashtable]$Hash) {
        $this.Name = $Hash["Name"]
        $this.Paths = $Hash["Paths"]
        $this.Visits = $Hash["Visits"]
        $this.Blocked = $Hash["Blocked"]
    }
    [void] AddPath ($Path) {
        $this.Paths += $Path
    }
    [string[]] Visit () {
        $this.Visits++
        If ($this.Name -ceq $this.Name.ToLower()) {
            $this.Blocked = $True
        }

        Return $this.Paths
    }
}

Function Start-Walk {
    [cmdletBinding()]
    Param (
        [string[]]$NextOptions,

        [string[]]$CurPath,

        [System.Collections.Hashtable]$Caves
    )

    Process {
        ForEach ($Option in $NextOptions) {
            Write-Verbose "Starting With $($CurPath -join "-")"
            Write-Verbose "  Options: $($NextOptions -join "-")"
            Write-Verbose "    Trying: $Option"

            # Need to start with fresh objects
            $LoopPath = $CurPath.Clone()
            $LoopCaves = Copy-Caves $Caves

            If ($Option -eq "end") {
                $LoopPath += $Option
                Write-Verbose "Found Path: $($LoopPath -join "-")"
                $LoopPath -join ","
            } Else {
                Write-Verbose "Checking $Option"
                $NextCave = $LoopCaves[$Option] | Where-Object {$_ -and -not $_.Blocked}
                If ($NextCave) {
                    # Visit
                    $LoopPath += $Option
                    Write-Verbose "Going to: $($LoopPath -join "-")"
                    $NextOptions2 = $NextCave.Visit() | Where-Object {-not $LoopCaves[$_].Blocked}

                    # Repeat ForEach
                    Start-Walk -NextOptions $NextOptions2 -CurPath $LoopPath.Clone() -Caves $LoopCaves
                } Else {
                    Write-Verbose "$Option didn't work out"
                    Break
                }
            }
        }
    }
}

Function Copy-Caves {
    Param (
        [System.Collections.Hashtable]
        $Caves
    )

    $Caves2 = @{}
    $Caves.GetEnumerator() | ForEach-Object {
        $Object = @{}
        $_.Value.PSObject.Properties | ForEach-Object {$Object[$_.Name] = $_.Value }
        $Caves2.Add($_.Name, [Cave]::New($Object))
    }
    Return $Caves2
}



$Data = $ExampleInput
$Data = $ExampleInput2
$Data = $ExampleInput3
$Data = $PuzzleInput

$Caves = @{}
$Data.Split("`r`n") | ForEach-Object {
    # A-B
    $CurPaths = $_.Split("-").Trim()
    ForEach ($Cave in $CurPaths) {
        $OtherCave = $CurPaths | Where-Object {$_ -ne $Cave}

        $oCave = $Caves[$Cave]
        If ($oCave) {
            # Add Path
            $oCave.AddPath($OtherCave)
        } Else {
            # Create new Cave
            $Caves.Add($Cave , [Cave]::New($Cave, $OtherCave))
        }
    }
}

$CurPath = @("start")
$R = Start-Walk -NextOptions $Caves["start"].Visit() -CurPath $CurPath -Caves $Caves #-Verbose

$Answer_Puzzle_1 = $R.count
$Answer_Puzzle_1

# Example: 10
# Example: 19
# Example: 226
# Puzzle:  5333

#EndRegion: Part 1
