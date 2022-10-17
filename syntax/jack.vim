" Vim syntax file
" Language: jack
" Maintainer: MM
" Lastest Revision: 23 Dec 2020

if exists("b:current_syntax")
    finish
endif

syn keyword progComponents class constructor method function 
syn keyword primiType    boolean char void int
syn keyword variableDeclarations var static field 
syn keyword statements   let do if else while return 
syn keyword constValues  true false null 
syn keyword objReference this

syn match jackNumber '\d\+'
syn match jackComment "\/\/.*$" contains=celestiaSCTodo
syn region jackCommentB start="\/\*" end="\*\/"

syn region jackString oneline start='"' end='"' 
" syn region jackDescString oneline start='"' end='"'
syn region jackBlock start="{" end="}" fold transparent

let b:current_syntax="jack"

hi def link jackString String 
hi def link jackNumber Constant 
hi def link jackBlock  Statement
hi def link jackComment Comment
hi def link jackCommentB Comment
hi def link progComponents Special 
hi def link primiType Type
hi def link variableDeclarations PreProc
hi def link statements keyword
hi def link constValues Constant
hi def link objReference Special

