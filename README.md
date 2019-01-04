# About
This small project is used to parse a date that can be defined in multiple formats.

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

Install with: sudo apt-get install bison flex

## perl
