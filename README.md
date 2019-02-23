# Prolog_Assignment
ABOUT THE INPUT:

Input poem should be given as a list of lists, where each list represents a line. Within a list, words are separated with a comma (“,”). The function “poem" should be called with this input list of lists as a single parameter.

e.g 1: For checking the poem of two lines: 

Sample poem: “Sukhiya sab sansaar hai, khaye or soye.

  Dukhiya daas kabir hai, jaäge or roye."

The input for the above poem should be given as:

poem([[Sukhiya, sab, sansaar, hai, khaye, or, soye] , [Dukhiya, daas, kabir, hai, jaäge, or, roye]]).



Output: “The poem is doha.” given the database considers (hai,hai) and (soye, roye) as the pairs of rhyming words.



e.g2: Sample poem: “best a b c d e f.

          a b c d e f nest.

          nest a b c d e f.

          a b c d e f best.”

Sample input:

poem([[best,a,b,c,d,e,f], [a,b,c,d,e,f,nest], [nest,a,b,c,d,e,f], [a,b,c,d,e,f,best]]).

Output: “The poem is quartet.” given the database considers (best, nest) and (nest, best) as the pairs of rhyming words.

DATABASE:

For now, our database includes the following words as the rhyming words. 

rhyme(nest,best).

rhyme(best,nest).

rhyme(rest,best).

rhyme(best,rest).

rhyme(nest,rest).

rhyme(rest,nest).

rhyme(lest,rest).

rhyme(rest,lest).

More rhyming words can be included dynamically, using assert operation with rhyme/2 as parameter.
