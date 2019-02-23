%PROLOG Assignment
%database for rhyming words.
rhyme(nest,best).
rhyme(best,nest).
rhyme(rest,best).
rhyme(best,rest).
rhyme(nest,rest).
rhyme(rest,nest).
rhyme(lest,rest).
rhyme(rest,lest).
rhyme(hai,hai).
rhyme(soye,roye).
rhyme(roye,soye).


%function for extracting words at Nth index
extract([Head|_],0,Head) :-
 !.
extract([_|Tail],N,Head) :-
    N > 0, 
    N1 is N-1,
    extract(Tail,N1,Head).


%function to check the length of a given list.
len([],0).
len([_|T],N) :- len(T,K) , N is K+1.

%function to check whether a list Lst is the list obtained by removing last element of list [X|T].
remove_last([X|T], Lst) :-                 
  remove_prev(T, Lst, X). 

remove_prev([], [], _).
remove_prev([X1|T], [X0|Lst], X0) :-  
  remove_prev(T, Lst, X1).    

%checking whether the number of lines of the poem is even.
is_even(0).
is_even(X) :- X > 0, X1 is X - 1, is_odd(X1).


%checking whether the number of lines of the poem is odd.
is_odd(1).
is_odd(X) :- X > 0, X1 is X - 1, is_even(X1).


%checking for "doha" 
%checking for rhyme by extracting 3rd and the 6th indexed word of the two lists.
%checking for the length of the two lists to be 7.
result1(A, X1, X2) :- extract(A,3,X1), extract(A,6,X2).
result2(B, Y1, Y2) :- extract(B,3,Y1), extract(B,6,Y2).
doha(A,B) :- rhyme(X1,Y1),result1(A, X1,X2),result2(B, Y1,Y2), rhyme(X2, Y2),len(A,7),len(B,7).

%checking for "quartet"
%cheking for rhyme by extracting 3rd and the 6th indexed word of the two lists.
%checking for the length of the two lists to be 7.
result_q1(A,X1) :- extract(A,0,X1). %extracts 1st word of the list A in X1.
result_q2(B,Y1) :- extract(B,6,Y1). %extracts last word of the list B in Y1.
result_q3(C,X2) :- extract(C,0,X2). %extracts 1st word of the list C in X2.
result_q4(D,Y2) :- extract(D,6,Y2). %extracts last word of the list D in Y2.
quartet(A,B,C,D) :- rhyme(X1,X2),result_q1(A, X1),result_q2(B, Y1),result_q3(C, X2),result_q4(D, Y2), rhyme(Y1, Y2),len(A,7),len(B,7),len(C,7),len(D,7).


%checking for "haiku"
%haiku_sub2 checks if the head of the passed list rhymes with any other member of the list.
%haiku_sub1 returns false if it finds two rhyming words in the list.
%haiku calls haiku_sub1 if the length of the list(poem) is 7.
haiku_sub2(H,T) :- rhyme(H,Y), member(Y,T).
haiku_sub1([]).
haiku_sub1([H|T]) :-not(haiku_sub2(H,T)), haiku_sub1(T).
haiku(X):- len(X,7),haiku_sub1(X).

%checking for "fusion sonnet".
%calls fusion1 if the number of lines in the poem is even.
%calls fusion2 if the number of lines in the poem is odd.
fusion(List) :- fusion1(List),len(List,Length),is_even(Length).
fusion(List) :- fusion2(List),len(List,Length),is_odd(Length).

%checking for "fusion sonnet" if the number of lines is even.
%fusion1(List) returns true if the list can be broken down to doha and quartets.
fusion1a([], []).
fusion1a([H5|[H6|[]]],[H5|[H6|[]]]) :- doha(H5,H6).
fusion1a([H1|[H2|[H3|[H4|Tail1]]]], [H5|[H6|Tail2]]) :- (   doha(H5,H6) , fusion1a(Tail2,Tail2))   ;  (  quartet(H1,H2,H3,H4), fusion1a(Tail1,Tail1) ).
fusion1(List) :- fusion1a(List,List).

%checking for "fusion" if the number of lines is odd.
%fusion2 returns true if the last line is haiku and the rest of the lines can be broken down to doha and quartets.
fusion2(List) :- remove_last(List,List1),fusion1(List1),len(List,N),extract(List,N-1,L),haiku(L).

%checks whether the given input is doha, quartet, haiku, fusion sonnet or unknown and print the result.
poem([H|[T]]):- doha(H,T),len([H|[T]],2),writeln("Poem is Doha").
poem([H1|[H2|[H3|[H4]]]]) :- quartet(H1,H2,H3,H4),writeln("Poem is Quartet").
poem(H) :- haiku(H),writeln("Poem is haiku").
poem(List) :- fusion(List),writeln("Poem is fusion sonnet").
poem([_|_]):- writeln("UNKNOWN").