# About
This small project is used to parse a date that can be defined in multiple formats.

## Requirements

- Lex: This tool is a standard component on most UNIX operating systems. The GNU flex tool provides the same functionality.

- Yacc: This tool is standard on most UNIX operating systems. The GNU bison tool provides the same functionality.

- C compiler: Any standard C compiler, including Gnu CC (g++), will be fine.

- Make tool: This tool is required to use the sample Makefile to simplify building.

## Supported datetimes

```
4pm
7:38pm
23:42
3:16
3:16am
```

## BNF

```
time   ::= <hour><ampm> | <hour>:<minute><ampm> | <hour>:<minute>
ampm   ::= am | pm
hour   ::= <digit> | <digit><digit>
minute ::= <digit><digit>
digit  ::= 0 | 1 | 2 | 3 | 4 | 5 | 6 | 7 | 8 | 9
```

## bison and flex
Equivalent of yacc and lex in linux are bison and flex.

Install with: `sudo apt-get install bison flex`

### Run the sample code

```
cd lexyacc
make datetime
./datetime.out
```

Given the dates files, the output should look like:
```
new hour: 4
new pm: PM
new hour: 7
new separator: :
new minutes: 38
new pm: PM
new hour: 23
new separator: :
new minutes: 42
new hour: 3
new separator: :
new minutes: 16
new hour: 3
new separator: :
new minutes: 16
new am: AM
end: END
done with the dates file!
```

### Help
http://aquamentus.com/flex_bison.html

## perl
Same as above but using perl and regex to parse dates.

### Run the sample code

```
cd perl
./parser-combinator.pl
```

Given the dates files, the output should look like:
```
4pm is 4 hour(s) in the pm
7:38pm is: 7 hour(s) and 38 minutes(s) in the pm
23:42 is: 23 hours and 42 minutes(s)
3:16 is: 3 hours and 16 minutes(s)
3:16am is: 3 hour(s) and 16 minutes(s) in the am
File termination.
```