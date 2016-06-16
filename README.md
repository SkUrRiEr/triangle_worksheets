 Mechanical Combination Lock Brute Forcing Worksheets
======================================================

Simple mechanical combination locks have a surprisingly small number of combinations when compared to electronic keypad locks, so brute force attempts are relatively doable.

This repository contains worksheets containing all possible combinations to assist in brute forcing these locks.

These sheets only work for combination locks like the Lockwood DX and CodeLocks CL100 where the mechanism does not care about the order the keys are pressed in. These are usually idenifiable by having two columns of keys which click the first time they are pressed and click back when the "C" key is pressed.

By default these locks have a combination consisting of 5 numbers, however 4 or 6 is also possible. 6 produces the largest possible number of combinations from a 13 key (1-9, 0, X, Y and Z) lock.


 Brute Forcing Tips
--------------------

As the keys are only reset when the lock opens, it's possible to use both 4, 5 and 6 sheets together, trying a combination from the 4 sheet, then each of the combinations which start with that from the 5 sheet.


 Mechanism
-----------

The mechanism works by having a "leaf" for each key which is pushed into the lock when the button is pressed down. These are latched down by a latching bar which is operated by the "C" key. (Opening the handle also operates this bar.)

Each "leaf" consists of the following features:
 - A latching surface
 - A true gate
 - A false gate
 - A separator of full thickness between the true and false gates

The latching surface is a ramp and step which hold the leaf down after it's been pressed.

The true gate is a notch cut out of the leaf.

The false gate is a depression on both sides of the leaf.

The difference between the leaf for a key which is part of the combination and one which isn't is that the true and false gates are swapped. They are also coloured differently (usually paint on the lock end) to help identify them.

A rough diagram:

```
Key end
+--V--+
|     +--+  <-- Latching surface
+-+     /
| |    /    <-- False gate (other side)
+-+   /
|     |     <-- Separator (other side)
+-+   |
  |   |     <-- True gate (other side)
+-+   |
|     |
+-+ +-+
  \_/
Lock end
(there's a spring pushing it up from here)
```

Each key is part of a stack like this:

```
 +---+
_| S |_ <-- key
   S    <-- key spring
+--V--+
.     .
.     . <-- leaf
.     .
+-+ +-+
  \_/
  S S   <-- leaf spring
  S S
======= <-- back plate
```

Turning the handle moves a large slotted plate away from the handle. This plate has the slots arranged so that parts of it try to pass through the true gates of each leaf. The false gates ensure that this slotted plate cannot move if a key which is part of the combination has not been pressed or a key which is not part of the combination has been pressed.

A key is "down" when it's leaf is latched down.

Leaves are different colours depending on whether they're part of the combination or not. If you can remove the lock from the door, press all the buttons down and the combination should be apparent from the colour of the leaves visible through the holes in the back (door side) of the lock. Changing the combination is simply a matter of unscrewing this plate and swapping the leaves between keys.

Note that in the locks listed above, the leaves are arranged so that the latching surface faces the gap between the two columns of keys. The leaves will have a dimple to assist in orienting them.


 Picking
---------

The false gates make these locks surprisingly resistant to manipulation attacks, however it is possible to recover the combination from one.

1. Press the "C" key to clear the combination
2. Turn the handle with as much force as you can manage. Direction doesn't matter
3. Carefully press each key in turn. You're looking for one of the following things:

   1. Key moves down slightly then stops with "normal" or "light" resistance
   2. Key crunches when pressed or has "strong" resistance
   3. Key only has "strong" resistance or crunches the first time it's pressed then moves with "light" resistance after that

4. Note down all keys which have resistance noting the ones which only have resistance once separately
5. Press "C"
6. Press all noted keys
7. Repeat from step 2, marking each round of keys separately, until no more keys crunch or the door opens.

This should produce a list of 4 or 5 keys which are the combination, pressing C then all of these keys should open the lock. If you end up with more keys than this, discard all keys which did not crunch only once and start over from step 6.

If this still doesn't produce a combination, brute force the remaining digits from the keys which crunched every time.

If no keys crunch at all, the combination will have to be brute forced in it's entirety.

"Light" resistance is only pressing against the key spring. Subsequent presses on a key after it's latched down have light resistance.

"Normal" resistance is pressing against the key and leaf springs. All keys except the "C" key which are not latched down have normal resistance. (The "C" key works against at least one extra spring in the latching mechanism)


 How it Works
--------------

This relies on the tolerances not being perfect, i.e. that the slotted plate is less thick than the gates and false gates.

Crunching or "strong" resistance means that the leaf's false gate is rubbing against the slotted plate. (However this isn't always the case.)

Crunching or having "strong" resistance only once means that the leaf's false gate rubs against the slotted plate then gets stuck partially down. This is pretty conclusive proof that the key in question is part of the combination.

"Normal" resistance means that the true gate is aligned with the slotted plate and that pressing down the key is just moving the leaf until the top of the true gate (the separator) runs into the slotted plate.

Crunching or "strong" resistance every time is not conclusive as this can also happen with keys which are set as the tolerances are such that the slotted plate itself can move or the action of the latching plate causes crunching. (I'm not sure which, however locks I've tried to pick have usually ended up with more than 5 potential keys.)
