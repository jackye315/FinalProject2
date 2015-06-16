# FinalProject2
Jack Ye  Edward Ansour  
Period 9


 In this project, we have created a tower defense game.
To organize tower placement, we have divided the map into a grid of Cell classes using a two dimensional array
to store them.   


 Press the enter key, click on an appropriate tile to build towers. (This can be distuingished as the towers 
can only be built on grey squares) Towers require money to be built, you begin with a certain amount of money, and gain
more by killing monsters.  Another monster wave will spawn only after the previous one ends entirely- either by being
slain by towers, or reaching the final point.



To set the monster path, we used a linked list of classess that represent linear coordinates, and have each
monster traverse thourgh the linked list, changing its position based on the subsequent points. Using 
a linked list to establish the path allows greaty fluidity in the movement system. The creator merely needs to 
design a linked lsit of points, and the monster will always follow it correctly.

For game difficulty, instead of the traditional preprogrammed ramping difficulty seen in many other tower defense games,
in this project we employed a genetic algorithm. We determine fitness by seeing how far the monster was able to travel, 
and roulette wheel selection for or mating. (In this case, it is clear that +health and +speed will result in a better 
monster, but we wanted to use genetic algorithms as a way of gameplay balance.)

A major bug is the shooting method for the towers. The towers don't shoot according, but rather once you create a new tower, the tower shoots once, then stops. Also, a new wave only starts when a monster made it to the end. If not, a new wave does not start and instead the round just keeps increasing. A slight bug most likely related to the shooting, is that the stats info are not correct. There are some slight inaccuracies since sometimes there would be no more monsters in the map, but the MONSTERSLEFT variable would still show like 3 monsters. Also, since the shooting kills a monster when a new tower is created, the money basically stays the same since money is required to build a tower and you get the same amount of money by killing monsters.  A slight bug is also that the fitness method does not work perfectly.
