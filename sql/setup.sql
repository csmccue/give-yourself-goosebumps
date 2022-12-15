DROP TABLE IF EXISTS users CASCADE;
DROP TABLE IF EXISTS books CASCADE;
DROP TABLE IF EXISTS pages CASCADE;
DROP TABLE IF EXISTS users CASCADE;
DROP TABLE IF EXISTS books CASCADE;
DROP TABLE IF EXISTS options CASCADE;
DROP TABLE IF EXISTS paths CASCADE;


CREATE TABLE books (
  id BIGINT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
  title VARCHAR
);

CREATE TABLE pages (
  id BIGINT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
  book_id BIGINT,
  page_number BIGINT,
  page_text VARCHAR,
  is_first BOOLEAN DEFAULT FALSE,
  FOREIGN KEY (book_id) REFERENCES books(id)
);

CREATE TABLE users (
  id BIGINT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
  email VARCHAR,
  password_hash VARCHAR NOT NULL,
  first_name VARCHAR,
  last_name VARCHAR,
  current_page BIGINT DEFAULT 1,
  FOREIGN KEY (current_page) REFERENCES pages(id)
);

CREATE TABLE paths (
  id BIGINT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
  user_id BIGINT,
  source_id BIGINT,
  target_id BIGINT,
  FOREIGN KEY (user_id) REFERENCES users(id),
  FOREIGN KEY (source_id) REFERENCES pages(id),
  FOREIGN KEY (target_id) REFERENCES pages(id)
);


CREATE TABLE options (
  id BIGINT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
  page_id BIGINT,
  target_page BIGINT,
  option_text VARCHAR,
  FOREIGN KEY (page_id) REFERENCES pages(id),
  FOREIGN KEY (target_page) REFERENCES pages(id)
);

INSERT INTO books (
  title
)
VALUES
('Escape from the Carnival of Horrors'),
('Beware of the Purple Peanut Butter');

INSERT INTO pages (
  book_id,
  page_number,
  page_text,
  is_first
)
VALUES
('1','1', '"What do you want to do?”
“I don’t know, Patty. What do you want to do?”
“Not fair, Brad. I asked you first.”
Patty and Brad. Your two best friends. Arguing. As usual.
It’s the last week of August. And Patty and Brad haven’t stopped fighting since your summer vacation started.
Patty likes being bossy. You don’t mind, though. It’s no big deal.
It’s hard to win a fight with her anyway. You don’t know why Brad even tries. You guess it’s because he doesn’t want to look like a wimp in front of a girl.
“There’s nothing to do. I guess I’ll just go home,” Brad says. He shoves his hands in his pockets. Then his shoulders slump and he sort of shrivels up. You guess Brad is kind of a wimp — even if he is your best friend.
“You’re so boring, Brad,” Patty complains. Whenever Patty complains, her freckles really pop out. Now there are about a million of them spread across her face.
“Hey! I know what we should do!” Patty suddenly bursts out.', TRUE);

INSERT INTO pages (
  book_id,
  page_number,
  page_text
)
VALUES
('1', '2', '“Let’s bike over to Bennet’s Field and watch them set up the carnival!”
“I don’t know,” you answer. “It’s getting dark, and Mom said I have to be in by nine.”
“It’s only a quick bike ride,” Brad says. “Are you some kind of wimp?”
Brad calling you a wimp? You can’t believe it!
“Okay. Okay,” you agree. “But if it’s as bad as last year, there won’t be much to see. Don’t you remember the main attraction?” you remind them. “The ride they called Terror Track? It turned out to be a baby choo-choo train that circled around and around and around.”
It doesn’t matter what you say. Patty’s made up her mind. You’re going to ride over to the carnival.
A hot, humid breeze blows in your face as you pedal along. Patty’s in the lead. No surprise. And Brad’s puffing behind you.
It’s dark by the time you reach Bennet’s Field.
You and your friends drop your bikes in the grass and race across the moonlit field, toward the huge wooden fence that surrounds the carnival.'),
('1', '3','As you reach the carnival entrance, you hear music coming from inside. Not the usual corny organ stuff they always play. But some really strange music. It sounds familiar and totally new at the same time.
Brad stretches his neck to try to peer over the fence. But no luck. The fence is way too high.
Patty jiggles the padlock on the gate. It’s sealed shut.
“I guess we’ll have to wait until tomorrow night when the carnival opens,” Brad says.
“No way,” Patty says. “Let’s climb the fence. Now!”
“Are you crazy?” Brad says. “We’ll get caught!”
“Come on. There’s probably no one in there,” Patty replies.
Your friends turn to you to cast the deciding vote. You glance at your watch. It’s almost 9:00 p.m. If you’re going to get home in time, you should start back now.
What are you going to do?'),
('1', '4','“Wh-what do you mean?” Brad asks, trembling all over.
“I just had an idea. A great idea,” the man replies. “I want you kids to stay and try out the rides before the grand opening tomorrow.”
Patty’s eyes open wide. “Cool!” she says.
“Are you sure it’s all right with the owner?” you ask.
“I’m Big Al, the manager. And what I say around here goes.”
Big Al digs around in his checkered jacket and pulls out three maps. He hands one to each of you.
“Study them carefully,” he says. “If you have any questions, ask them now.”
Your eyes fall upon the map. You have a question. But when you gaze up, Big Al is gone. He’s vanished!
“A whole carnival to ourselves!” Patty exclaims. “Where should we start?”
You stare down at your map once again. You notice that the carnival is split in half. On one side are the rides. Tons of them. On the other side is the midway, packed with games of chance and the Freak Show.
What will you try first?'),
('1', '5','“Come on, run!” you yell to Patty and Brad as you spin around. “There’s got to be another way out!”
Big A1 blows a whistle. Its shrill blast hurts your ears. He blows it again and, suddenly, dozens and dozens of carnival people appear out of nowhere. But they don’t look the way they did before.
Some have green flesh. Some are deathly white. Their rotting skin hangs from their bones. Above their sunken cheekbones, their eyes glow an eerie yellow.
You watch in horror as more and more of them appear.
What should you do? Your legs won’t budge. You can’t think clearly. You’re terrified! You stand there — frozen — in a trance.
But Brad breaks the spell when he screams out, “They’re ghosts! That’s why they’re wearing those old-fashioned clothes. They’re dead!”
“Watch out! Over there!” Patty yells. “That — that ghost... It’s coming right at us. Run!”'),
('1','6','“Let’s do it!” you say to your friends. “Let’s climb the fence!”
Patty is halfway up before you finish speaking. You let Brad go next. You’re last.
It’s a hard climb up. There’s really no place on the fence to get a good grip. But you make it to the top, swing your legs over, and tumble down. You land on the grass. You’re inside!
You and your friends gaze around. It’s pretty dark — the only light comes from torches. At first the carnival looks the same as it always does. Dinky rides. Hot dog wagons. Then the lights start to flicker on in every corner of the field — the rides start to move. It’s as if the whole place is magically coming to life.
“Hey! Look at that giant roller coaster!” you exclaim, pointing up ahead. “They never had a roller coaster before!”
“Yeah,” Brad agrees. “And the whole place is a lot bigger than last year!”
“This is awesome!” Patty says as she sprints toward the rides.'),
('1','7','You and Brad take off after Patty. You all stop in front of the roller coaster.
“Wow!” Patty says as she gazes up at it. “It’s like a rocket to outer space!”
Beyond the roller coaster, you spy a castle surrounded by a moat. And a spooky-looking haunted house sitting high atop a hill.
“These are the coolest rides I’ve ever seen!” you say. “They still have that dumb choo-choo train over there,” you point out, “but we could ride this stuff all night and never go near it!”
Patty grabs your arm and tugs you over to the other side of the carnival — to the midway. Brad races after you.
“Hey! Where are all those dinky wooden booths from last year?” you ask as you gawk at the amazing games of chance.
They’re gone. And in their place are giant video games and huge spinning wheels studded with hundreds of blinking colored lights!
“Get a load of that!” Brad suddenly cries out.
You and Patty spin around.
You can’t believe what you see!'),
('1','8','You wander over to the Wheel of Chance and immediately notice two strange things.
First, you read the sign on the booth. It says “Wheel of No Chance.” Then you hear the barker’s voice calling, “Step right up!” But there’s no one there.
No one but a green-and-yellow parrot.
“Excuse me,” you say, hoping someone will answer. “Is this game open?”
“No, I’m standing by this wheel for my health,” the parrot cracks. “Now, do you want to spin or what?”
The parrot is obviously annoyed. “Mammals,” he mutters. “Can’t live with them, can’t live without them.”
You steal a glance around. Maybe you should skip this game. But Big A1 sneaks up behind you.
“Spin,” he says. “You must earn enough points to win.”
“But how will I know if I have enough points?” you ask.
“Spin!” It’s his final word.'),
('1','9','Here’s how to spin:
Close your eyes and twirl your finger over the wheel on this page. Then let your finger land somewhere on the wheel. 
Look at the number you’ve landed on. Go to that page next. If you landed on SPIN AGAIN, spin again.'),
('1','10','You’ve decided not to sneak into the carnival? You’re going home instead? Well, it’s a good thing Patty usually makes all the decisions. Otherwise, you’d never have any fun! And this book would be over before it began!
Go ahead. Take a deep breath. Then go climb the fence. You’re not scared — are you?'),
('1','11', 'You’ve decided to help the freaks. As you race down the midway, you spot Brad and Patty.
“Listen, guys,” you tell them, lowering your voice. “We’ve got a problem. A big problem.”
You take a deep breath and tell them all about Madame Zeno and the blue card.
“So,” you finish saying, “somebody might need our help in the back of the Freak Show.”
“What’s a freak?” Brad asks nervously.
“Remember the poster we saw when we came in? The one with the three¬ headed man and the lady with the snake body?” you remind him.
Brad bites down on his lip. “Are they really real?”
“Sure they’re real,” Patty chimes in. “I once saw a bearded lady at the circus.”
“I don’t know,” Brad says. “It sounds kind of creepy.”
“Well, Madame Zeno said this was my fate. I’m going to help them — whatever they are. Are you guys in?”
“You bet,” Patty answers, her eyes shining with excitement.
“Okay, okay. I’ll go,” Brad mumbles.
“Then let’s hurry!” you exclaim.'),
('1','12','You run to the right. “Follow me!” you cry out to Patty and Brad.
You run faster than you’ve ever run in your life. Your sides ache, but you keep on going.
When your chest feels as if it’s about to burst, you finally stop. And hear a crash behind you. Then at both sides of you. Then in front of you. Trapping you.
“Welcome to the Reptile’s Petting Zoo,” a deep voice echoes through the darkness.
Reptile’s Petting Zoo? You thought the sign said Reptile Petting Zoo.
“Our alligator has been so lonely,” the deep voice continues. “Waiting and waiting — for his new pets to arrive. And here you are — finally.”'),
('1','13','The room is dark, but all around you, you hear hushed moans. “Help us! Help us!”
“We’re in a prison,” Patty says. “And look at the prisoners! They’re weird!”
Patty is right. As your eyes grow accustomed to the darkness, you see cell after cell. Each one holds a strange-looking prisoner. There’s an enormous fat lady who’s nearly busting out of the bars. A giant. A dwarf. A young lady with boa constrictors wrapped around her waist. And a woman with a long black beard!
“We’re the freakssss,” the Snake Lady says. “Every night when the sssshow endssss, the masssster lockssss ussss up.”
“The master? You mean Big A1 is —” you start to say.
“You must help us!” the giant interrupts.
“Sssssssh,” the Snake Lady says. “The master’sssss coming — you musssstn’t be here! Go! That way!” She points to a door down the hall.'),
('1','14','You reach out slowly and touch the red card.
To your amazement, a 3-D heart magically appears and rises from the flat surface. Then it starts to beat! Tha-dump, tha-dump. It must be some fancy optical illusion. You lean closer to figure out the trick.
“Yowwwww!” you screech and jerk back to avoid the warm red liquid that nearly squirts in your eye. Is it blood? It looks like blood. “Wow! Cool effect,” you say. “How did you do it?”
“Turn over the card,” Madame Zeno orders. “Do it now!”
Madame Zeno really gets into her act. Doesn’t she know this is just a game? you think. But you do as you’re told.
Big deal. No weird pictures. No hidden fortunes. All you see are the numbers 1,3,2 shimmering in gold script against a midnight background. “What does it mean?” you ask.
“You will know when the time is right,” the fortune-teller whispers. Her voice is so low, you can barely hear her. “It could save your life!”'),
('1','15','Round and round the wheel spins. It finally lands on number 15. no
CHANCE.
No chance. Does that mean what you think it means?
No chance at all.
Zip.
Zero.
Nothing.
Nada.
Negatory.
Yes. That’s exactly what it means. You have met...'),
('1','16','“Hi!” you say to Big Al. “Who are all those people?”
He doesn’t really answer your question.
“Welcome to the Carnival of Horrors,” he says. “You must play or pay. We have many games on our midway. You must play two.” He practically spits the word must out. “If you succeed, you can win prizes. But if you lose, you pay with your life!”
Boy, he’s really laying it on thick, you think. But it’s a pretty cool gimmick. “Okay, I’ll play a game. Then I’ve got to go home.”
“No one goes home,” Big Al says, “until they play. You must play two games. And survive.”
“Okay. Okay,” you mutter to yourself.
You glance around the midway at the two closest games. Guess Your Weight on Mars and the Wheel of Chance. You have to pick one to start, or you’ll never get out of here.'),
('1','17','You take a few steps along the midway hoping you’ve won enough prizes and points. You notice the crowd of people surrounding Big Al. They’re still chanting, “PAY OR PLAY PAY OR PLAY”
You break through the crowd and grab Big Al’s arm. “Hey! Do you know where my friends are?”
“Certainly,” Big Al says, pointing up ahead. “They’re right over there!”
“Patty! Brad!” you shout as you rush up to them. “Come on! We’ve got to go! This carnival is evil!”
But before they can say a word, Big Al’s voice booms from behind you. “Not before The Final Challenge!”'),
('1','18','The space lady slowly circles you as she sizes you up from head to toe. “Hmmmm, I think you weigh thirty-eight pounds.”
“Thirty-eightpounds! Boy, are you wrong!”
“I’m never wrong,” she says, smirking. She snaps her fingers and two enormous guards appear. They each take one of your arms and drag you out of the courtyard.
“I don’t weigh thirty-eight pounds!” you yell. But then you remember. It isn’t your weight on Earth that matters. It’s your weight on Mars.
Do you weigh thirty-eight pounds on Mars? You’d better find out quickly, because something tells you that what Big A1 said about having to survive might be true.'),
('1','19','You land on number 19.
“Double or nothing. Double or nothing,” two voices behind you echo.
You whirl around — and gasp! It’s a man with two heads.
“Congratulations. You win ten points,” one head says to you. “Quit while you’re ahead!”
“Ahead, get it? Ahead!” the other head adds, laughing hysterically.
“Shut up,” head number one says.
“You shut up,” head number two shoots back. “Ten points is nothing. You better spin again. And this time it’s double or nothing. You get double the points wherever you land.”
Which head should you listen to?'),
('1','20','It seems as if hours have passed. Or maybe it’s only minutes.
You try to unclasp your hands. But they won’t budge. It’s as if your arms are glued around your knees.
You try to move something. Anything.
But you can’t blink an eyelid. Your body is paralyzed. You can’t even scream.
A door opens and two men dressed in overalls and wearing gas masks amble in. Finally. They’re here to rescue you!
“Looks like the perfume worked,” you hear one of them say.
“Yeah. And just in time. We needed a new dummy for the Real-Life Space Display,” the other adds.
They pick up your rigid body and carry you out. No wonder those astronauts in the silver tunnel looked so real!
Sorry. You can’t scream. You can’t escape.
Next time, you promise yourself, you’ll stick with the baby rides. But then you remember — there isn’t going to be a next time ... because this is ...'),
('1','21','You’re outside — standing in Bennet’s Field — gazing at the fence that surrounds the carnival.
“I guess we’ll have to wait until tomorrow night when the carnival opens,” Brad says.
“No way,” Patty says. “Let’s climb the fence.”
What’s going on here?
You guessed it. The silver locker was a time machine. You’ve gone back in time to the first moment you spotted the carnival. Now it appears as if you have to start all over again — fighting horror after horror, right up to ...'),
('1','22','You’re pretty sure that the space lady guessed wrong! Now all you have to do is step on the scale to prove it.
The two goons shove you inside the planet simulation chamber. It’s a long narrow tube, and it’s really stuffy inside. You can barely breathe.
You step up on the scale. You check the readout. Boy, oh, boy! The space lady is wrong!
You jump up and down. “I won! I won!”
Back outside you collect your prize. It’s a huge chocolate bar. You take a big bite out of it and stuff the rest in your pocket.
You gaze around. The coast is clear. Maybe you can find Patty and Brad and get out of here.
You walk a few steps forward. But a heavy hand clamps down on your shoulder from behind.
It’s Big Al.
“It’s time to play another game,” he says, grinning.'),
('1','23','You yank on the reins. But your horse plows ahead, pulling you forward — closer and closer to the chopping, chopping, chopping blades. Brad squinches down in the cart and buries his head in his lap.
Patty jumps into the front seat with you. Together you pull on the reins and scream, “Whoa, fellow! Whoa!”
But your horse trots onward. “It’s no use,” you cry. “We’d better jump!”
You stare over the side. You’re riding along a narrow ridge and there’s a deep drop that makes your blood run cold! If you jump, you’ll plunge to your death!
Then you glance up ahead — and spot a safer place to leap. Great!
You are about to show it to your friends when Brad cries out, “Look at the elves! They chop at set times. If we can get the horse to move faster, we can miss the axes!”
“That’s dumb, we should jump!” argues Patty.
What do you think you should do?'),
('1','24','Carnival workers. The carnival workers who set up the same rinky-dink carnival you go to every summer.
You can’t believe your eyes. You must be seeing things!
Patty tries to say something smart, but the only thing she manages is “Huh?”
“Hey, kids!” a worker yells at you. “Get away from that ride. The carnival doesn’t start till tomorrow night.”
You gaze around in wonder at the faded games, the baby rides, the tacky food stands. For the first time in your life, it all looks great!
“We’ll be there!” you shout as you head for your bikes. “This is the greatest carnival I’ve ever seen!”'),

('1','25','Seconds later your head and the back of your feet slam into the wall. You’re hanging upside down — in the middle of a gigantic magnetic wheel!
“Are you ready for The Final Challenge?” Big A1 asks.
“Of course not!” you say. “LET ME DOWN!”
“We’ll let you down — but not until you face The Final Challenge. One spin will decide your fate. If you win, you go. If you lose, you stay here forever.”
Will that be your fate?
Big A1 approaches the wheel.
Brad and Patty are holding on to each other.
Your heart is pounding.
Your hands are sweating.
This is it. One spin.
He gives the wheel — with you on it — a hard turn. Where will it stop? Guess!'),
('1','26','“Hey, wait up!” you yell to Brad and Patty as you sprint through the Space Coaster gate.
They both ignore you and charge straight ahead. You follow them into a narrow tunnel that leads to the boarding area.
You gaze down at the floor. Black rubber. It makes you walk with a strange bounce.
Every few feet there is a round porthole window. When you glance out one, you see astronauts planting flags on the moon. You peer out another. Now they’re seated in their capsule. This is amazing, you think. The figures look real. Totally real.
After a long climb, you and Patty and Brad finally arrive at the loading area.
A sleek bullet-shaped capsule whooshes up and stops right beside you. It has three sections. Brad climbs defiantly into the last section. You leap into the front. Patty’s left with the middle section.
And suddenly you’re trapped!'),
('1','27','The crowd is closing in. Your pockets are empty — you have nothing to defend yourself with. So you run!
You spot a crack in the wall, next to the wheel. It’s small — too small for an adult to squeeze through — but you can probably make it.
“Follow me!” you yell out to Patty and Brad as you squeeze through the opening. It leads to a backstage area — and then to the flap of another tent.
You can hear the crowd behind you, trying to follow you through the crack.
“Come on! We can slip under this tent,” you say. For once, no one argues with you.
The three of you duck in and find yourself surrounded by another crowd. They are all seated in chairs. And they don’t move. They just stare at you with glassy eyes.'),
('1','28','What’s the big idea? You’re going to embarrass the giant into helping you.
“Hey, you. You know, you’re a real wimp,” you say to the giant.
He looks at you as if he can’t believe what he hears.
Patty and Brad look at you as if you’re crazy.
Maybe you are.
“You wimp,” you continue. “You sit here all day, taking orders from that creep, Big Al. And you live in these horrible conditions. Why? Because you’re a wimp and you refuse to fight back. You could bend those bars and escape — but you won’t. Because you are a wimp — W-I-M-P — wimp.”
The giant stands. You gaze up. He’s over fifteen feet tall. He lumbers over to you. He isn’t smiling.
Is your plan going to work? Is he going to bend the bars to prove you wrong? Or is he going to bend you?
It’s out of your control now.
Look out the window.'),
('1','29','You stumble down the corridor to your right. As you peer from side to side, you are met with hundreds of images of — you! And you look pretty baffled. And scared.
“Hey, I could use some help,” you call out.
Silence.
You pound your fist against the wall.
The wall starts to move.
Just an inch or two — an inch or two closer to you!
You take a step back — but the wall behind you is moving, too.
The walls are moving together. They’re closing in on you.
You’re going to be crushed!'),
('1','30','You’re falling ... falling ... You can’t think of anything else to do, so you start flapping your arms like a bird.
At that moment a huge gust of air shoots up from under you and blows you back onto the bridge.
Breathing hard, you run the rest of the way across the rickety span. When you reach the safety of the other side, you glance back. And gasp! The bridge and the midway beyond it have vanished! Only a black void remains!
“Wow! Awesome special effects!” you cry out loud. But was your fall part of the special effects, too? It didn’t feel like it.
You spin around to face the House of Horrors. Up close it appears really, really creepy. Cobwebs drip down from its roof and an eerie yellow light glows inside. Cool! Next to the house you spot a sign that reads boat trip to nowhere. There are amazing speedboats that you can drive yourself.
Which should you try first?'),
('1','31','You snap your head around to the right — where you hear footsteps coming toward you.
You are facing a short man with wrinkly skin and bloodshot eyes. His bushy black hair resembles a scouring pad — and from the looks of it, it probably feels like one, too. His evil expression makes you cringe.
But he’s nothing compared to the “things” in back of him — two seven- foot-tall monsters. One has blue horns and bulging red eyes. The other has scaly skin and an alligator snout that snaps open and closed as he eyes you.
The trio all wear lab coats. And from the eager way they’re looking at you, you realize that you are the lab rat.
You struggle to escape from the net. But you’re trapped in the webbing. Like a fly in a spider’s web.
“Welcome to my humble laboratory,” the short man says. “I am Dr. Frank N. Stone, the mastermind who created the Carnival of Horrors.”
The Carnival of Horrors! You don’t like the sound of that!'),
('1','32','Your boat glides through the channel at high speed to Booger Bog. Water sprays up into your face. But soon you have to slow down. Trees have suddenly sprung up all around you. You’re completely surrounded now by their towering trunks.
In the dark light, their limbs take on the shape of gnarled arms with blackened, bony fingers at the ends. You stare hard at the tree trunks. Could it be? Are they reaching out for you?
You slowly weave the boat through the twisted trunks and branches. They’ve grown so thick here that you can barely pilot your boat through them.
The trees rustle as if they’re whispering to each other. Their limbs begin to sway. As you glide carefully through the water, the leaves slap against your face. Slap. Slap. Slap.
Your heart starts hammering away in your chest. This is really scary. Just how far is nowhere? you begin to wonder. Something swipes at your hair! What was that?'),
('1','33','You glance once more at the dwarf. He lets out an evil cackle. That’s it — there’s no way you can trust him. Besides, you can hear music up ahead. You’re sure you must be near an exit.
“No, thanks. I don’t need any help,” you mumble.
He shrugs. “Oh, yes, you do,” he says. But then he sprints off.
You walk in the direction of the music. But after five minutes, you realize that you’re not getting anywhere.
Maybe you should have followed the dwarf. You start to think about Patty and Brad. Are they okay? you wonder.
Just when you think you’ll be wandering these tunnels for the rest of your life, the passageway ends! Now you’re facing two doors — one red and one blue. Which one should you try? You might as well flip a coin!
Get a coin. Flip it and check whether it comes up heads or tails.'),
('1','34','“Let’s go on the rides first!” you say. “That roller coaster looked awesome!”
“Okay,” Patty agrees. “Over this way!” she yells as she charges over to it.
When you reach the rides, you can only stare in amazement. These are the most fantastic rides you’ve ever seen. The towering roller coaster ... the soaring speedboats ... the twisty slides! Every one is in motion. Whizzing, whirling, doing loop-the-loops. And they’re all empty! No riders. No people in line!
“Cool!” Patty exclaims. “We have the whole place to ourselves.”
Brad’s face turns a little green as his gaze swings from the Supersonic Space Coaster to the Doom Slide. “Do you think they have rides that don’t go upside down?” he asks.
“Come on! Let’s check out the coaster!” Patty calls to you and Brad. Then they run off to its starting gate.
You stop and crane your neck to gaze up at the coaster’s first hill. And you gasp!'),
('1','35','Five minutes later, the three of you are sneaking down a dark alley. Brad is so frightened, he’s practically walking on top of you.
The alley is littered with large cardboard boxes and overflowing trash cans. And it smells like dead fish.
“Hey! Quit stepping on my shoe,” you say to Brad.
“I’m not stepping on your shoe,” he shoots back. “I’m not anywhere near your stupid shoe.”
You glance down. And nearly scream.
Brad’s right. He’s not stepping on you. But about a dozen rats are.
You shake your foot wildly. The rats scurry off.
Brad catches sight of the rats and tries to bolt.
You and Patty quickly pull him back.
“Hey! Look!” Patty says, pointing up ahead. “A door!”
On the door you see a big sign that reads keep out, so ... you go in.'),
('1','36','You turn back and head in the other direction. Your reflections bounce off the walls at crazy angles. Are you walking straight, or have you rounded a corner? There’s no way to tell. Yet this time you’re sure you’re going the right way!
“Over here!” a voice calls. “Turn left again!”
Turn left again ? Now you are really confused.
If you turn left again, will you finally escape?'),
('1','37','You cover your head with your hands and try to run into a thick grove of trees. But the bat circles in front of you and dives again.
“Stop it! Stop it!” you scream.
As you turn and race toward some low bushes, you remember the stories — the horrible stories about bats making nests in people’s hair. And the only way to get them out was to shave your head....
Those stories weren’t true — were they?
You spot a big stick in the wet dirt and scoop it up.
The bat swoops down at you once more and — FWAP! You hit it.
The bat falls to the ground.
And you see it’s on a wire.
It’s a mechanical bat.
All part of the ride, you think. You think about the boat ride. Boy, they really make things seem real at this carnival, you think. You feel much better when you gaze up ahead. There’s a clearing.
But when you see what’s there — you scream!'),
('1','38','“Got a winner, got a winner,” the parrot squawks. “You’ve won twenty- five points, plus anything you want in the prize room. Step this way.”
Eagerly, you follow the bird into a storeroom behind the booth. It’s packed with the weirdest assortment of junk you’ve ever seen. Dusty old catalogs, stuffed rats, a collection of axes, and portraits of headless people holding their own heads!
“So pick something. It’s getting late,” the parrot says.
Not this garbage, you think. Then you spot a shelf of small cans with bright labels: play and glow, clay slime, and monster blood. Monster Blood? Hey, isn’t that the magic stuff you read about in GOOSEBUMPS?
“I’ll take the Monster Blood,” you decide.
“Excellent choice,” the parrot remarks.
As you quickly leave the room with your prize, you wonder, is twenty- five points enough? What do you do next?'),
('1','39','You close your eyes. When you open them, your car lunges forward with a burst of speed — and you loop-the-loop. Your mouth drops open to scream, but no sound comes out.
Now your car starts to plunge downward — like an elevator out of control. Your heart pounds in your chest. This is the fastest and best roller coaster you’ve ever been on! As you near the bottom, you slow down. You begin to catch your breath. And then you see what’s up ahead. A huge black hole — a tunnel!
As you shoot toward the open mouth of the tunnel, you begin to scream again. The door of the tunnel is about to close!
Snap! The door comes crashing down — behind your car. You breathe out a long sigh. But now you’re in a tunnel so dark that you can’t see a thing.
Scary! But not nearly as scary as what happens next.'),
('1','40','“Five, four, three, two, one. We have liftoff,” a mechanical voice announces.
To your horror, the rocket blasts off! You’re slammed against the side of the capsule with hurricane force. Seconds later, you’ve left Earth’s atmosphere.
A recorded message comes on: “Congratulations. You are the perfect weight for our Mars explorer. We’ll be monitoring your trip and will bring you back in approximately twenty years — with a plus or minus ten-year margin of error in case something goes wrong. But do not worry. Nothing can go wrong ... go wrong ... go wrong.”'),
('1','41','“What do you mean the magic number could save my life?” you ask Madame Zeno. But the fortune-teller doesn’t answer. She stares off into space. She seems to have fallen into a deep trance.
You don’t really believe her — these fortune-tellers are all fakes, but you memorize the number anyway. 1-3-2,1-3-2.1 picked red instead of blue, you chant to help you remember.
Madame Zeno puts the card back in the deck. She closes her eyes and waves you away with her jeweled hand.
You guess the fortune-telling is over, so you leave the tent to search for Patty and Brad.
You squint under the bright lights of the midway, scanning all the game booths. But you can’t find them.
You’re trying to figure out which way to go when you spot Big A1 coming toward you. He’s not alone. He’s leading a large group of people. As they come closer, you hear that they are chanting something. What is it?
“PLAY OR PAY. PLAY OR PAY.”
What does that mean?'),
('1','42','A wave of panic washes over you as the walls crumble around you. You throw your arms over your head and close your eyes.
Then silence. The shaking stops.
When you open your eyes, the room and all the costumed people have vanished. And you are outside — in the rides area! But the biggest surprise of all is that you spot Patty and Brad!
“Boy, am I glad to see you,” you say, racing over to them. “Where have you guys been?”
Brad shakes his head. “You wouldn’t believe the rides we were on!”
“We’ve got to get out of here before midnight,” you say. Quickly, you tell your friends about the warning from the lady with the red parasol.
“No problem,” Patty says. “Look. I’m sure the exit is right over there past that ride called the Hall of the Mountain King.”
“No, it’s that way — near the sign that says ‘Halloween Express,’ ” Brad insists.'),
('1','43','You are about to scream. It seems like the only sensible thing to do. And then you remember the sign.
Reptile Petting Zoo.
You have an idea. It’s a crazy idea, you know. But everything in this carnival is crazy.
You can feel the alligator’s hot breath on your arm. But instead of pulling your arm back, you stretch it out!
“What are you doing?” Patty screams.
Your fingers reach out. Out over the alligator’s open snout to the top of his head.
And you pet him.
“Nice alligator,” you purr as you stroke his scaly head.
Your arm trembles, but you don’t stop. And slowly — very slowly — the creature’s mouth begins to shut.
Then he rolls over and falls asleep!
You slip quietly off the log, charge for the shore — and plow right into Big Al!
“Well, well, well. Look who we have here,” Big Al sings out. “Come with me. It’s time for The Final Challenge.”'),
('1','44','You’re spinning round and round. Everything is a blur. You can’t see, but you hear the crowd chanting, “FI-NAL! FI-NAL! FI-NAF!”
And then the wheel stops.
A huge gasp escapes from the audience.
Did you win or lose?
Neither. You stopped on spin again.'),
('1','45','The giant looms over you. He’s as tall as the tree outside your house — and a lot meaner. His huge lips part and he says, “You hurt my feelings.”
Then he begins to cry.
“I am not a wimp. I am not,” he says between huge sobs.
He sure looks like a wimp.'),
('1','46','You’re falling ... falling ... everything passes as if you’re dropping in slow motion. Is this ...
THE END ? Yes.'),
('1','47','The tracks stretch up so high that they seem to touch the clouds. Your gaze follows one of the cars speeding around a sharp curve. It looks like the space shuttle. You notice that it has a safety harness that locks over your body — you’ve seen those before. They keep you in when the ride turns upside down. You didn’t want to admit it before, but, like Brad, riding upside down is not your favorite thing.
Still, the coaster does look amazing — one part enters a tunnel — and you can see that the cars go fast. Really Fast!
You’re just about to walk through the Space Coaster gate when you hear spooky organ music coming from behind you. You turn around. Looming in the distance is a dark and creepy haunted house.
You gaze down at your map. It’s called the House of Horrors. Hmmm.
You love haunted houses. And this one really looks scary.
Now you’re not sure what to do. You won’t have time for everything. The coaster or the haunted house? Decide now.'),
('1','48','“Come on!” Patty cries. “Come on!”
Then, without another word, she races off. You and Brad dash after her.
I hope Patty knows what she’s doing, you think as you try to catch up. Because right now, it doesn’t look that way.
Patty leads you through a maze of underground passageways. Then, just as you’re about to yell, “Stop!” — she does. And you find yourself standing outside, in front of a barbed-wire fence!
Up ahead, you spot an opening.
“Let’s go in!” Patty says.
The three of you creep through the fence and trudge through some tall, wet grass. You gaze around. It’s way too dark to see.
But you can hear perfectly. And the sounds that reach your ears make your skin crawl.
Slithering. You definitely hear slithering.
And hissing.
You want to leave. You spin around, but you can’t find the opening in the fence! You do see something else. A sign!'),
('1','49','The wheel stops on free spin. You are ready to try again. But the dumb parrot flies over and latches onto your shoulder.
“Ouch! That hurts,” you cry.
“Free spin, free spin, you’re going on a free spin.”
“Turn me loose,” you command. When you swivel your head to glare at the bird, a scream freezes in your throat. The parrot has ballooned into an enormous vulture. His black, beady eyes pierce right through you. He digs his razor-sharp claws deeper into your shoulder.
Run! — your every survival instinct shouts. But the bird of prey has other ideas. One of them is dinner — with you as the main course.
The big bird snatches you by the back of your shirt as if you were a rag doll. Kicking and screaming and using every defensive move you learned from karate class, you struggle for your life. But it’s no use. With a jerk he lifts you off the ground.
And suddenly you have a frightening view of the carnival from twenty feet... thirty feet ... fifty feet up.'),
('1','50','Thummp, thump, thump. Your heart bangs loudly inside your chest. What kind of carnival is this, you wonder, where a free spin is more like a death sentence?
You circle a green clump of treetops. You’re really dizzy now. You want to close your eyes. But you know it’s not a good idea — since you’re flying fifty feet high without a plane or a parachute.
As you circle closer to the treetops, you are met with a horrifying view. Five baby vultures in a nest, five very hungry babies, with mouths gaping wide open.
The end is near. You are going to wind up as a take-home dinner. Unless you can somehow force the vulture to let you go. Frantically, you reach into your pockets!'),
('1','51','You can’t take on both monsters, so you decide to wait until one of them leaves the room.
You grab hold of Dr. Stone’s hand. He’s a lot stronger than he looks. With one small tug, he pulls you free of the web.
Then he turns to the monsters. “Okay,” he barks. “Adjust the net. It’s time to practice spiking.”
Spiking? What does he mean by that?
The monsters leap up. They rub their hands together in evil delight. Then they untie the net and head to the back of the room, where two huge poles rest on the floor.
You close your eyes — and hope that when you open them, you’ll see that this was all a dream. A really bad dream.
But when you open your eyes, you know it’s not a dream. No — it’s a volleyball game. The net has been tied to the poles — and guess what position you play? That’s right. You’re the ball! Watch out for those two-handed spikes! They can be pretty painful!'),
('1','52','Just as the clock strikes twelve, the train enters a tunnel.
You hold your breath, wondering what you’ll see when you reach the other end.
Chug. Chug. Chug.
The choo-choo slowly pulls out of the tunnel — and you are surrounded by carnival workers — everywhere!'),
('1','53','Oh, no! You think the space lady guessed right! Now what’s going to happen?
The two guards shove you into the space chamber.
It’s a clear, narrow tube that rises farther up than you can see.
As the door slams shut behind you, one of the guards barks, “Get on the scale!”
You step up on the scale — and it shows just how right the space lady’s guess was.
You press the chamber-door release, but it’s stuck.
You try again. It doesn’t budge.
Maybe it’s locked from the outside.
“Hey! I can’t get out!” you yell to the guards. But they simply wave.
“Hey, let me out!” Now you’re mad. “Let me out!”
All at once the room starts to shake and rattle. RRRRRRRR. The thrust of powerful rocket engines echoes in your ears. It sounds as if you’re being launched into space. But that’s impossible, isn’t it?'),
('1','54','Your Halloween Express car pulls up in front of a cottage and the cottage door opens with a creak. You all jerk your heads up to peer at the door. You see a skeleton wearing an evil smile. And he lunges right for you!
“Trick or treat!” he screeches. Then he stretches out his bony hands to snatch you!
You pound on the gas pedal, and the car shoots forward — out of the skeleton’s grasp!
Your heart begins to race as the car speeds out of control. You tear through an eerie forest, speed past more cottages — but still you don’t see a way out.
And then it comes into view — a service exit!
All you have to do is stop the car, jump out, and scramble through the fence, and you’ll be free.
You check your watch — five minutes to midnight!
“Oh, no!” Patty screams. “Quick, turn left! Don’t stop!”'),
('1','55','They’re dummies. That’s why they don’t move!
“They’ve got to be here somewhere,” you hear Big Al’s voice boom outside the tent.
“Hey! This dummy looks just like the one in that GOOSEBUMPS book,” Patty says.
“You mean Night of the Living Dummy?” Brad asks.
Great! you think. Your friends are chatting about books minutes before you’re about to be attacked by a mob. Then you get an idea.
“Remember those magic words that brought the dummy to life in that book?” you ask your friends. “Maybe we can bring this guy to life and he’ll help us — he was pretty tough.”
Your friends agree — it’s worth a try.'),
('1','56','You leap out of the boat. The putrid brown water splashes into your mouth. Gross!
You swim a few strokes and suddenly find your knees scraping the bottom of the bog. The water here is less than a foot deep. Unbelievable! You were practically inches away from safety the entire time!
Slogging through the brown foam, you wade to shore. Your clothes are dripping wet and smell like a sewer. Well, look at the bright side, you remind yourself. At least you didn’t go down with your boat.
But your troubles aren’t over yet. You’re standing in a dank, eerie forest that surrounds the lake. Creepy screeches echo through the night mist. And you’re totally lost.
The wind starts to blow. Shivering, you wrap your arms around your shoulders and wonder where your friends are and what they are doing.
Then — POW! Something black and furry swoops down at you! You duck your head, but it comes at you again and again.
A huge bat!'),
('1','57','You open the blue door and peer through. You’re staring down a long dark passageway. At least you think it’s long. It’s difficult to tell. It’s pitch- black. You don’t know what to do.
“Maybe I should have picked the other door,” you say to yourself. “I’m getting out of here!”
But the blue door has locked behind you! Now you’re sure you made the wrong choice. But there’s nowhere to go but forward.
Your knees begin to tremble as you inch your way down the dark hallway.
The passage ends in a bright burst of light. And in front of you, a tall purple mountain rises hundreds of feet into the air.
You breathe out a long sigh of relief. You’re out of the dark!
You study the mountain. It looks so real! But cut into its side, you spot a doorway. Above it a brightly painted sign reads: DOOM SLIDE. WILL YOU BE THE ONE TO SLIDE FOREVER?'),
('1','58','Steel bars plunge down from above and drop across your lap and chest, pinning you in place. You can’t move at all. Even your head is held by superstrong headphones that clamp over your ears. A voice comes through them announcing: “Five, four, three, two, one, BLAST OFF!”
You hear a huge bang. Smoke and fireworks fill the air as your car starts up the first big hill. Your head presses back against the seat as you climb higher and higher. That first hill is endless, but the view is awesome. From the top, you can see the midway, the haunted house, and a shadowy swamp. You can’t believe how big the carnival is!
“Neat!” Patty yells. “There’s AHHHH —”
Whatever she was going to say turns into a wild scream as the rocket plunges down the other side of the hill. The wind whips at your face. You are pressed back so hard, you feel like a pancake. Everything passes in a fantastic blur.
As your car shoots up to the top of the next hill, you’re laughing and screaming at the same time. This is great, you think! But then you make a big mistake.'),
('1','59','Blue is your favorite color. You turn the blue card over.
There is a message: Help us! You are our only hope. Hurry to the back door of the freak show. Signed, The Freaks.
“What does this mean?” you ask Madame Zeno. She stares deep into your eyes. Her lips tremble. She leans forward. She’s about to speak.
And then the lights go out — and a blood-curdling scream rips through the dark!
You start to bolt for the door when a dim light suddenly flickers. You stare across the table. Madame Zeno is gone!
You reach out to take the card. And it bursts into red-hot flames! In seconds, the entire tent fills with thick smoke. Flames shoot across the floor. You run for the door.
Outside, you gulp the fresh air. Whew! You made it.
You glance back. No smoke. No fire. No tent! Everything has disappeared! What should you do now?'),


('1','60','60
“There’s a sign!” you call out to Patty and Brad. “Let’s see what it says.”
The three of you race through the wet grass. Your socks are drenched. And your sneakers squeak as you run. But that’s not the sound that’s sending chills down your spine.
It’s the hissing. It’s growing louder.
“I’m not sure I want to read that sign,” you call out to Patty and Brad.
“I know what you mean!” Patty shouts back. “I have a feeling we’re not going to like what it says.”
And you don’t. You reach the sign and read it aloud. “Reptile Petting Zoo Whoever heard of a Reptile Petting Zoo! What kind of carnival is this anyway?”
“This carnival is e-evil,” Brad stammers.
You’re about to agree when you notice the grass in front of you is swaying. Something is slithering through it. Something big. And then it comes into view.
“Snake!” Brad cries.
You know you have to run — but which way? Left or right?'),
('1','61','You’re too scared to turn around. And too scared not to. Risking a glance over your shoulder, you see a large, dark shape behind you. It’s a big man.
No. You squint hard. It’s dark and hairy with muddy leaves and green vines trailing from its body. It’s some sort of swamp monster!
You run as fast as you can. Your chest is on fire. The swamp monster is gaining on you.
You know you should keep running, but your heart feels as if it’s about to explode. You have to stop.
You turn and stare right into the swamp monster’s bloody eyes. “Neat costume,” you say hopefully.
Good try — but the swamp monster isn’t wearing a costume. He’s real and this, unfortunately, is really ...'),
('1','62','You decide to wait for Big Al.
“Big Al has to free the freaks,” you say to Patty and Brad. “If he doesn’t, we’ll tell him we’re calling the police!”
“Free the freaks?” Big Al says, bursting into the room. “The freaks are free to go any time. This prison is just part of the show. Did you pull that ‘free us’ joke on him?” Big Al laughs heartily.
“He’ssss lying,” the Snake Lady says. “We’re prisonersssss.”
“Oh, come now,” Big Al says. “You’re not prisoners.” And with that he unlocks all the cell doors. Then he turns to you and your friends.
“As you can see, the freaks are free. Now, come with me. You haven’t even tried one game on the midway.”
“Don’t go with him. It’sssss a trick!” the Snake Lady cries.
Should you go with Big Al?
Who’s telling the truth? Al or the Snake Lady?'),
('1','63','Bump.
A chute opens up. You land headfirst on soft grass.
You blink several times. A long sigh escapes from your lips. It wasn’t the Doom Slide after all.
As you climb to your feet you hear someone call your name.
You glance up and shout for joy. It’s Brad! And Patty’s there, too!
You tell them about your scary ride on the slide — about how you thought you’d slide forever.
“Cool!” Patty exclaims. “Let’s all ride it this time!”
“No!” you tell her. “This carnival is too weird. And dangerous. Something’s not right. We have to get out of here. Now!”
“Yeah,” Brad agrees. “The faster, the better.”
“I have an idea,” Patty announces. You and Brad huddle around her. “I spotted a back way out of here. But it’s a little risky. We have to squeeze through a barbed-wire fence — and it’s guarded by the carnival’s security forces. But we should try!”
Are you going to listen to Patty?'),
('1','64','The House of Horrors! You have to see it. You just have to!
“I’ll catch up with you guys later,” you call to Patty and Brad. “I’m going to check out the haunted house.”
You glance down at your map for directions. The rickety wooden bridge over to your left appears to lead straight there.
As you start across the bridge, the wooden planks creak under your feet. Then the bridge begins to sway. You look down. Way down. The bridge spans a deep, rocky gorge. Gulping, you grab the handrail. You move slowly. A strong wind blows up from the canyon below. The bridge is swaying wildly now, tossing from side to side.
A massive spear of lightning splits the sky. Thunder rumbles so loudly you jump and lose your balance. “Help!” you scream as you tumble right over the side — and plunge toward the jagged rocks below!'),
('1','65','The walls are closing in faster now.
You throw your arms out and try to push them away. But it’s hopeless. You’re going to be crushed like a bug.
You suck in a deep breath — it could be the last breath you take.
The floor opens beneath your feet!
You drop down. Down. Down. Down. A long, agonizing scream escapes from your throat as you tumble through space.
Will you ever hit bottom?
“Incoming player,” you hear a commanding voice shout. “Stations, everybody.”
A layer of webbing catches you like one of those nets trapeze artists use. Gasping, unable to understand what’s happening, you bounce up and down.'),
('1','66','You start up the brick path to the House of Horrors. Suddenly, someone sneaks up behind you and taps you on the shoulder. You spin around and jump back.
Standing in front of you is a bony skeleton.
And it talks.
“Don’t go in there,” the skeleton says. “Or you’ll end up like me....”
You stare in terror at the hideous creature. Then you burst out laughing.
“Wow! You guys really want to make the haunted house totally creepy. This is going to be great!” you say.
You’re still chuckling as you push open the giant oak door of the House of Horrors. It swings back with a long, loud creak.
You step inside and find yourself in a narrow hallway. The door slams shut behind you and the hall turns darker than a starless night. “I can’t even see my hands!” you exclaim.
You stumble ahead slowly, pressing your palms against the walls to guide you.
When will this tunnel end?'),
('1','67','Thrumpff! Your foot plows into the doctor’s stomach again. But this time, it smashes right through it. And hits ... solid steel!
The crunch of metal echoes in the room — along with the doctor’s screams. “Aiiii!” he wails like a siren.
You gaze into the gaping hole your sneaker made. Thousands of circuits and wires burn and crackle inside it. The doctor is a robot! Well, an ex-robot now. Your kick totally destroyed him.
That’s the good news.
The bad news is headed for you. It’s the monster with the blue horns and red, bulging eyes.
You scramble out of the net and dash toward the door. But the monster is too quick for you. His tentacle arms shoot out and snatch you. Giant suckers at the ends of his wrists circle your throat.
You gasp for air as the monster pins you against the wall. Can you free yourself from his oozing grasp?'),
('1','68','You slowly lower yourself onto the slide. You start to stretch out your legs when the bottom tilts underneath you and throws you forward. You’re sliding! Fast!
The surface must be made of some kind of special material because you’re zooming down at top speed.
You hold your breath as you fly through the blackness. A bump sends you bouncing into the air. You scream. And scream.
When is it going to end?
Oh, no! Could this be the Doom Slide?
You hear screams echo in the darkness. You twist around. But you don’t see anyone.
The ghostly screams grow louder — in front of you, next to you, behind you. Screaming and sliding. And sliding. Never stopping.
You gasp for breath. And then you hear it.
A voice cuts through the blackness. Through the screams. A voice that cries, “Welcome to the rest of your life. Welcome to the Doom Slide!”'),
('1','69','“Kami marri odonna loma molonu karrano.” You say the magic words and — the dummy comes to life!
He opens his mouth and speaks. “Hey, you. Your face reminds me of a wart I once had removed.”
“Come on,” you plead. “We’re the ones who brought you back to life. Aren’t you going to be nice to us? We need your help.”
“I’m sorry,” the dummy says. “I’m sorry you’re so ugly....” Then he laughs at his own lame joke.
You stare at him and his face grows serious. “You brought me to life,” he says slowly, “but now you are my slaves.
“Forever — until...'),
('1','70','“Nine ... ten ...”
“Brad, shut up. Look at this!”
You point to the letters on the front of the train car.
You’ve been staring at them the entire time. Why didn’t you notice them before?
“What about the letters?” Patty says sharply.
“Eleven ...”
“Don’t you see what they say?” you shoot back.
“Right-Way Railroad,” Patty reads. “So what?”
The chants of the merry-go-round people echo in your head. There’s only one right way. There’s only one right way.
Could it be?
“Twelve!”
Now what?'),
('1','71','Sorry. It’s not your lucky day. As you dash toward the sign, the giant crane scoops the three of you up and drops you off into a hollowed-out log. You barely have time to sit up straight before the craft reaches the waterfall!
You hold your breath as the log teeters on the fall’s edge. As it plunges over, you scream.
A hard spray smacks you in the face and drenches your clothing as you race down the long slide. At the bottom, the log hits a pool of water and sinks.
You’re still holding your breath as you wait to bob to the surface again. But it never happens. You keep going down.
Your last thought is that you’re going to set a world’s record for holding your breath underwater.
You’d better set a world’s record for closing the book and starting over again. Maybe next time you dive in you’ll have better luck.'),
('1','72','You step up to the Guess Your Weight on Mars booth. A woman in a space suit motions you inside a gate. You pass through and find yourself in the middle of a courtyard that looks just like a miniature launching site — complete with its own rocket!
“Security check,” the lady says as she presses your hand onto a fake scanner.
“So how does this game work?” you ask.
“I’ll guess how much you weigh on Mars,” she explains. “Then you’ll enter the planet simulation chamber and stand on the scale. If I’m stumped by more than one pound up or down, you win a giant candy bar.”
“What if you guess right?”
The space lady doesn’t say anything at first. She just smiles. A nasty smile. Then she answers.
“You lose,” is all she says.'),
('1','73','Your reflexes are great. You jumped out fast enough and escaped the ghost — that ghost. But you didn’t see the other one behind the car — waiting for you.
Your heart hammers away in your chest as it circles you. Around and around and around.
“It’s all right,” you tell yourself over and over. “It’s not real. This is just a ride in an amusement park.”
You’re still telling yourself that as the ghost plucks you off your feet.
His black lips part.
He opens his mouth — wider and wider. Until it’s as wide as an entrance to a cave.
Then he stuffs you inside.
Instantly, you feel lightheaded, then light all over. You peek down at your hands.
You can see straight through them. You’ve been turned into a ghost! And as your senses fade, you hear a distant bell chime twelve times. Too bad. The Carnival of Horrors will be one of your favorite haunts — forever!'),
('1','74','Round and round you go. The world is a blur of colors. You can hear the crowd screaming. “FI-NAL! FI-NAL!”
And the wheel stops.
“Ahhhhhh,” the crowd gasps.
What does it mean?
“YOU WIN,” Big A1 says. “Now come this way to collect your prize and go home.”'),
('1','75','The three of you duck inside the Hall of the Mountain King!
A painted backdrop of rounded, snowcapped mountains rises on your left. Up in the mountains, a big stone castle rests in the sunshine. A group of cheerful elves picks flowers in the castle’s garden.
To your right, you spot the ride — wooden carts pulled by real horses. “Come on!” you call to your friends. “Jump in a cart. This is great. We’ll be out of here in no time.” No time — that reminds you. You glance at your watch. 11:45!
You all scramble into one of the carts and grab the reins. Your horse plods forward, and you pass through a painted stone archway.
You gasp. Everything in the painted backdrop is now in front of you. And it has suddenly become real. But different!
The snowcapped mountains rise to black, jagged peaks that pierce the sky. The big stone castle huddles on a scary, dark hill. And the elves — they aren’t picking flowers.
They’re ...'),
('1','76','You dig deep into the side pocket of your jeans — and find it! The chocolate bar you won.
It’s a good thing you didn’t eat it all — but will the vulture go for it?
Without warning, the big bird starts his final approach, diving straight for the nest. You pull out the candy and wave it frantically in front of him. “Treat! Treat!” you holler. These words make your dog at home go wild. But will it work on the vulture?
Yes! He cracks open his claws — just enough for you to wiggle loose. Then you’re falling, falling.
You’ve landed on a giant trampoline.
Fwanggg!
Now you’re going up again. Higher this time. Now you’re falling again.
Fwanggg — you’ve bounced up even higher this time.
Every life has its ups and downs, but it looks as if you’ll be bouncing up and down forever — and boy, is it fun!'),
('1','77','“Let’s head for the midway and play some games!” you say.
You, Patty, and Brad jog down a wide avenue. Tents of every color line the street. Carnival music blares from loudspeakers.
You spot a green neon sign flashing above a yellow-striped tent. The sign reads: madame zeno — fortune-teller.
“Excellent!” you exclaim. “I’m going in!”
You tell your friends you’ll catch up with them in a minute.
You lift the tent flap. Inside, one small candle flickers in the dark. You hear a low voice call out, “Enter my chamber.”
There is Madame Zeno, sitting in the shadows. She wears a long red dress dotted with brightly colored gems. They shimmer in the candlelight. Her black hair tumbles to her shoulders as she bends over a large crystal ball.
“Welcome,” she whispers. Then she reaches out and gently lifts your hand. “Let me tell you your future.”'),
('1','78','Madame Zeno studies your hand closely. She traces the lines in your hand with her soft fingers.
“I see horror in your future. In your immediate future,” she warns.
“Wh-what kind of horror?” you stammer. “What do you mean?”
Madame Zeno releases your hand. She picks up a strange deck of cards. She spreads them out on the table. You notice the cards have pictures — a headless man, a bloody sword, a large, evil eye.
She gathers up all the cards and flips the deck over. Then she deals out a red card and a blue card.
“Turn one over,” she commands. “Learn your fate.”'),
('1','79','The doctor leans over. He’s so close now, his sour breath fills your nostrils. Then his fingertips brush your hand and — POW! Your foot flies into his stomach! A direct hit!
But nothing happens.
He doesn’t scream. He doesn’t even moan. In fact, he doesn’t seem to notice at all.
He simply smiles at you.
Now you’re scared. Really scared. But you know you have to do whatever it takes to get out of there. You have to find your friends and escape from this Carnival of Horrors.
You gather up every ounce of courage and strength you have — and kick him once more. Harder!
And this time something does happen — BIG TIME!'),
('1','80','You turn a corner and are instantly blinded by glaring lights.
You are standing in a room of mirrors. Walls. Floor. Ceiling. All mirrors!
Everywhere you gaze, you are met with reflections of yourself! You take a few steps forward and — BONK! You hit your head on solid glass.
You move one step to the left, and a dozen copies of you move in that direction.
Totally dizzy, you close your eyes. Maybe you can find the exit with your hands. Keeping your eyes shut, you walk until your palms hit against another glass wall. Then you hear a voice. “Come this way. Over here,” it calls.
You walk toward the voice — BONK — a solid wall again.
Finally, your hands find an open doorway! It leads to a mirrored hallway that goes left and right. Which way will you go?'),
('1','81','“You’re lying!” you yell. “You are a robot.”
You quickly reach up with both hands and tug at his head. His sharp jaws slash at you. But you’re fast. You hold on firmly and pull!
Oh, no! He really is a monster. And he’s not happy.
You know you’re dead meat, but you have to try one more time. Just to make sure. You give his head one more tug. He laughs. Then he gives your head a tug.
Sorry. You were doing so well. But now you’ve gone and lost your head. The only way you’ll be able to face the challenge of the Carnival of Horrors now is to close the book and begin another day. At least then — you’ll have a head start.'),
('1','82','“Oooopah lupah dummie dupah.” You say the magic words and wait for the dummy to spring to life.
And you wait.
And you wait.
The dummy remains the same.
But something strange is happening to you. What are those feathers sprouting out of your skin? And what’s happening to your feet? Are those claws you see growing out of them?
Is it possible that the magic words are turning you — CLUCK — into a — CL UCK — chicken?
That’s eggs-actly what’s happening.
Well, you laid an egg this time. Let’s hope you won’t be too chicken to open this book again and try once more to escape from the Carnival of Horrors.'),
('1','83','You squint hard at the road ahead of you — and see why Patty wants you to turn. There they are — the people in the old-fashioned clothes. Only they don’t look the same.
Some have green flesh. Some are deathly white. Their rotting skin hangs from their bones.
And they’re all reaching out. Reaching out for you!
“Turn! Turn!” Patty yells.
You spin the wheel sharply to the left to avoid them. But you can’t dodge the ghostly creature that’s rising above you. He’s ten feet tall — with arms so long that they scrape the ground. His mouth gapes open to reveal hundreds of blackened, rotting teeth.
He swoops down at you. You turn the steering wheel hard to the right. Too hard — it comes off in your hands!
“Jump!” you cry. “Jump and run! Run!”
The three of you leap out of the moving car. But are you fast enough? That depends on how good your reflexes are.
Try this test and find out. Throw a ball in the air. Try to clap three times before you catch it.'),
('1','84','Big A1 shoves you and your friends into a huge red tent. It seems to be set up for some kind of show. Red carpeted steps lead up to a platform, which sits under a golden arch. The arch twinkles with a thousand colored lights that spell out: FINAL CHALLENGE.
Trumpets blast as people flood into the viewing area. As they march in, they clap their hands and yell, “FI-NAL. FI-NAL.”
Big A1 leads you up the carpeted steps. You are standing on the platform now — in front of a shimmering curtain that hangs down from the arch.
The crowd begins to chant, “SUD-DEN DEATH. SUD-DEN DEATH.”
“What do you think that means?” Patty asks.'),
('1','85','The giant hangs over you, flexing his muscles. He squints at you as if you are a bug — ready to be squashed.
“Did you call me a wimp?” he thunders.
You are much too scared to answer.
The giant answers for you. “You’re right. I am a wimp!”
And with that, he bends the bars, and you, Patty, and Brad scramble through.
“Follow me,” the giant says. “I know a way out of here.”
“What about the others?” you ask, pointing to the freaks in the cells that line the wall.
“No problem!” Patty yells, grabbing the keys from a hook on the wall. “Here — catch!”
You quickly unlock all the doors — setting the freaks free!'),
('1','86','“I don’t know,” you say. “I don’t think we should take any more risks. Especially not in this crazy carnival.”
“Don’t you trust me?” Patty demands. Her eyes flash angrily.
You glance at Brad. He stares at the ground.
“I just have a bad feeling about this, Patty. Okay?”
But Patty doesn’t answer. She throws her shoulders back and stands up taller. And taller. And taller.
You gasp! Patty is growing! She’s nearly ten feet tall!
She reaches out a long arm and grabs you by the wrist. Her nails dig deep into your skin.
You can’t move.
You scream as Patty continues to change. Her skin turns green and lumpy. Horns sprout from her head. And her teeth grow into sharp fangs.
You remember the horrible monsters on the walls of the slide. Patty has turned into one of them!
“Let me go. Please!” you plead.
“Too bad you didn’t trust me,” she growls. “I can’t have you ruining my plans.” Her nails sink deeper into your flesh.
“Ha-ha-ha!” she cackles. Then she wraps her slimy mouth around your arm and bites down. Hard!'),
('1','87','You’re staring at a sign that reads: world’s freakiest freak show! The three of you gape at the pictures.
There’s the Three-Headed Man with the ugliest collection of faces you’ve ever seen. And the Snake Lady — a young blond girl with a beautiful face and the body of a slithering snake.
“This is, uh — uh —” you start to say. But you don’t finish. Because a large hand has come down on your shoulder. Hard.
You slowly turn and gaze up at a huge man with shoulders wider than a refrigerator. He has coal-black eyes with a thick mustache to match. He looks strong enough — and mean enough — to pitch you over the fence with one hand.
“What are you doing?” his deep voice booms. “You’re not allowed in here,” he says, pointing directly at you.
“We’re sorry,” you say, hoping you appear sorry and not just scared. “We wanted to look around. That’s all. But we’ll leave. Right now.”
His eyes stare into yours. He clamps both hands down on your shoulders and says, “You’re not going anywhere!”'),
('1','88','You head toward the Boat Trip to Nowhere. At the dock, you spot a stubby guy with long arms slouching against one of the mooring posts. In the strange light of the swamp, his skin shines with an oily, green glow. And his ears and nose are as craggy as tree bark.
“Step right up,” he calls in a gravelly voice.
He pulls one of the motorboats over. It’s red with a silver racing stripe! “You can do fifteen knots in these babies,” he says. “But stay away from the tree stumps.”
You watch the little man’s sharp green fingernails tearing the mooring rope apart. As soon as the boat is free, you jump in, step on the gas, and roar away from the dock.
The wind blows hard against your face. You’re flying over the water. This is totally cool! You head for a channel that you see up ahead. Too bad you didn’t notice that sign that reads: TO BOOGER BOG.'),
('1','89','Dr. Stone extends a long bony hand to pull you from the net. When you peer into his face, his eyes roll up into his head.
“Pleased to meet you,” he rumbles.
Did he say, “Pleased to meet you” or “Pleased to eat you”? You’re not sure, and you don’t want to hang around to find out.
I’ve got to get out of here, you think.
As the doctor lowers his hand a bit more, you wriggle your right foot free of the netting. If you give him one hard kick in the stomach, maybe you can make a run for the door.
But what about the monsters? Can you dodge them?
You change your mind. “I’ll wait — play it cool until at least one of the beasts leaves the room,” you say to yourself.
Then you change your mind again. “No. I’d better make my escape now!”
The doctor looms inches away. And you’re still not sure what to do.
You’d better decide fast!'),
('1','90','NO!
At the last minute, you wrench the steering wheel hard to the left. The side of your boat clears the tree with a sickening scrape.
You breathe a sigh of relief, but it ends in a groan. A huge, sharp root below the water has just ripped into the bottom of your boat. You hear a tearing sound, then gurgling as the cockpit starts to fill with water.
“Now what?” you mutter.
Then through the mist you spot another boat. But it’s some distance away.
“Hey, over here!” you cry out.
Did they hear you? You cry out again. Then you glance behind you. More than half your boat is underwater — and you’re going down fast.
What should you do? Keep yelling for help? Or try to swim for safety? Make your choice — QUICK!'),
('1','91','The red-eyed beast leans against you now, pressing you hard against the wall. The monster moves his face close to yours. The jagged horns at the top of his head nick your cheeks.
You can’t bear it anymore. You bring your hand up with all your might and shove his head away from yours.
As you watch in horror, the monster’s head rolls off its neck. The head tumbles to the floor and lands at your feet.
The eyes glance up at you, and you notice his hideous lips moving. “That hurt,” the head says. “That really h-h- ...”
He never finishes. You’ve destroyed another robot!
“Almost out of here,” you whisper to yourself. Now all you have to do is slip by the crusty, alligator-snout creature guarding the door.
“You robots aren’t so tough,” you say to him with fake bravery.
“Oh, really?” the scaly beast croaks. “Well, maybe not. But what makes you think that / am a robot?”'),
('1','92','You decide to wait. Someone should be here soon, you think. But after waiting in the space shuttle for at least fifteen minutes, you’re not so sure. No one has shown up to rescue you.
A chill runs down your back. You feel as if a thousand pairs of eyes are watching you from the shadows.
Now that you’re accustomed to the darkness, you can see dozens of tracks leading in and out of the tunnel.
And then you hear a rustling sound. You freeze. You listen hard. Could it be rats — or something worse?
You draw up your knees and wrap your arms around them tightly. Then you hear a hissing sound — and you smell something odd. It’s kind of a sweet smell — like heavy perfume. You hold your nose because the smell is making you feel strange. Dizzy. Sick.'),
('1','93','What a sight!
You can hardly believe your eyes!
You scream again.
It’s Patty and Brad!
“Hey, guys, wait up!” you yell.'),
('1','94','The ride stops.
Dead.
You are sitting in the dark.
Nothing is moving.
“Patty! Brad!” you call.
Silence.
Why don’t they answer? They have to be there.
You try to twist around. But you’re locked in your harness and clamped in your headrest.
Blinking in the dim light, your eyes dart to the left. Then to the right. You spot dozens of empty space rockets lining the walls. They seem to come in sections, making longer and shorter space rockets.
Your mind starts working feverishly. Did your section detach from Patty and Brad’s section?
Suddenly, the silence is shattered. Your seat lock grinds open, and you are released from your harness. You quickly spin around. Patty’s and Brad’s cars have disappeared! If this is all part of the ride, maybe you should hop out. But if the ride is broken, maybe you should wait for help.'),
('1','95','You sit down on the slide and push off. The world tilts as you plunge down. Down, down, down.
You’re scared. But you can’t help feeling that this is kind of cool! Sliding and swirling in the darkness.
Until you hear the screams. The eerie screams that follow you as you twist and turn.
Your heart starts pounding wildly. Oh, no! You must have picked the Doom Slide. You’re going to slide forever!
And then, bump.
A chute opens up. You hit the ground hard. You tumble over and over and finally stop.
You lie on the ground. Panting.
You’re outside!
You scramble to your feet and gaze around.
You hear laughter. It seems to be coming from the bright pink building a few feet in front of you.
You walk over to its big pink door and press your ear against it.
Yes. The laughter is definitely coming from inside.'),
('1','96','... they’re swinging axes.
Your heart leaps into your throat. The elves move to the roadside now — and they’re chopping down the horse-drawn carts ahead of you! One cart splinters into a million pieces before your horrified eyes.
The elves continue on to the next cart. Their sharp blades slice right through it!
Your horse keeps trotting up the steep path. You’re headed right for the wildly chopping elves!
“Do something!” Patty cries.'),
('1','97','Your hand clamps around the can of Monster Blood in your pocket. Quickly, you snap off the lid and the green gunk pours out.
“Look! It’s alive!” Brad shouts.
He’s right. The Monster Blood oozes from the can, quivers, and appears to stretch and pull itself up! Then it starts to roll and bounce, making horrible sucking sounds.
Great! It’s rolling into the crowd, sucking up everything in its path!
“Run!” Big A1 screams as the huge green ball rolls over the people in the crowd — sucking them up with a loud plop.
Then the Monster Blood hits the side of the tent. It changes direction.
It’s coming after you!'),
('1','98','Well, looks can fool you. He is not a wimp.
And he’s mad — at you.
In the next moment, he scoops you up and hurls you at the cell wall. His throw is so forceful, you smash right through the wall and soar out of the carnival grounds.
Congratulations! You escaped the Carnival of Horrors — but not in one piece.'),
('1','99','“Okay, get me out of here,” you say to the dwarf. “Did you help my friends, too?”
The dwarf does not answer. He sprints off and you have to race to keep up with him. Through a confusing maze of twisting tunnels. You’re sure glad you have a guide.
The dwarf suddenly stops. “That way,” he says gruffly, pointing straight ahead.
Before you can blink, he vanishes in a puff of smoke! And you’re left standing in front of two doors. One red. One blue. The red one has a sign that reads: DANGER. The blue one has a sign that reads: BIG DANGER.'),
('1','100','“Help! Help! Over here!” you scream, waving your arms wildly in the air.
“Hold on!” a deep voice answers through the heavy mist.
The boat turns and speeds toward you. As it nears, the voice calls out again. “Jump! Jump over!”
Jump? Is he crazy? Can you really jump onto a moving boat?
The boat is coming closer now. Closer. Closer. You stand up. You bend your knees. You’re about to jump — and the boat speeds right past you.
But wait! It is circling back now in a nice, slow approach. It glides up to you, and gigantic hands pull you onto the boat.
“You saved me!” you cry.
You gaze up and gasp in surprise. The man in the other boat isn’t a man — it’s a monster with a drooling snout and rows of jagged teeth.
“Save you? Save you?” the monster repeats.
His red eyes light up. “Save you ... good idea,” he says. “I won’t eat you now. I’ll save you for a midnight snack!”'),
('1','101','You make it! You make it out of the park!
You also make it out of the state!
In fact, the last time anyone saw you, Patty, and Brad, you were all a tiny blip on NASA’s radar screen.
Congratulations! You escaped from the Carnival of Horrors.
Happy landings!'),
('1','102','“I’m not going anywhere with you, Big Al. I believe the Snake Lady!”
“So do I,” says Patty.
“Me, too!” Brad echoes.
“That’s too bad,” Big Al says. Then he turns to the Snake Lady.
“And as for you, Miss Reptilia — I told you, you’ve been overacting. If these kids believe you, we won’t be able to torture them with our real horrors.”
“Ssssssorry, bosssssss,” she says. “Sssssso what do you want me to do with them?”
You can hardly believe it! Real horrors?
“What kind of carnival is this?” you shout.
“The Carnival of Horrorssssss,” the Snake Lady answers — and that’s the good news.'),
('1','103','“We’ve got to jump,” you tell Patty and Brad. “It’s our only chance.”
“Okay,” Brad agrees as your cart inches up to the chopping elves.
“Come on,” you cry. “Now!” But Brad is too paralyzed with fear to move. You and Patty grab him and haul him toward the side of the cart.
Your cart has reached the elves! One of them smirks as he lifts his ax.
It’s right above your neck.
You picture your head tumbling down the side of the mountain.
With a loud cry, all three of you jump. You land with a thud on a rocky ledge. It breaks your fall. But the rock is too weak to hold all of you.
You scream again as the edge tears loose and the world drops from under your feet. You tumble over and over, down the side of the mountain.'),
('1','104','You push open the red door. Another tunnel lies beyond it. You follow its twists and turns, and you realize that you’re sloshing through cold muddy water. It grows deeper and chillier as you go.
With a cold shudder, you decide to head back — until you hear a slurping noise behind you. Whirling around, you watch in horrible fascination as giant earthworms crawl out of the mud. Gross!
No way you’re heading back there. You clench your teeth and slog onward. Up ahead, you see a dim green light. Great! An exit.
As you reach the end of the tunnel, you hear a low growl behind you. At first you try to pretend it’s your imagination. But there’s no mistaking the sound of thudding footsteps. Getting closer. And closer. And now it’s breathing down your neck!'),
('1','105','It’s a tree branch! Grabbing at you. Tugging, tugging at your hair. You can’t break free. Its gnarly stubs dig in deeper as you struggle.
Suddenly, you feel something wrap itself around your arms. Then your legs. Closing in tighter. Tighter.
You gaze down and see them — black knobby tree limbs twisting around you. Strangling you.
You drop hold of the steering wheel and begin to claw at the branches, ripping them away.
And then you peer up — and see a terrifying sight. It’s a huge tree. And you’re headed straight for it! You grasp the steering wheel to regain control of the boat. The tree is just inches away.
Are you going to CRASH?!'),
('1','106','“Unless what?” you scream. “Tell me!”
“You can escape the Carnival of Horrors if you leave before closing time.”
“When is closing time?” you shoot back.
“When the last ride stops....” the lady whispers. “At midnight. ”
You glance at your watch — 11:40. Twenty minutes — that’s not so bad. But how do you get out of here?
As if the lady can read your mind, she says, “There’s only one right way.”
Then all around you, the crowd begins to chant.
“ONLY ONE RIGHT WAY, ONLY ONE RIGHT WAY.” They repeat it over and over again.
“What is it?” you scream. “Which way?”
It’s useless. They’re not going to tell you.
But it’s not midnight yet. There’s still time to figure it out.
Until the floor begins to tremble. And the walls begin to shake. Earthquake!'),
('1','107','“Sorry, Brad. I think Patty’s right,” you tell him as you turn toward the Hall of the Mountain King. “I think I spotted an exit there when we first came in.”
Patty runs ahead. “Look!” she cries out. “There’s the path. It leads past the Hall of the Mountain King to the exit.”
“Yeah, but who are those people up there?” Brad asks. “They’re blocking the way.”
You peer up ahead and see them — the people in the old-fashioned clothes. And they’re still chanting — “Only one right way, only one right way. ”
“They’re not going to let us out!” Brad panics.
“Okay. Okay. I have an idea,” you say calmly. “Let’s go into the Mountain King ride — maybe we can jump off at the end and sneak past them.”
Do you have another choice? No.'),
('1','108','“We’ve got to get out of here, it’s almost midnight,” you say as you run toward the Halloween Express ride.
“Hey, maybe we should try one of these cars,” Brad says, pointing to the red and orange cars that run on a track.
The three of you crowd into a little car that’s really meant for two. You jam your foot on the gas pedal, and you’re flying!
“All right!” Brad cheers. “We’re on our way home! Hey, I wonder why they call this Halloween Express?” he asks.
You turn the wheel sharply to the left, and then you know why....'),
('1','109','You squeeze your eyes shut and wait for the crash. Finally, you land. You glance up. You’re at the foot of the Log Flume ride.
You, Patty, and Brad have lots of cuts and bruises, but you’re okay! Terrific! you think — until you spot the army of elves with their axes. They’re rushing down the mountain toward you! The only escape is to enter the flume ride, so you dash inside.
The Log Flume reminds you of a western logging camp, complete with log cabins, trees, trucks, and a sparkling blue lake.
In the distance, you can hear the buzz of chain saws. And down by the lake, giant cranes pick up logs and plop them in the water. Some of the logs are hollowed out in the middle with seats for passengers. As you watch, the current catches one. It glides to the edge of a waterfall, plunges over, and shoots down.
As you glance around, you spot an exit sign.
Then to your horror, you see a giant crane swinging your way. “Duck!” you scream.
Will you make it to the exit? Is this your lucky day?'),
('1','110','Something tells you that this monster is not a robot. This one is for real. Maybe it’s the way he stares into your eyes. Or maybe it’s the rows and rows of razor-sharp teeth jutting from his mouth.
You take a step back. He takes a step closer. A drop of his drool drips on your hand. It sizzles and burns.
This is the end, you figure. You’ll never escape the Carnival of Horrors. Never see your family or Patty and Brad again.
The monster lifts his gigantic, clawed hand. He waves it over your head. And you wait for the searing pain as it plunges down to strike you.
But that’s not what happens.
The monster slowly lowers his hand and clutches at his own neck, and then — pulls his own head off! And when you discover what’s underneath, you know you’re still in big trouble!'),
('1','111','Your pulse pounds in your ears as you carefully lift yourself out of the car. The tunnel is dark and musty and really creepy. Anything could be lurking in the shadows.
This must be part of the ride, you reason. And the more you think about it, the more convinced you are. You’re scared. But you have to admit, this is pretty cool.
In the distance, you spot several red lights that seem to lead to other dimly lit tunnels. You cautiously head toward one of them. Overhead something dark and slimy drips. Splattering on the top of your head. Stinging your forehead.
As you desperately try to wipe the burning slime away, something grabs you by the knees!
Aaaah! You look down. A pair of red-rimmed eyes meet yours. It’s a dwarf with scraggly red hair and a toothless smile.
“Want me to lead you out of here, kid?” he asks. You’re about to follow the dwarf, but then you stop. Is he part of the ride? He looks really evil. What do you do?'),
('1','112','Yeoow! Someone splashes cold water in your face. Your eyes open.
“Come on! Wake up! It’s almost show time,” a raspy voice says.
“Show time?” you say, gazing into the eyes of a dwarf. “What show?”
“The Freak Show. You are the Amazing Siamese Triplets.”
You glance around and see Patty on one side of you and Brad on the other. You try to pull away from them, but you can’t.
“We’re stuck together with some kind of glue,” Patty says.
“It isn’t glue,” Brad argues.
“Is too!”
“Is not!”
Well, whatever it is — you are stuck. Stuck between your arguing friends for a long, long time — like forever. And here’s something you can’t argue about. This really is ...'),
('1','113','Help some freaks? That’s a good one! You laugh.
You think about Madame Zeno, the fire, and the disappearing tent. Totally cool! You wonder who thought up such awesome special effects.
You can’t wait to tell Brad and Patty all about it.
You search for your friends in the big wooden booths that line the midway. Instead, you find incredible games of chance. Some test your eye- hand coordination. Others require pure luck. But they all offer the most amazing prizes you’ve ever seen — phones, video games, fifteen-speed mountain bikes. You can’t wait to play!
You spot a booth across the midway with a crowd gathered in front.
That’s odd, you think. Didn’t Big A1 say we were the only people at the carnival tonight? You wonder if your friends are in the crowd. You move closer.
“Oh. I get it,” you say aloud. “These people must work at the carnival.”
You’re about to call out to them. Until you see their eyes. Strange, haunted eyes.'),
('1','114','This is your lucky day.
You duck as the crane swings over your head.
“Run!” you shout to your friends.
You glance at your watch — 11:55. If you’re really lucky, you can still make it out of the carnival by midnight.
You can see the exit up ahead. As you charge through the gate, you feel really hopeful — until you run into Big Al.
He blocks the exit with his huge body. His massive hands are planted on his hips. “No one escapes from the Carnival of Horrors!” he roars.
You’ve got to find a way out. Now!
To your right is the entrance to Halloween Express — you could try that.
Or maybe you should run down a different path. There’s got to be more exits around here somewhere.
Choose fast!'),
('1','115','There’s nothing in your pocket but lint.
“Help! Save me!” you cry.
The vulture swoops down and drops you in the nest.
The baby vultures approach.
Mouths open — ready to peck you to death ...
But — good news! They don’t eat you. You fall out of the nest instead.
Please, close the book fast, or the next sound you hear will be your body, hitting the ground with an awesome thud.
THUD!
Not fast enough. Okay, don’t go to pieces. Pull yourself together and prepare to visit the Carnival of Horrors again — the next time you’re brave enough to open this book!'),
('1','116','ZAP!
Big A1 throws a switch and the magnet shuts off. You come flying down to earth — right where Brad and Patty are waiting.
“I played your dumb game. Now, let us go!” you tell Big Al.
Big Al doesn’t answer. But the crowd does. “SUD-DEN DEATH! SUD¬ DEN DEATH! SUD-DEN DEATH!”
The crowd surges toward you. They are not friendly. They back you up against a wall. You’re trapped.
Trapped by a mob!
You reach into your pocket, hoping to find something that might help you. Something to save you ...'),
('1','117','You open the door and enter a room bursting with people who seem to be waiting for you. You think that’s weird until you study them — and realize something even stranger. They’re all dressed up in old-fashioned costumes.
“Welcome to the Carnival of Horrors,” a tall woman with a red parasol says, smiling. “Nice of you to join us.”
The Carnival of Horrors. The words send shivers down your spine.
The woman with the parasol whispers in your ear, “Don’t you want to know the secret of the Carnival of Horrors?”
You nod yes.
“The Carnival of Horrors comes alive in a different place and a different time each night. Tonight we’re in your town. Tomorrow we could be in another country! But every place we stop, we invite kids like you to join us....”
“Thanks for the invitation,” you say, “but I gotta go.”
“I’m sorry.” The lady chuckles. “You can never escape from the Carnival of Horrors,” she says solemnly. “Unless ...”'),
('1','118','You turn left. Somewhere ahead of you, you hear laughter.
“Is somebody there?” you call out.
Silence.
You stare at your reflections in the mirrored hall.
Am I trapped? you wonder. Am I in real danger? Or is this all a big, scary joke? Your heart begins to race.
You inch forward a few more steps — moving toward the laughter. Slowly.
“Over here,” a voice calls again. But now the voice seems to be coming from behind you!'),
('1','119','You take charge of the reins to urge the horse on.
“Giddyap, boy,” you and Patty shout. But your horse won’t move any faster.
You shoot a glance up ahead. The elves are chopping ... and a shiny blade ... is now ... right over ... your head!
“No,” you scream. “NO! Let me out of here.”
You feel a sharp pain. And you realize you’ve just had the shortest haircut of your life. Unfortunately, they took a little too much off the top.'),
('1','120','The bad news is the Snake Lady fooled you.
“Throw them into the large cell with Harold and all the other prisoners,” Big A1 commands.
You are shoved into a dark cell. You hear a click. You’re locked in. As the Snake Lady leaves with Big Al, you can hear their laughter echo down the hall.
You glance into the other cells and think, the freaks are prisoners. They do need our help. Then you peer into the darkness of your cell — to find out who Harold is.
There’s no way you could miss him. Harold is a giant. He’s huge — twice as big as a football player. His hands are, in fact, the size of two footballs. His arms look like tree trunks.
At first you are afraid of him, but then you think, Hey! He’s trapped, too. Maybe we can convince him to help us. And then you get a big idea!'),
('1','121','You grab the sides of the slide and lower yourself down. The second you sit, the slide’s floor tilts up beneath you and propels you forward.
You shriek!
You raise your arms and scream louder. You slide faster and faster. In total darkness. Darkness so black, you can’t even see your own feet in front of you.
Your eyes dart frantically from side to side. Faces suddenly appear in the darkness in bright flashes of light. Faces of hideous monsters with deformed heads and oozing flesh.
But you’re moving too fast to focus on them. You slide and slide — until the faces stop flashing and you’re covered in the thick, heavy blackness again.
You scream as you round a sharp curve. Your head is spinning. You pick up speed.
When will it end?
Then you hear the screams. Chilling screams that echo through the darkness.
Oh, no! You must have picked the Doom Slide!'),
('1','122','The creature slides one step toward you, and with a burning stare says, “I am not a robot. I am not going to shut down. So don’t bother with any of your silly, human tricks!”
You stare at him. You study him hard. Is he lying? Is he a robot like the other two? Or could he be a lot more dangerous?
Your knees begin to tremble when you think about never going home — never seeing your family and friends ever again. Tears start to sting your eyes. Angry tears! No carnival — not even a Carnival of Horrors — is going to defeat you!
You stare deeply into the evil eyes of the creature hovering before you. Robot? Real monster? You finally decide!'),
('1','123','“The Final Challenge,” Big A1 announces. And the crowd goes wild.
Then he turns to you and says, “Remember — the fun games are over. Now you are playing for your life.”
“You go first,” Big A1 says to you. You see Brad and Patty taken off to the side by a huge man in a black hood.
Two red-haired dwarfs in clown costumes scurry up the steps. To your surprise, they fit you with new high-top sneakers — sneakers with metal studs running up the backs. This is going to be some kind of race, you think. But then you change your mind — when they snap a heavy, metal helmet on your head.
The crowd’s cheers grow louder. Big A1 throws a switch. The curtain behind you parts and — Whammo! The wall behind the curtain turns into a super magnet. You go zinging to the wall like a dart to a bull’s-eye.'),
('1','124','“FI-NAL! FI-NAL! FI-NAL!” you hear the crowd yelling as you spin round and round.
You’re getting dizzy. Really dizzy. So dizzy that you faint.'),
('1','125','“This way!” You wave to Patty and Brad.
The three of you turn to the left and keep running — straight into a pond!
“Why didn’t you tell us to stop?” Patty whines.
“Don’t complain to me!” you shout back. “We followed you through the fence!”
You turn around and slog your way back to shore. Patty and Brad make it there first. You are a few feet away — when you see it.
An alligator.
With its mouth gaping open — revealing two rows of razor-sharp teeth.
You freeze.
Patty spots the alligator and yells, “Quick! There’s a log! Jump on it!”
You scramble up on the log, but it’s no use. You’re still an easy target.
The alligator opens its huge mouth even wider. He slithers right up to the log. And you can tell he’s ready. Ready to crunch down on you!'),
('1','126','“Yay! Our hero!” the freaks cheer as they bolt out of their cells.
You follow the giant through a side exit. And in no time, you’re leading all your new friends to your house.
You’re sure your parents won’t mind taking them in. After all, how much can a three-hundred-pound giant, a five-hundred-pound fat lady, and a three¬ headed man eat? Hmmmm. Better not answer that question.
Just be happy that you’ve come to ...'),
('1','127','You’re not fast enough to get away from the ghost. You’re running now, but the ghost swoops down in front of you. You plow into him — and pass right through him!
The carnival people are swarming after you. They don’t want you to leave the carnival.
“Hurry!” you yell to your friends — only three minutes to midnight! You dash off in one direction, then another. The carnival people are approaching from every which way. They carry torches with flames that leap high in the air.
You steal a glance at your watch — 11:58.
“We can’t let them catch us!” you scream. “Let’s hide!”
But where can you hide? Up ahead you see a gigantic cannon. All three of you could fit easily in there.
You also spot a baby ride — the baby choo-choo train — maybe you could squeeze into that.
Quick! Pick one — and hope for the best.'),
('1','128','You squeeze into the choo-choo and scrunch down. 11:59.
Lights from the carnival people’s torches sweep over you. Their foul smell fills your lungs.
The blood pounds in your temples.
You’re sure they’re going to find you. But you’re trapped now.
There’s no way out.
You hear someone shout in the distance. “Closing time!” And then you hear a bell start to chime ...
... Midnight!
“One, two, three,” Brad counts the chimes.
You want to strangle him!
“Four, five ...”
Suddenly, the kiddie train starts to move.
“Six ... seven ... eight...”
You sit up and what you see is the biggest shock of this whole horrible night....'),
('1','129','The Monster Blood has grown so big — now you can’t see over it or around it.
“Run for your lives!” Patty screams. But reaching the door is impossible.
The mound of green slime is bearing down on you. Fast! You stand frozen to the spot. Terrified. And then — just in time — you, Patty, and Brad leap to the side. And the Monster Blood slams into the wall with a crushing force — and plows right through it.
You stare at the giant gaping hole in the wall. Quickly, the three of you jump through the opening. You are standing outside the main gate — where you came in!
There’s a wide path of destruction across the field and the forest beyond. From somewhere, a clock chimes twelve times, sending a chill down your spine. And when you peer back at the carnival, it has disappeared. All that’s left is a spooky silver mist.'),
('1','130','You and your friends squeeze into the cannon.
“Ouch! You’re sitting on my hand,” Brad whines.
But you don’t have time to apologize.
“Do you smell something ... burning?” you ask.
BOOM! There’s a tremendous explosion. You fly through space. You are headed for a fence that encloses the carnival, and the field beyond.
Will you make it out of the park?'),
('1','131','SUCKER!
You didn’t really think you could get out this easily, did you?
Check out the title of this book: Escape from the Carnival of Horrors.
Horrors! You need to face a lot more horrors — and then (maybe) you’ll escape.'),
('1','132','The fortune-teller said this number might save your life. But how?
Then you see it. In the corner. A tall silver locker with the number 132 painted in red.
“In here,” you say, opening the door to the locker. You push Patty and Brad inside.
As soon as you close the door, the locker begins to rattle and shake. You’re nearly blinded by a bright, white light. You hear a loud whooshing sound. And then all is silent. The door pops open — and you’re amazed at what you see.'),
('1','133','Those eyes behind the alligator snout — those beady eyes. You should have recognized them before. It’s Big Al.
“Hey! You did a great job here,” he says warmly. “You’ve really got the stuff for the Carnival of Horrors.”
“Uh, thanks,” you mumble. “But I really have to go home now.”
“What’s the rush?” he asks, patting you on the shoulder. “Aren’t you having fun?”
Fun? you think. Crushed between solid walls. Then attacked by a bulging¬ eyed monster. Fun? No. This isn’t fun. This is weird.
“Uh, yeah. It’s been really great. But, um, I really do have to get home,” you stammer. “So if you’ll just take me to wherever Patty and Brad are — and show us the way out — we’ll be going.”
“I’m afraid that isn’t possible,” Big Al says. “Just open the door and you’ll understand.”'),
('1','134','You’ve got to figure out what you weigh on Mars. Fast. But how?
You’re about to give up when you notice a flashing sign. It reads: the
GRAVITY ON MARS IS ALMOST 40 PERCENT OF WHAT IT IS ON EARTH. Okay, now you can figure it out.
Multiply your real Earth weight by four. Now drop off the last digit. For example, if you weigh 90 pounds, 90 x 4 = 360. Dropping off the last digit, you get 36 for your weight on Mars.
If you don’t want to do the math, you can leave it to luck. Just guess.'),
('1','135','You open the door and climb a steep ramp that curves around and around. It’s cold and dark inside. Halfway up the ramp, you stop. There’s another
sign: WARNING! — YOU MAY BE THE ONE TO SLIDE TO YOUR DOOM!
You continue up the ramp. You finally make it to the top, and find yourself standing on a wide, dimly lit platform. A row of long, curving slides stretches out before you. The slides are numbered from one to ten.
You think hard. The Doom Slide. You know you’ve heard about it before. But where? Where was it?
And then you remember! It was in a GOOSEBUMPS book you read! One Day at HorrorLand.
Now you know you’re in big trouble. Because you remember all about the Doom Slide from the book. You remember that if you pick the wrong slide, you’ll spend the rest of your life sliding and sliding — forever!
Which number is the Doom Slide? Which one?'),
('1','136', 'THE END');

INSERT INTO pages (
  book_id,
  page_number,
  page_text,
  is_first
)
VALUES
('2','1','You can’t believe your parents did this to you! 



Your mom and dad are off to Europe on a business trip. So you have to 
spend the summer in Fiskeville with Aunt Fiona and Uncle Harvey. Which 
means spending the summer with your cousins Barney and Dora. 

Which means a summer of torture. 

Barney is a year older than you and a bully. Dora is a year younger and a 
whiny pest. Not what you had in mind for your summer vacation. 

You stare glumly out the car window as your aunt and uncle drive home 
from the airport. Aunt Fiona turns around in the front seat and beams at you. 
“Barney and Dora can’t wait till we bring you home,” she squeals. 

I’ll bet, you think. Bad-News Barney can’t wait to pound me into the 
ground. Dora the Drag can’t wait to rope me into playing with her dolls. 

Uncle Harvey pulls the car into a driveway. You stare at the house. It’s 
two stories high and run-down. The lawn is choked with weeds. The front 
steps are cracked and crumbling. Not very promising. 

At least the creepy cousins aren’t around, you think. Maybe you can 
sneak off before they know you’re here. 

Then a loud bang makes you nearly jump out of your skin!', TRUE);

INSERT INTO pages (
  book_id,
  page_number,
  page_text
)
VALUES
('2','2','Barney runs out the front door, letting it slam behind him. You slowly step 
out of the car. Barney’s pudgy face breaks into a mean grin under his thick 
blond hair. Even though he’s only a year older than you, he’s twice your size. 
While your aunt and uncle unload the car, he punches you on the arm, hard. 

“Hi, wimp,” he snarls. 

Dora skips around the side of the house, holding her obnoxious orange 
cat, Puff. Dora’s dark hair hangs in two long braids over her shoulders. She 
eyes you with a smirk, then giggles. Puff hisses at you. 

What a summer! you think. Maybe you can spend your entire vacation 
upstairs in your room. 

But no. “We’ve been waiting for you,” Barney says. “Let’s play hide-and- 
seek.” 

Oh, no, you think. It’s starting. 

“It’s nice to see you’re already having fun,” Aunt Fiona gushes. “Your 
uncle and I have to go back to work at the university. I’ll take your suitcase 
upstairs for you.” 

“No, really —” you protest. “I don’t mind —” 

“Nonsense,” Uncle Harvey responds. “You kids go on and play. There’s 
just one thing. It’s very important. You can play anywhere you want, but don’t 
go in the basement.”'),
('2','3','The water bug tries to climb onto the stick. You notice that it has wings. 
Which gives you an idea. 

An idea that makes you want to hurl. 

You reach out and pat the water bug. Its body feels hard and slimy. It 
waves its antennae at you. It seems to like you. 

Great. I’ve found a new friend, you think. 

A friend who is so disgusting that now even Barney looks good! 

You pat the huge brown bug again. Then you climb onto its back. It 
doesn’t seem to mind. You grab hold of its antennae, and kick the bug in the 
sides as if you were riding a horse. 

As you hoped, it spreads its wings. 

The next moment, it’s flying! 

Up, up, up!'),
('2','4','You don’t want to get in trouble on your very first day here. You take off 
running. You notice the other kids scattering in all directions. After you’ve 
put some distance between you and the field, you glance back. By the time 
the police car arrives at the baseball field, it is completely deserted. 

Phew, you think, that was close. 

Your rumbling stomach reminds you that you are still hungry. That 
chocolate cake wasn’t enough. As you head for home, you realize that now 
even Uncle Harvey’s shoes are too tight. Your toes are scrunched up inside 
the sneakers. You walk by a neighbor’s window and catch a glimpse of your 
reflection in the glass. 

You can’t believe your eyes! 

You are at least a foot taller than you were this morning.'),
('2','5','You run down the street to the left. The number 5 bus pulls up just as you 
arrive at the corner. 

By now you’re so small that you have to stand on tiptoe to drop your 
coins into the box. And when you arrive at the university, you can’t reach the 
rope to signal for a stop. Luckily, some other people are getting out, too. You 
slip off the bus behind them. 

The university is huge. Dozens of big red-brick buildings surround a 
grassy area. People hurry along the pathways. 

How will you find your aunt? 

A sign points to the main administration building. Maybe that’s where you 
can find out where Aunt Fiona is. You head that way. Then those pink dots 
appear again. Thousands of dots. 

When your fingers and toes stop tingling, you discover that you are now 
the same height as the dandelions on the lawn! 

At the rate you’re shrinking, you might disappear before you make it to 
the main building. 

Should you run into the physics building right in front of you? Maybe one 
of the scientists will be able to help you. 

Or should you keep going to the main building to find your aunt?'),
('2','6','You want to try to talk to Barney. You watch him race for the house. 



“Stop!” you shout. The sound of your voice makes the entire yard shake. 

You pick Barney up in your hand. He screams in terror. 

“No!” he yells. “No! Put me down! Please put me down!” 

You’ve never seen him so scared before. You’ve never seen anyone so 
scared before. He really thinks you’re a mutant alien! 

“Please,” he repeats, sobbing. “I’ll do anything you say. Just don’t hurt 
me.” 

Your face is too big for him to recognize. Barney has always been so 
nasty to you that you can’t resist scaring him a little more. 

You lift him even higher, until his toes dangle above the treetops. He 
kicks and screams even louder. 

“Put me down!” he yells. “Please, please put me down!” 

“Not yet!” you thunder. Then you bring him, squirming and crying, level 
with your face. “You puny human,” you tell him. “I could smash you like a 
bug in a second. But I’ll let you live on one condition.”'),
('2','7','You scoop her up in your palm and hold her close to your face while you 
explain what happened to you. 

“I’ve seen cases like this before,” she says when you finish. “I think I can 
help.” She reaches into her robes and pulls out a small, torn brown bag. 

“Take this herbal mixture,” she instructs. “But take only a tiny part of it. 
The results can be very unpredictable.” 

You take the small bag from her hand and set her on the ground. 

“Thanks,” you say. You’re about to ask her more when she speaks again. 

“Do as I say,” she tells you. “Now, no more questions. It’s time for my 
nap.” 

You blink once and she’s gone. You almost think you imagined her. But 
the tiny brown bag sits in your hand. 

You open it. A strong, spicy scent immediately fills the air. You shake the 
contents out in your hand. A small pinch of brown-and-green powder falls 
onto your palm. There’s maybe a teaspoon altogether. 

The fortune teller told you to take a tiny amount of the mixture. But this is 
a tiny amount. And you’re so big, you don’t see how it can possibly help you.'),
('2','8','You scurry into the nearby room. 



It’s a broom closet filled with cleaning supplies. Mops and brooms hang 
on the wall. A pail that seems as big as a car sits on a shelf above your head. 

You hear the janitor’s heavy footsteps approaching. 

“In there!” the woman screams. “I saw it go in there!” 

“Don’t worry,” the janitor’s voice booms. “I’ll take care of it.” He enters 
the closet. 

You jump up and down, waving your arms. “I’m a kid,” you shout as loud 
as you can. 

The fat janitor bends down and squints at you. “Hey!” he exclaims. 
“You’re not a mouse!” 

You let out a huge sigh of relief. Finally! Someone who can help you! 

The janitor picks you up carefully by the collar and brings you close to his 
face. “I don’t believe my eyes!” he sputters. “You’re a —! You’re a — ” 

You watch the janitor’s huge eyes roll up into his head. Seconds before he 
faints, he drops you to the ground. Too bad you don’t have enough time to 
scramble out of the way. 

SPLAT! 

You’ve come to a very '),
('2','9','You hurry over to Dr. Abbott. You try shouting at him. But he doesn’t 
hear your feeble, squeaky voice. 

You try pulling on his pants cuff. But all he does is shake his leg, sending 
you flying under the table. 

How can you make him notice? Then you get a great idea. Moving 
carefully, you untie the shoelaces on both of his shoes. You’re so small that 
it’s like untying two jump ropes. 

Now, slowly, carefully, you tie the two laces together. You make a knot. 
He’s so busy working he doesn’t notice. You scramble out of the way and 
wait. 

It doesn’t take long. 

Dr. Abbott stands up. He starts to cross the room. BAM! He trips and falls 
flat on his face. 

“Hey!” he shouts angrily. “Who tied my shoes together?” 

“I did,” you reply. He’s still lying flat on the floor. You stroll over to his 
head. 

“Who said that?” he demands angrily. “Speak up!” 

“I did it,” you repeat. You’re standing in front of his face. “I’m sorry — I 
had to get you to notice me.” 

Now he focuses on you. At first he looks surprised. Then he frowns. He 
suddenly swoops his hand out to swat you.'),

('2','10','You glance up to see a woman dressed in a silver bathing suit. She’s 
hanging upside down from a high wire. One end of the wire is caught in your 
hair! 

“Hey!” she shouts at you. “Get out of my act!” 

“I’m sorry —” you apologize. “I didn’t mean to bother you.” You reach 
up and untangle the wire from your hair. The crowd goes wild. They’re 
applauding you. You smile at them and bow. 

“Here comes the owner!” the tiger trainer declares. “You’re in big trouble 
now!” 

You peer down to see a small, fat man in a clown suit approaching. He 
has a white face with two huge black eyes and a bright pink nose. 

“I’m sorry,” you stammer, bending over to talk to him. “I didn’t mean to 
min the circus. I only came here —” 

“Ruin it?” the man cuts you off. “Are you kidding? This is the best act 
we’ve had in years! How did you get so big? How did you get the tigers to 
like you so much?” 

“I can’t really explain,” you reply. “It all started —” 

“Never mind!” the clown interrupts again. “I want to hire you! When can 
you start?” 

Think quickly! The circus is a great place to hide out. But do you really 
want to spend the rest of your life here?'),
('2','11','You dive for the can. Excellent! you think. You know what Monster 
Blood is from reading GOOSEBUMPS. Monster Blood makes things grow. 
Monster Blood will make you grow. 

You hoist yourself on top of the floating can. You’re sitting on top of the 
faded label. You brush some mud off and read: monster blood, surprising 

MIRACLE SUBSTANCE. 

Slowly, you crawl down the can to the lid. The can rocks back and forth in 
the murky water. You feel as if you’re balancing on a log. The brown water 
laps over the sides of the can. 

With all your strength, you tug at the lid. It’s wedged tight. You tug and 

tug. 

You have to get it open. You know the slimy green Monster Blood inside 
will make you grow. 

You grit your teeth and give one final tug. The lid pops off and splashes 
into the water! 

You reach your hand into the can and feel ...'),
('2','12','You’ve got it! You’ll find your aunt at the university. She can get you a 
doctor’s appointment. Or maybe someone at the college will be able to help 
you. You race into the den. You search in your aunt’s desk drawer for 
directions to the university. 

Finally, you find a bus map. There are two buses that seem to go to the 
university — the number 103 and the number 5. They leave from opposite 
ends of your block. 

You don’t know which bus is best. You don’t want to wake up Barney and 
Dora to ask them. They’ve caused you enough trouble already. 

You’ll just have to guess. 

Which bus will you take?'),
('2','13','You quickly spin on your heels and sprint toward the kitchen. 

Barney lunges for you. Clumsily, he trips over his own feet and falls on 
the floor. 

Without stopping, you yank open one of the lower cupboard doors and 
wriggle inside. You’re so small now that you easily slip in among the pots and 
pans. 

Barney will never find you here! You hear him stomping into the kitchen 
just as you pull the cupboard door shut. 

“Where are you?” he demands. “You can’t hide from me forever!” 

Wanna bet, you think. 

You hear him open the door to the pantry, then slam it shut. Luckily, he 
never got a good look at you. He has no idea that you are now small enough 
to fit into this little cupboard. 

“Wimp!” Barney hollers. “You’ll have to come out sooner or later!” 

Definitely later, you think. 

You hear the TV click back on. From the sound of it, Barney’s watching a 
really noisy race-car program. This will be a great time to leave the cupboard. 
No way he’ll hear you climb out. Smiling, you prepare to climb out of the 
cupboard. 

But then, a weird and familiar feeling comes over you.'),
('2','14','Your problem is that you’re hungry. 

The plane ride to Fiskeville was a long one. All you had to eat was an 
airline snack of peanuts and a soda. And now you realize that you’re starving. 

Your stomach is growling so loudly you’re almost afraid Barney and Dora 
will hear it. 

You glance around the basement again. Maybe there are some cans of 
food. 

But no. The only shelves contain old carpenter’s tools. The only cabinets 
are full of torn and dirty sheets and towels. 

You really don’t want to go back upstairs. Not yet. Not with Barney the 
Bully and Drippy Dora waiting for you. 

What about the old refrigerator? You see that it’s plugged in. Maybe 
there’s something to eat inside. 

Trying not to get your hopes up too high, you approach the refrigerator. 
The door seems stuck. But you pull hard and it pops open. 

You spot two containers way in the back. You bend down to inspect them. 
And gasp!'),
('2','15','You peer up the stairs. The basement door leading to the kitchen is so 
small. Will you be able to fit through it? 

You start up the stairs, hoping to make it to the top before you are too big 
to get through the door. 

SMASH! Your foot crashes through the bottom step. They’re just old and 
rickety, you tell yourself. You lift up your other foot and place it on the next 
step. CRASH! 

The stairs won’t work. You glance around the basement. You’ve got to get 
out before you’re trapped inside. You have to move fast — you’re still 
growing! 

You notice a window. It will be a tight squeeze, but it’s your only hope. 
You pull open the window. You’re so big now you accidentally rip it out of its 
frame. Pieces of wood and glass fly everywhere. You start to climb through. 

You don’t really fit. But you’re already halfway out. You refuse to give up 
now. You can hear the house ripping and tearing as you push your way 
through. Broken pipes spurt water. Torn wood scrapes your skin. 

At last, you fall onto the lawn. You glance up to see a huge hole in the 
wall where the basement window used to be. 

And then you hear a piercing scream.'),
('2','16','At this size, you wouldn’t be surprised if you could lift an elephant. 

You’ll give it a try. You bow to the cheering crowd. The elephant bows 
also. 

“The Amazing Strongo!” the ringmaster cries. “The strongest human 
being in the world will now attempt to lift Dodo the elephant!” 

You approach the elephant. You study her from all sides. Finally, you 
decide the best technique would be to bend your knees and wrap your arms 
around her lengthwise. The elephant drapes her trunk around your neck and 
tickles your ear. “Cut that out,” you whisper. “Now hold still.” 

The elephant holds still. You begin to lift. The elephant is heavy — really 
heavy. You manage to lift Dodo a foot off the ground. 

The crowd is cheering you on. The elephant grunts happily. Then 
suddenly someone in the audience shouts, “Alien! Alien! It’s the alien!”'),
('2','17','Cautiously, you stick a fingertip into the purple goop. It feels soft and 
gooey, like peanut butter. 

You stick out your tongue and take a teeny tiny taste. 

Awesome flavor! It’s purple and it’s slimy, but this weird peanut-buttery 
goo tastes like a combination of every delicious dessert you’ve ever had in 
your life. 

You lick the rest of the purple goop off your finger, then you stick your 
finger back in the jar. You can’t believe how yummy it tastes. You wish the 
whole jar were full of the purple paste. 

Unfortunately, there wasn’t very much, and soon the jar is empty. 

But you’re not hungry anymore. In fact, you feel great! 

You shut the refrigerator door and flop back down on the armchair. 

A moment later you hear a loud thump at the top of the stairs. You glance 
up. Your heart sinks when you see what’s there.'),
('2','18','The porch has gotten enormous. It’s gigantic — as big as an airplane 
hangar. 

Or maybe it’s the same size. Maybe you’ve shrunk even more. Your heart 
thunders in fright as you realize you might keep shrinking till there’s nothing 
left of you. 

A thick forest of grass lies between you and the porch steps. You glance 
up at a towering yellow tree, and realize it’s not a tree at all — it’s a 
dandelion! 

You’re as small as a bug! 

Your hands tremble, and sweat pours down your face. You feel yourself 
beginning to panic. You take a deep breath. Then you sit on a leaf and force 
yourself to think calmly. 

You still need to find the refrigerator. You have to get another look at that 
jar of purple peanut butter. That’s the only way you can think of to figure out 
how to stop shrinking. And get back to your normal size. 

Even though you’re so tiny, you’re not a quitter. Finding the refrigerator 
will just be a little more difficult, that’s all. 

Feeling better, you stand up and prepare to make the long trek to the 
house. And then you hear a loud hissing sound. 

You glance up to see a pair of gigantic yellow eyes staring straight at you.'),
('2','19','You race toward the screen door. It seems miles away. 

Puff lands on the porch, then takes off after you. 

Ahead of you, the door swings shut... then opens again. The wind is 
making it swing. 

You’re almost there ... just a few more inches — 

— a heavy paw crashes down on your back. 

Oh, no! 

You feel Puff’s hot breath on your neck. In terror you glance up to see her 
sharp teeth approaching your face. 

And then, suddenly, she lifts her paw. She’s letting you go! 

You scramble to your feet and run toward the door again. You’re only 
about six inches from it when SMACK! Puff pins you again with her paw. 

Now you remember that she always plays with her prey before she kills it. 
Your only chance is to reach the door the next time she lets you go. 

But can you make it? It depends on whether this is your lucky day.'),

('2','20','You feel stranger and stranger. 

“Speak, alien!” Dr. Harlan cries. 

But your mouth won’t move. You glance down at Dr. Harlan and watch as 
he begins to grow. 

He grows bigger and bigger, faster and faster. The bakery and trees are 
also shooting up. Just watching them makes you even dizzier. 

All at once you realize that they are not growing — instead, you are 
shrinking! You’re finally returning to your normal size! Whatever caused you 
to grow is wearing off! 

In less than a minute you’re standing next to Dr. Harlan’s red van. All 
around you people are running and shouting. You can still hear the squeal of 
sirens. Dr. Harlan is speechless. He seems frozen in shock. 

Trying to appear casual, you stroll through the crowd. 

“Hey, kid!” a policeman warns. “You’d better get out of here. There’s a 
mutant alien on the loose.” 

“Really?” you reply innocently. Then you shrug. “Somehow that doesn’t 
seem like such a big deal.”'),
('2','21','While you stir the mixture, Effy adds a tiny, tiny pinch of shrink powder. 
Then you close the Dumpster’s lid and build a fire around it. 

You wait while the cake cooks. It smells awful, but you don’t care — 
you’ll eat anything if it’ll make you small again! 

At last the fire dies down. When the Dumpster is cool, you lift the lid and 
peek inside. The cake is green and lumpy. It smells like garbage mixed with 
too much cinnamon. 

You can’t wait to taste it. 

You open your mouth wide and take a big bite. It tastes even worse than it 
smells. Your mouth feels as if it’s full of slime! 

But you chew it and swallow. Then you wait. 

Nothing happens. 

“Eat some more,” Effy suggests. 

“It tastes too gross,” you complain. 

Effy holds up two beakers of liquid — one purple and one blue. “Maybe 
one of these will help. A kid I know named Kermit gave these to me. Kermit’s 
a really smart scientist.” 

You stare at the beakers and suddenly remember something. There was a 
kid named Kermit in a GOOSEBUMPS book you once read — Monster 
Blood III. And he invented a liquid that made things shrink. But what color 
was the liquid?'),
('2','22','No way are you going to play with bratty Dora and her dumb dolls. You 
cross your arms over your chest and glare at your cousin. 

“Go ahead and tell,” you taunt, “I don’t care.” 

“You’re going to be sorry!” Dora sneers at you. Then she disappears. You 
can hear her calling Barney. 

Oh, great, you think. I’m going to get pounded. 

You can hear footsteps approaching. Your eyes dart around for a place to 
hide. You fling open the refrigerator and climb inside. The door swings shut 
behind you. 

“No one’s down here,” Barney growls. 

“But, Barney, I tell you —” From your cramped hiding place, you can tell 
Dora is bewildered. You hear them clamber back upstairs. 

Fooled you! you gloat. 

But the joke’s on you. When you try to open the door, it won’t budge! 

You throw all of your weight against it. Nothing! You realize you are stuck 
inside the refrigerator. And you are running out of air. 

Frantically, you pound and shout. No one hears you. It will be hours 
before Uncle Harvey and Aunt Fiona come home from work. Barney and 
Dora are probably playing outside. 

As you gasp your final breath you realize that even playing with Dora 
would have been better than this terrible'),
('2','23','“Why can’t we go in the basement?” you ask. 

“We haven’t cleaned it out since we moved in,” Aunt Fiona tells you. 

“The people who owned the house before us were very strange. We don’t 
know what’s down there. It could be dangerous.” 

“Let’s get started!” Barney commands when his parents have gone inside. 
“You remember the hide-and-seek rules?” 

“I remember.” You sigh. Who could forget? 

“Whoever is It gets to pound anyone he catches,” Barney reminds you. 
“Fine,” you say. “I’ll go first.” 

“Sorry,” Barney replies. “It’s my house. I’ll be It to start. Now go hide 
while I count to a hundred.” He laughs as he waves his fist in your face. Then 
he shuts his eyes.'),
('2','24','You’ve decided to try to find the refrigerator. You need to get that jar. 
There may be a label on it that can tell you what to do! Or at least what the 
purple peanut butter is. 

You race to the front door. You come to a sudden stop, slapping your hand 
to your forehead. You forgot — you don’t know where the dump is. Or how 
to get there. 

Great. Your only hope is Barney. 

You’ll be nice, you decide. Polite. You’ll even beg. You search the house 
for Barney. You find him in the den, lying on the floor watching TV. 

“Hi, Barney,” you say sweetly. 

“Mmmf,” he grunts. He doesn’t even glance at you. 

“Barney —” 

“Keep it down, will you?” he growls. He’s watching King Kong. Probably 
identifying with the ape, you figure. 

“Barney, please,” you repeat. “I need to —” 

“Would you shut up?” Barney snaps. His eyes are still glued to the screen. 

Those weird pink dots are dancing in front of your eyes again. As soon as 
the tingling in your toes and fingers stops, you realize you’ve shrunk a few 
more inches. Now your head is level with the arm of the couch! When is the 
shrinking going to end? Are you going to shrink down to nothing? '),
('2','25','You have an even number of letters in your first name. You continue to 
duel with the mouse, thrusting your pin at it. You duck while the mouse tries 
to claw and bite you. 

The mouse pauses for breath. It’s just the break you need. You jab at the 
mouse, scratching it on the forearm. 

With a squeak of pain, it turns to you again. It’s really mad this time. It 
opens its mouth wide and snaps at you. 

You rush to the other side of the cupboard, but the mouse follows. Your 
only hope is to try to escape through the mouse hole. 

You dive for the hole. The mouse is right behind you. You feel your head 
go through. You see green grass beyond — and freedom! Now your shoulders 
squeeze through the hole — but then you become stuck. You can’t go any 
farther forward. You try to wriggle back out, but it’s no use. 

The mouse is right behind you. You can feel its hot breath on your legs. 

If only you could shrink, just a little more! 

Unfortunately, there won’t be time. 

Too bad — looks like you lost this duel to the mouse. If you can’t smile 
about it, try saying “cheese.” '),
('2','26','You glare across the ballfield at Barney. You aren’t going to let him keep 
you from joining the game. 

You’re in luck — you won’t have to fight him. 

“Wait a minute, Barney,” says a chubby kid with blond hair. “This new 
kid isn’t a shrimp. Come on,” he tells you. “You can be on our team.” You 
stick your tongue out at Barney and join the other team. You just hope they 
don’t hate you when they discover the terrible truth. 

You’re the strike-out champ. 

“Come on, kid,” the chubby boy says. “You’re up.” 

You’ll give it your best shot. You take the bat and step up to the plate. You 
gaze at the pitcher, a mean-looking red-haired girl. You grip the bat tightly 
and wait for the pitch. 

“Strike one!” cries the umpire. 

You can’t strike out, you think. Not with Barney’s beady eyes trained on 
you. You concentrate on your next swing. 

The pitcher zooms a fastball at you. '),
('2','27','Your big, mean, obnoxious cousin is looming over you. 

“Found you!” Barney exclaims. “Now I get to pound you!” 

You leap to your feet, but it’s too late. Barney grabs you by your T-shirt. 

“Let me go!” you shout, but it’s no use. Barney has always been the 
meanest bully you’ve ever known. For years you’ve dreamed of being able to 
beat him up. 

“What’s the matter, wimp?” Barney taunts. “Afraid of me?” 

“No!” you exclaim. You wish you meant it. 

Barney punches you in the shoulder. You know it will make things worse, 
but you punch back. To your surprise, Barney lets go of your T-shirt. He 
stumbles backward a few steps. 

“Ow!” he cries. “I didn’t know you could hit that hard!” 

Neither did you! This could come in handy. You give Barney a karate 
chop in the arm. 

“Stop it!” he cries. He starts to run. You can’t believe it! Barney is 
mnning away from you! 

Maybe this visit will be different, you think. 

You figure it’s safe to go back to the house. Barney probably won’t bug 
you anymore. You take two steps and you hear a weird ripping sound. Then 
you trip and fall over! 

What happened? '),
('2','28','You grab the beaker of purple liquid and pour it on the cake. The liquid 
quickly seeps through the cake, turning it a weird lavender color. You take a 
big bite. 

Then you wait. 

And wait. And wait. 

Suddenly, your teeth start to chatter. Your knees begin to knock. Your 
body sways back and forth. 

It’s working! you think. It’s finally working. 

Your teeth chatter faster and faster. You’re afraid your fillings will fall 
out. 

Then your body quiets down. You glance around. You’ve returned to 
normal size again! 

“Hey, Effy!” you cry. “Look at me!” 

You try to run over to Effy. But you can’t. You can’t bend your arms. Or 
your legs. What’s going on? Your neck is incredibly stiff, too. 

“Oh, dear,” Effy says. “I guess the purple liquid was the wrong one. 
You’ve been turned into a gingerbread man.” 

“What?” you cry, suddenly noticing your colorful icing clothes. 

“Don’t worry,” Effy says. She leads you inside the bakery. “Gingerbread 
cookies are big sellers this year. I’ll put you front and center in the display. 
I’m sure I’ll find a new home for you before you get too stale!”'),
('2','29','Something in the refrigerator smells great! It smells so good, your mouth 
starts watering. 

You were hungry before, but now you’re ravenous. 

Whatever is giving off the smell must be the best-tasting food in the 
world! 

You pull out the two containers and examine them. One is a small jar. At 
the bottom of the jar is a glop of disgusting-looking purple goop. The other 
container is a white bakery box with a label that says effy’S bakery, midvaee 
in fancy writing. 

Inside the box is a thick slab of chocolate cake. 

You lean down and sniff. To your surprise, the delicious aroma is coming 
from the purple goop. It smells like a combination of the best peanut butter 
and jelly in the world, with chocolate on top. 

The cake doesn’t have any smell at all. 

Your stomach growls again. 

Which will you eat? The wonderful-smelling purple goop or the chocolate 
cake? '),

('2','30','You were born in one of the first six months of the year. You jump as hard 
as you can onto button number six. 

For a moment nothing happens. Then the laser begins to buzz. You turn 
and stare as the machine glows green, then white, then yellow. You suddenly 
feel very sleepy. So sleepy that you have to take a nap. 

When you awaken, you find yourself curled up on the lab table, wearing a 
white lab coat. You stretch and yawn. You feel strange. You feel big. You 
stand up and notice that you’re much taller than you’ve ever been. You rush 
to the window and gaze into the glass. 

Dr. Abbott’s face gazes back at you. 

You glance at your hands. They’re hairy adult hands. 

Now you glance around the lab. With shock, you see a kid sleeping on a 
chair. The kid’s eyes slowly open. There’s something very familiar about this 
kid.... 

The kid is you!'),
('2','31','Puff lifts her paw again. 

You immediately wriggle free and rush toward the door. 

Just as you reach the door, the wind blows it open even wider. 

Oh, no! Puff will be able to follow you inside! 

But you have no choice. You scoot through the opening. 

Puff is right after you — but the wind shifts just in time. 

The door slams shut in the cat’s face. 

“MEOOOWWWR!” she protests. She glares at you through the screen. 
She hisses in anger. 

“Too bad, kitty,” you tell her. “Better luck next time.” 

But it’s not over yet. You still have to figure out how to get back to 
normal! '),
('2','32','As fast as you can run, you head for Midvale. The police cars speed after 
you. To your left is the highway. To your right is the river. 

You get an idea. You stop running and step over the river. The police cars 
all come to screeching stops. With squealing tires, they make sharp turns and 
speed back toward the nearest bridge. You smile to yourself. You have plenty 
of time now. 

Soon you approach Midvale. Quickly, you scan the business district. 
There it is — Effy’s Bakery, a small, gray wooden building. 

The residents of Midvale scream and run when they see you. You don’t 
care. All you care about is finding Effy. As you approach, delicious smells 
pour out of the tiny building. 

Using your little finger, you gently tap on the door. 

A plump, gray-haired lady comes to the door. You expect her to scream, 
but she doesn’t. Her tiny head tips backward as her eyes travel up, up, up, to 
meet yours. 

“May I help you?” she asks. 

“I hope so,” you reply. You explain your problem. “I think your cake 
caused it,” you finish. 

“So that’s what happened to the chocolate cake,” she says.'),
('2','33','You’ve decided to try the new reducing machine. Arnold leads you to a 
room full of equipment. He takes you to the largest machine. 

“This is the Super-Duper-Reducer,” he says. 

The machine is so big it nearly touches the ceiling. It has levers and straps 
and weights. There is a bench with padding and a seat belt. It looks like some 
kind of torture device from an old horror movie. Maybe this wasn’t such a 
good idea. 

But before you can change your mind, Arnold pushes you onto the bench. 
You lie on your back, looking up into the twisted metal of the device. 

Arnold places your head in a big steel helmet. You can’t see anything. 
Only your mouth is exposed so you can breathe. He puts straps around your 
head, your wrists, and your ankles. Then he turns the machine on. 

With a loud whirring sound, the machine begins to shake. The straps pull 
your arms back and forth, making them flap like wings. Some kind of pulley 
system yanks your legs up and down, making you kick like you would if you 
were swimming. At the same time, the helmet makes your head vibrate. 

After several minutes the whirring stops. Your legs and arms stop moving. 
Arnold removes the helmet and unstraps you. 

Did it work? Are you smaller?'),
('2','34','You race down to the basement and open the refrigerator. The empty cake 
box is still sitting next to the jar of purple goop. You examine the cake box 
but there is no list of ingredients, just the name of the bakery. Frustrated, you 
shove the box back onto the shelf. The purple-peanut-butter jar rattles. 

Then you have a crazy thought. If the cake made you grow, could the 
peanut butter make you shrink? It worked for Alice in Alice in Wonderland. 
Some food made her big, some food made her small. 

You might as well try. You grab the jar and take a big spoonful of the stuff 
and swallow it. It tastes AWFUL! It’s like a combination of brussels sprouts 
and liver. You force yourself to swallow all the goop in the jar. Will you 
shrink? 

You feel an odd tingling sensation all over your body. 

It’s working! you think. I’m getting smaller! 

But then something bumps your head. You glance up to see the ceiling — 
an inch from your nose. What’s going on? 

The refrigerator is far below you. All the furniture looks as if it belongs in 
a dollhouse. Somehow, you’ve grown another two feet! The purple goop 
didn’t make you shrink after all! Instead, it made you grow even faster! 

You’re so big now you might not even be able to get out of the basement!'),
('2','35','You figure it’s too early in your visit to get into trouble. 

“All right, all right. Where’s the dollhouse?” you ask Dora. 

“Out on the porch,” your cousin answers. “Follow me.” 

You start to follow Dora up the stairs when, suddenly, you have to stop! 

The strangest sensation comes over you. Your toes and fingers tingle and 
little pink dots swim before your eyes. 

“Come on!” Dora whines from the top of the stairs. “You said you’d 
play.” 

You shake your head and everything is back to normal again. That was 
weird, you think. Maybe you just stood up too fast. 

Dora stamps her foot impatiently. “Do I have to sic Barney on you?” she 
warns. 

“I’m coming! I’m coming!” You bound up the stairs. You feel a little 
tired. Those stairs must be steeper than they look. 

You follow Dora out to the porch and sit beside her in front of the 
dollhouse. You have to admit, the dollhouse is pretty cool. It’s three stories 
high and filled with miniature furniture. There’s even a tiny piano and a little 
guitar. 

You reach into the dollhouse to move a chair. As you do, you notice 
Dora’s eyes open wide in surprise.'),
('2','36','It’s Dr. Abbott! A teeny tiny Dr. Abbott! 

“Look what’s happened!” Dr. Abbott calls from the floor. “I used the 
wrong settings. Now I’m small, too!” 

Great, you think. What now? 

“Don’t worry,” Dr. Abbott assures you. “I’ll be able to return us both to 
normal size. We have to reverse the settings on the laser gun. But we need the 
remote. Where’s the remote?” 

You scan the laboratory for the remote. “I see it!” you cry. “It’s on top of a 
glass beaker on the next lab table over.” 

“It must have been thrown out of my hand when the room started 
shaking,” Dr. Abbott tells you. “It will take both of us to change the settings.” 

“But how can we reach it?” you ask. 

“I’ll climb up the table leg,” Dr. Abbott says. “Do you think you can jump 
to the next table?” 

The tables are only a foot apart. But twelve inches is a big distance to 
someone as tiny as you. You approach the edge of the table and glance down. 
The floor is a long way down. If you fall, you’ll probably break every bone in 
your body. 

Maybe, instead of jumping, you should climb down to the floor and then 
up the other table leg. What do you think?'),
('2','37','You steer toward the quiet pond. The water seems thicker and dirtier here. 
Your Popsicle-stick boat moves slower and slower. 

You approach the large brown insects. 

And now you see them up close. 

They’re slimy, huge water bugs! They have long, waving antennae and 
fierce-looking jaws. They’re about four times bigger than you. Even if you 
were your normal size, these bugs would be huge! 

“EEEEEWWWWW!” you cry. You can’t help it. You’ve always found 
water bugs disgusting. And now here they are all around you. It’s your worst 
nightmare. 

The big brown bugs climb up the walls and on the ceiling of the sewer. 
They swim in the water alongside you. They make hideous clacking noises. 
They’re everywhere. 

Now one of the bugs swims closer to you. Its long, slimy antennae reach 
out toward the Popsicle stick. Its disgusting, hairy legs paddle through the 
water. 

The bug’s beady black eyes focus on you. And now it’s — oh, no! It’s 
trying to climb up on the Popsicle stick next to you! 

GROSS!'),
('2','38','You quickly duck inside the big top. It’s incredibly noisy. You hear 
clapping, laughing, and the roars of wild animals in the ring. Even though 
you’re gigantic, no one notices you at first. They’re too busy watching the 
circus. 

In the center ring, a man dressed in white is surrounded by five tigers. The 
tigers sit on colorful stands. The man is making them do tricks. While you 
watch, a tiger jumps through a flaming hoop. 

The crowd applauds. The man in white makes the tiger bow. But then, 
instead of returning to its stand, the tiger rushes out of the ring. 

And it is running straight toward you!'),
('2','39','You need help and you need it now! 

You dash to the physics building. You scramble up the single step just as 
someone opens the door. Quickly, you scamper inside. You stop a moment to 
catch your breath. Being tiny sure is tiring! 

You scurry along a long hallway searching for someone who can help 
you. Men and women come and go all around you. But they don’t look down 
at their feet, so they don’t see you. 

“Help!” you cry. “Can someone help me?” 

A woman hears you and glances down. “AAAK!” she cries. “A mouse!” 

“Where?” you squeak, glancing around. And then you realize that she 
means you. You’re so little she thinks you’re a mouse! 

“Kill it!” the woman shouts. “Someone find the janitor!” 

You’d better get out of the hall — quick! Two doors are standing open. 
The one at the far end of the hall is labeled dr. abbott’S lab. Can you make it 
there before the janitor comes? Maybe you’d better enter the unlabeled door 
right next to where you’re standing.'),

('2','40','You just aren’t strong enough to lift the elephant. 

You struggle and strain and huff and puff, but it’s no use. The audience 
boos and the clowns throw water balloons at you. Even the elephant looks 
disgusted. You are chased out of the ring by a bunch of clowns driving a tiny 
car and throwing confetti. 

But don’t be too upset. 

You still wind up working with your new friend, the elephant. In fact, you 
are put in charge of one of the most important jobs at the circus. You are 
responsible for keeping the circus environment clean. 

That’s right! You and your shovel have come to the tail end of this tale. 

No one ever said all of show business was glamorous. And you’ve made 
it into the Big Time in the Big Top! 

So, you are now spending a lot of time at the elephant’s'),
('2','41','You’re so big now you take giant steps. It doesn’t take you long to 
outdistance the police cars and helicopters. 

But you’re much too big to hide anywhere. 

You’re going to have to find help. 

But where? The police think you’re a mutant alien. Your relatives are 
afraid of you. Who could possibly help you? 

You think back to when your troubles started. If only you hadn’t eaten 
that piece of chocolate cake. That must have been what caused you to grow. 
You can’t think of any other answer. 

You have to find the person who made the cake. It’s the only solution. 

But who made the cake? 

You close your eyes, trying to remember the name on the cake box. Was it 
Effy’s Bakery, Midvale? Or was it Maddy’s Bakery, Elmville? 

If you remember, you know exactly where to go. If not, you’ll have to 
guess.'),
('2','42','“I surrender!” you say to Dr. Harlan. 

But you’re so big that your voice sounds like the rumbling of thunder. No 
one can understand you. 

“Surrender or we’ll capture you!” Dr. Harlan repeats. “One —” 

“I surrender!” you repeat. 

“Two!” 

How can you make him understand that you’re giving up? In desperation, 
you raise your hands high in the air. 

Unfortunately, a helicopter was buzzing above you at just that moment. 
Your hand brushes against it, and the small chopper falls to the ground. 

“It’s attacking!” the scientist screams. 

“Wait!” you cry. “It was an accident!” Your voice is so loud that the 
windows in all the police cars shatter. 

“Hit the ground!” Dr. Harlan ducks under the van. “It’s after us all!” 

“No!” you cry. You get down on your knees and try whispering. “You 
don’t understand!” you say. The breath from your whisper blows over a tank. 

“Go to Plan B!” Dr. Harlan cries. What’s Plan B? you wonder.'),
('2','43','Nothing. 

You lie on your stomach and peek your head into the opening of the can. 
You can’t believe your eyes. 

The can is empty! 

No Monster Blood! No miracle substance. No nothing! 

The can quickly fills with the brown slimy water. You hold on tight as the 
can starts to go down. 

Down. 

Down. 

Well, sailor, it looks as if you’ve made the wrong choice. You are sunk!'),
('2','44','You take a deep breath and dash for the dollhouse. 

Behind you, Puff pounces and lands on the porch. She immediately 
bounds after you. 

You feel her hot breath on your neck as you pull open the front door to the 
dollhouse. You throw yourself inside and slam the door. 

“MEOWWWWR!” Puff screams in frustration. 

You peek through one of the windows to see her glaring at you. She tries 
to stick her paw in through the window, but her paw is too big. 

You glance around. It’s a pretty nice dollhouse, with comfortable 
furniture. Too bad the miniature TV doesn’t work. 

You explore the rest of the dollhouse, but it’s just more doll rooms. A doll 
family sits in the kitchen. But the refrigerator is fake, and so is the food. 

You flop down on the blue-and-white striped sofa and glance through the 
window. Puff paces back and forth in front of the dollhouse. 

She knows you’re inside. You don’t dare leave as long as Puff is out there 
waiting for you. 

Then you hear something that gives you hope.'),
('2','45','“SQUEAK!” the mouse repeats. Then it jumps on you. 

“Hey!” you cry. You find yourself buried under mouse fur. The mouse’s 
snout is right in your face — and its breath is hot and sour. “Let me go!” you 
yell. 

The mouse squeaks again, more quietly, and then it licks your face. Is it 
getting ready to eat me? you wonder. 

No, it’s washing your face. When it’s done, it begins to wash the rest of 
your body. Then it picks you up in its warm, moist mouth. Its teeth hold you 
firmly, but don’t hurt you. 

The mouse carries you back through the mouse hole to a crawl space 
beneath the house. And now you see where it’s headed: a soft gray nest made 
out of fur, twigs, and grass. Nestled in the nest are three small, gray baby 
mice. Each baby mouse is about the same size as you. 

“No!” you cry. But the mouse doesn’t listen. It gives you another lick. 
Then it drops you in the nest, next to its children. 

It seems that the mouse has decided to adopt you. 

But cheer up — things could be worse. You’ll be warm here, and you’ll 
have plenty to eat — as long as you like cheese and bread crumbs. 

The toughest challenge will be learning to stay quiet as a mouse.'),
('2','46','The warm feeling spreads through your whole body. Your muscles tingle 
and the ground starts shaking. You hear a low rumbling sound. 

Now the tree branches begin to whip past your face. 

You glance up to see that the trees are once again over your head. The 
growth formula has finally worn off! You’re back to your normal size! 

Unfortunately, your hands are still gripping Barney’s shoulders. Barney’s 
mouth and eyes are open wide. He looks as if he’s in shock. But as soon as 
you let go, he glares at you. He is angrier and meaner-looking than you’ve 
ever seen him. 

“YOU!” Barney shouts. “The alien was just shrimpy stupid you!” 

You take a baby step backward. “Uh, Barney ...” you begin. 

He doesn’t let you finish. 

“What was that about a promise, wimp?” he snarls. 

“Uh ... nothing,” you reply, starting to back away faster. 

“How’s this for a promise, cuz,” he sneers. “I promise to pound you!” 

You’re glad to be small again. But you wish the formula had lasted just a 
little bit longer. At least long enough to have escaped from Barney. 

Oh, well. It looks like your chance to get even with Barney has come to'),
('2','47','Are you serious? 

Are you really so wimpy you won’t go into the basement? 
Just because your aunt and uncle told you to stay out of it? 
Just because it might be dangerous? 

Get real! 

Return to PAGE 108 to choose again. '),
('2','48','You wait in terror for the lizard’s tongue to scoop you up. 

But nothing happens. After a moment, you cautiously open your eyes. A 
few inches away, the lizard is calmly munching on what remains of a 
grasshopper. 

It wasn’t after you after all! You glance around at this new part of the 
dump. Just beyond the lizard, leaning against a large boulder, is a big white 
refrigerator with no door. It looks just like the one your aunt had in the 
basement! 

You race over to the refrigerator. Is this the right one? Is the purple- 
peanut-butter jar still inside? 

You’re much too little to see what’s on the shelves. You’ll have to climb 
in to find out. But how? 

You search through the garbage surrounding you and find an old piece of 
kite string. To you, the string is as thick as a rope. It gives you an idea. You 
discover a rusty safety pin. You tie the string to the safety pin. 

Then you twirl the pin over your head. Just like the rock climbers use, you 
think. When the pin is spinning really fast, you throw it up toward the 
refrigerator shelves. 

Did it catch? '),
('2','49','You get an idea. An excellent idea. In Alice in Wonderland, some foods 
Alice ate made her grow big, other foods made her small. Could the peanut 
butter and the chocolate cake work the same way? Maybe that’s why they 
were together in the refrigerator in the first place! 

Besides, you’ve got nothing to lose. 

You look inside the box. It’s empty, except for one chocolate crumb and a 
tiny smear of icing. 

You’re not very big. Maybe it will be enough. 

But which will you eat? The crumb or the icing?'),

('2','50','You run to the bathroom. The mirror is even higher than it was last night. 
You have to stand on a stool to peer into it. 

It’s true. You look the same, but you’re definitely smaller. Getting 
dressed, you notice that none of your clean clothes fit. They’re all much too 
big — except the jeans and T-shirt you wore yesterday. They’re smaller, too. 
Whatever made you shrink also made them shrink. But what was it? 

“Yesterday. Yesterday,” you mutter. You pace around the room trying to 
remember everything you did in the last twenty-four hours. You’re so freaked 
out, it’s hard to concentrate. 

“Okay,” you say to yourself, trying to calm down. “I’ve been on airplanes 
before, and I’ve never shrunk. I’ve had my aunt’s cooking before, so it’s not 
what I ate for dinner....” 

Suddenly, you snap your fingers! 

You’ve figured it out! The purple peanut butter! You’ve never had 
anything like that before. In fact, you’re not even sure what that purple goop 
was. 

You better find out — and fast! 

You race downstairs and straight to the basement. But when you yank 
open the basement door, your heart stops!'),
('2','51','You sprint out of Dr. Abbott’s reach. “Please don’t hurt me,” you beg. “I 
need your help.” 

“How can I hurt you?” he replies angrily. “You don’t exist.” 

“What do you mean?” you demand. 

“I’ve been working too hard,” Dr. Abbott mutters. “I’m starting to see 
things.” He sits up and unties his laces, then reties his shoes. He rubs his eyes. 

“I’m a real kid,” you insist. “You’re not imagining me. I’m really here.” 

He eyes you suspiciously. You try to look as real as possible. “I know!” 
you cry. “Ask my Aunt Fiona. She works right here at the university.” 

“You have references?” the scientist asks incredulously. 

“Please! You have to believe me.” Quickly, you explain what’s happened 
to you. “I think it was the purple peanut butter I ate,” you finish. “But 
whatever it was, I keep on shrinking. If you can’t help me, I’m afraid I’ll get 
so small I’ll disappear.” 

Dr. Abbott stares at you in silence. Then, suddenly, his mouth turns up in 
a big smile. “Kid,” he says, “you’ve come to the right place!”'),
('2','52','A Popsicle stick floats right up to you. 

You climb onto it. At least you don’t have to tread water anymore. 

But how will you get out of the sewer system? 

You notice a toothpick floating by. You reach out and grab it. Using it as 
an oar, you begin to paddle your Popsicle-stick boat swiftly through the 
current. 

After a few smelly minutes, you hear splashing ahead. The splashing 
sound grows into a roar. You glance up to see white water. The current is 
mshing into a waterfall! 

Off to one side is a swirling pool. It looks safer than the waterfall. But the 
pool is swarming with large brown insects. 

What a disgusting choice!'),
('2','53','You decide to just head straight home. It’s been a long day. You don’t 
need anything else exciting to happen to you! 

On your way home, you pass by a pay phone. 

CLANK! CHINK! CLINK! CLACK! 

You find yourself covered in coins. 

By the time you’ve reached your uncle’s house, seventy-three dollars in 
change is stuck all over your body. 

The extra money could come in handy, you think. If anyone asks where 
you got it, you’ll say you just found some extra change in your pockets ... in 
your shirt... in your socks ... on your elbow ... on your knees ... 
'),
('2','54','It’s a circus! 

There will be people of all sizes at the circus, you figure. And the big top 
is large enough to cover you, and there are several smaller tents besides. 
You’re sure you could fit inside any one of them. 

You leave the highway and start running through a field. You frighten 
several horses and half a herd of cattle, but then you safely reach the circus 
grounds. 

But you are still being hunted. 

The police cars and helicopters aren’t far behind. Quick! Which tent will 
you enter? '),
('2','55','The lizard slithers out of the refrigerator. It’s already as big as a Great 
Dane. It starts to follow you. 

Terrified, you start to run. But it steps in front of you. 

“Back!” you tell it. “Get back!” 

You search frantically for something to use as a weapon. Just as you reach 
out to grab a rusty car door, the lizard stretches its head toward you. Its long 
tongue darts out. 

But instead of trying to chomp you, it licks your hand. It wags its long, 
skinny tail. It isn’t going to eat you. It likes you! 

The lizard follows you all the way home. It’s very friendly. You discover 
it really likes to play “fetch.” You can’t help noticing, though, that every time 
it comes back with the stick you’ve thrown, it has grown a little bigger. 

By the time you reach your aunt and uncle’s house, the lizard is the size of 
an elephant. 

“Hey, wimp!” Barney calls from the porch. “Where have you been?” 
Suddenly, his eyes widen and his mouth drops open. He’s just noticed your 
new pet dinosaur. 

The lizard hisses at your cousin. You pat its scaly back. “Easy, boy,” you 
say soothingly. 

“Wha-what’s that?” Barney stammers. 

You smile at him sweetly. “Barney, meet my new bodyguard.” '),
('2','56','You gaze at the tigers. They gaze back at you. They look just like 
overgrown pussycats. 

You reach down and scratch one of the tigers behind the ears. It arches its 
back and rubs against you, purring. The other four tigers jump off the 
platform and run up to you. All they want is to have someone treat them 
nicely. 

“What are you doing?” Tombo screams. “You’re ruining my tigers!” 

You ignore him. You sit down on the dirt floor. The tigers all crawl into 
your lap. You pet them. They lick your hands and face. The crowd loves it. 
They cheer even louder than they did for Tombo. 

“You see, Tombo?” you say cheerfully. “You should be kinder to your 
tigers.” 

You’re having a great time. You’re even going to get paid. What a life! 

In fact, everything is purr-feet until your hands and feet start to feel 
warm. The feeling moves up your arms and legs. Soon your whole body feels 
as if it’s on fire. 

What’s going on? you wonder. 

You’re not on fire — you’re shrinking! What a time to grow small again! 

Just when you have five tigers on your lap!'),
('2','57','How can I make that jump? you wonder. 

You gaze around desperately. And then you spot something that might 
help. A pencil. It’s twice as tall as you are — just the right size for a vaulting 
pole. 

You’ve never vaulted before. But you’ve seen athletes do it on television. 
You grasp the pencil, point side up. Then you take off running toward the 
edge of the table. 

Please let this work, you pray. Just before you reach the edge, you jam the 
eraser end of the pencil down on the table. Then you leap. 

You sail through the air. You don’t look down. 

Hooray! You land on the other table! A moment later Dr. Abbott 
scrambles up beside you. 

“The remote’s over there,” you tell him, pointing. The remote is balanced 
across the top of an open glass jar. 

The two of you make your way across the table. Dr. Abbott is a very 
messy worker. The table is covered with junk. You have to detour around 
dirty coffee cups. You scoot around piles of books. You’ve almost reached the 
jar when you trip over a big paper clip. 

At last you reach the glass jar. The remote sits on top of it, way beyond 
your reach. Was it all for nothing?'),
('2','58','Somehow, you have to get to the dump and find the refrigerator. It’s your 
only hope. But how will you do it? It would take you weeks to walk. And you 
can’t call a taxi — even if you could reach the phone, you’re too small to dial. 

There’s only one answer. Somehow you must get help from your dear, 
disgusting cousins. 

You head for the living room. Dora and Barney are sprawled on the floor, 
watching television. 

“Dora! Barney!” you yell as loud as you can. 

But it’s no use. Your voice is too feeble to be heard. 

You approach Dora and tug on her shoe. She doesn’t even notice. She 
yawns and gets up. “This is boring,” she announces. You’re still holding on to 
her shoelace when she begins walking. You grab on tighter to keep from 
getting squashed. 

She stops in the bathroom, and stands in front of the mirror. You glance 
up to see her reach into the medicine cabinet. She pulls out a small box. 

You get an idea.'),
('2','59','You roll yourself into a ball and brace for a hard landing. But you’re so 
small now, and so light, that you float like a feather. 

The next thing you know, you’re standing in a dense jungle of grass. You 
notice disgusting smells — rotting food, moldy furniture, mildew, and decay. 
But you don’t care. Somewhere out there is the refrigerator with the solution 
to your problem. 

All you have to do is find it. 

You begin trudging through the tall, tall grass. You reach the top of a hill. 
On one side of the hill is a gigantic pile of twisted metal forms. They appear 
in all different colors: blue, red, green, yellow. Many of them are covered 
with rust. 

On the other side of the hill is a thick jungle of vines and weeds. You 
can’t see what might be dumped among them. 

You’re trying to decide which way to go when you hear a strange, loud 
noise. It sounds like a HISSSSS! 

You glance around, then gasp in shock. 

Approaching you through the grass is ... a dinosaur!'),

('2','60','You head for the jungle of weeds. The lizard runs after you. 

It’s hard to move quickly through the thick, tall grass, but you’re 
desperate. You pass piles of garbage, broken appliances, rotting mounds of 
black ooze. You detour around slimy pools bubbling with the scent of rotting 
food. 

Then your feet slip out from under you on a pile of slick, yellow mold. 
You tumble down a slope, unable to break your fall. You stop rolling at the 
bottom of the hill. You glance up to find the lizard staring down at you. It 
opens its mouth wide. Its mouth is so big you know it could swallow you in 
one bite. 

Then it flicks its tongue out, straight toward you. 

You close your eyes. 

Are you about to be lizard lunch? '),
('2','61','Arnold’s could be just what you need. You are getting too big, and your 
clothes do seem to be shrinking. You ask the bus driver for directions. 

A few minutes later you find yourself in front of a sleek low building. 
Arnold’s reducing spa is spelled out in neon. 

Hmmmm, you think, not exactly what you had in mind. But you might as 
well give it a shot. Especially since you realize that you’ve grown another six 
inches on the way over. 

You wonder why you don’t feel anything — no tingling, no aching, no 
dizziness — when you grow. You have no way of knowing when it’s 
happening. You hurry through the glass doors. A muscular blond man 
approaches you. “Hello,” he greets you. “I’m Arnold. What can we do for 
you?” 

“I’m getting too big,” you explain. “Can you help?” 

Arnold flexes a muscle and then beams. “Of course we can help,” he tells 
you. “At Arnold’s we pride ourselves on returning our customers to their 
original sizes. And we are offering a free one-day trial membership.” 

This sounds promising. 

“You might try the steam room. Many members have found it helped 
them lose weight,” Arnold suggests. “Or our new reducing machine. We 
haven’t tried it yet — you could be the first.” '),
('2','62','“What do you mean?” you ask. 

“It was a special cake I made for a client who was too short. But another 
customer picked it up by mistake. When I called her, I found out she had 
moved.” 

Now you know how the cake ended up in your uncle’s basement. “Well, it 
worked,” you tell her sadly. “It worked too well.” 

Effy looks you up and down and then nods. “I must have put too much 
growth spice in it,” she tells you. 

“Is there any way you can reverse it? Can you bake a cake that will make 
me small again?” you ask. 

Effy thinks, frowning. “I’ll try,” she agrees. “But it’ll have to be a huge 
cake. You’ll have to help me.” 

Gladly, you agree to help. First, Effy leads you to a huge Dumpster 
behind her bakery. “Here’s where I get rid of my mistakes,” she tells you. The 
Dumpster is full of moldy, strange-shaped cakes. 

After you clean out the Dumpster, Effy brings fifty bags of flour and 
spices. You empty them into the Dumpster. She climbs on a ladder and breaks 
a hundred eggs into the flour. Then she adds seven gallons of water from a 
garden hose. 

“And now,” she says, “for the shrinking powder....”'),
('2','63','With a whine, the magnetron stops vibrating. You try to sit up. Then you 
notice that the gigantic metal tube has shrunk. 

Suddenly, it fits snugly all around your body! 

“Congratulations,” Dr. Abbott tells you. “It worked!” 

Now you realize that the tube didn’t shrink — you grew! You’re back to 
your regular size! 

You’re also stuck in the tube. Dr. Abbott fiddles with some controls on the 
magnetron. The two sides of the tube pop apart so you can climb out. But you 
notice something odd. 

“My skin is sticking to the metal,” you tell the scientist. 

Dr. Abbott frowns. “Don’t worry about it,” he says. “That’s just a side 
effect of the treatment.” 

You thank the scientist for his help. Dr. Abbott smiles and walks you to 
the front of the physics building. “We’ll be in touch,” he tells you. “I’ll need 
to write this up for the scientific community.” As you’re about to step outside, 
he stops you. 

“My keys!” he exclaims. “You’re walking off with my keys.” 

You glance down and notice a ring of keys plastered to your jeans. You 
pluck them off and hand them to him. 

Strange, you think. But what happens next is even stranger.'),
('2','64','The growling turns to a nasty snarl. You feel a stinging on your ankle. 
You glance down to see the neighbor’s dog, a rottweiler, attacking you. 
You’re so huge it’s like being attacked by a cricket. 

You ignore the dog. You find more pieces of the roof and try to place 
them on the house. 

There are still pieces missing, but it doesn’t look so bad now. You dust 
your hands off and stand up. But now you hear a new sound behind you. 

You turn around to see dozens of people approaching. They’re holding 
golf clubs, kitchen knives, brooms, and shovels. They look frightened but 
determined. 

Not good. 

“Hi,” you say, trying to sound friendly. “I’m sorry I wrecked your roof. 
It’s almost as good as new now.” 

The man whose roof you damaged shakes his fist at you. He holds a 
garbage-can lid like a shield. “This is the alien!” he yells to the others, 
pointing at you. “That’s the alien that destroyed my house!” 

The others shriek and shake their weapons at you. “Get out of here, 
alien!” they shout. “Get out and don’t come back!” 

Maybe that’s not such a bad idea. You’re not sure where to go. But you’ 
definitely not welcome here.'),
('2','65','Then Dora’s smile twists into a horrible grimace. 

“Alien!” she shrieks. “The mutant alien!” The people in the front rows 
scream. They climb over their seats to get away from you. 

“Dora, I’m your cousin!” you shout. You try to wriggle out of the 
powerful grasp of the elephant’s trunk. But Dodo’s clutching you too tightly. 

“How could you be my cousin?” Dora is sobbing. “No! No! You’re an 
alien!” 

The crowd frightens Dodo the elephant. Dodo drops you. Right on top of 
a cotton-candy machine. You are covered with the sticky pink stuff. 

It’s no use. No one will listen to you. You duck out of the tent and take off 
mnning. 

I can cover more ground than anyone else, you reassure yourself. I’ll be 
far away from that angry mob in no time. 

And then you hear the sirens. '),
('2','66','You reach the bus stop just as the bus for home pulls up. You try to drop a 
coin in the slot, but it sticks to your hand. The bus driver has to pull it away 
from your skin. 

You have a growing suspicion that you know what the side effect of the 
magnetron treatment might be. When you find yourself stuck to the metal seat 
at your stop, you’re sure. 

The magnetron restored you to your normal size, all right. But it also 
changed your magnetic field. Somehow, it’s turned you into a human magnet! 

Metal is now attracted to you. As you stroll home from the bus stop, metal 
objects jump off the sidewalk onto your legs. Parking meters and lampposts 
bend in your direction as you walk by. They look as if they are bowing. 

This is kind of cool, you think. You turn to face a bent-over lamppost. “I 
am the Great Magnetron!” you announce in a grand voice. “Ruler of all I 
see!” 

You could have some fun with this.'),
('2','67','You break off a piece of cake and dunk it in the blue liquid. You’re sure 
Kermit used blue liquid to make things shrink in Monster Blood III. 

You take a bite of the cake. Please work, you think, please — 

And then, suddenly, you feel as if you’re falling. 

You gasp and glance around — you are falling! 

You’ve suddenly become small again — all at once. And you’re falling, 
straight toward the open Dumpster. 

SQUOOOOOSH! 

You land right in the middle of the smelly, soft, slimy, disgusting cake. 

But you don’t care. You climb out of the Dumpster and thank Effy. 

“You’re very welcome,” she replies. She hands you a towel. While you’re 
wiping yourself off, she ducks inside the bakery. She returns with a big box of 
chocolate cupcakes. “Here you are,” she says. “A treat to take home to your 
aunt and uncle.” 

“Thank you,” you reply. You take the box and start home. 

But as soon as you’re out of sight you throw it away. You didn’t want to 
hurt Effy’s feelings — but you’re sick of chocolate cake! 

The next time you’re hungry, you decide, it’s brussels sprouts and 
broccoli for you!'),
('2','68','You were born in the last half of the year. You leap onto the remote. With 
all your weight, you land on button six. 

The laser gun explodes with a loud BANG! Pieces of glass and metal rain 
all over the laboratory. In terror, you dive under a magazine. When pieces of 
the laser gun stop falling, you crawl out. 

You’re still tiny. It didn’t work. 

Dr. Abbott is upset. “I can’t believe it!” he mutters. “I was sure those 
were the right settings.” You’ve decided that Dr. Abbott is the stupidest 
scientist you’ve ever met. 

“I have another idea,” he tells you. “I’m sure this one will work.” 

“Thanks anyway,” you tell him. You’re sure you’ll be safer finding help 
somewhere else. 

“Don’t leave me,” the scientist begs. 

You climb down the table leg. “I’ll come back when I’m the right size,” 
you assure him. “Maybe /’// be able to help you.” 

You hurry out of the lab. You overhear a student telling someone her 
address. She will be going right past your uncle’s house. You sneak into her 
backpack and hitch a ride. 

You can’t think of anything else to do but try to track down that jar of 
purple peanut butter. '),
('2','69','Nailed on the door of Maddy’s Bakery is a big sign that says out of 

BUSINESS. 

Sadly, you stand up. Maddy’s was your only hope. 

Now you notice that the noise around you has grown louder. Much louder. 
You glance around in horror. 

In front of you are a dozen police cars. 

Behind you are three tanks and an armored personnel carrier from the 
National Guard. 

Behind them is a big red van you’ve never seen before. On its side is 
painted alien research institute. 

Overhead small planes and helicopters buzz. 

You hear a loud SQUAWK! and then a loudspeaker comes on. 

“We’ve got you surrounded, alien!” a hollow voice cries. 

“I’m not an alien!” you cry. “I’m a human kid!” 

Now the red van opens. A skinny man with thick glasses steps out. “I’m 
Dr. Harlan from the Alien Research Institute,” he shouts through a 
megaphone. “I’m here to take you to our museum for study.” 

“I don’t want to be studied!” you reply. 

“Too bad,” he says. “You’ll never get away. Surrender now — or we’ll be 
forced to capture you!”'),

('2','70','Dora turns her head back and forth, admiring her reflection. You’d hate to 
be the one to tell her that she looks like a clown. You climb into the makeup 
box and wait. After a moment she reaches for an eye pencil. You grab onto 
the pencil. She’ll have to pay attention to you now. 

She picks up the pencil, then stops. 

“AAACCCKKK!” she screams. “A gigantic, ugly bug!” 

Before you can protest that you’re not a bug, she shakes you off the 
pencil. You drop into the sink. 

“Dora!” you cry. 

But it’s too late. 

She’s turned on the water. 

The ice-cold water hits you. Like a waterfall, it pushes you down. You 
struggle against it, trying to breathe. You try to swim, but the current is too 
strong. And then you begin to spin, faster and faster. 

You feel yourself being pulled down, down.... 

You open your eyes and see a huge silver circle approaching. 

It’s the drain. 

You’re about to be swept down the drain!'),
('2','71','You glance around quickly to make sure no one is watching. Then you 
push open the basement door and start down. 

The stairs are old. They creak with every step you take. Cobwebs brush 
your face. 

What could be down here that’s so dangerous? you wonder. 

You reach the bottom of the stairs. The floor is so dusty it looks as if it 
hasn’t been cleaned in a hundred years. 

Feeble daylight filters through a big, filthy window at the back of the 
room. 

You start to explore. 

But there’s nothing much to see. Mostly old, dusty, worn furniture. Old 
couches, old chairs, an old mattress. An old refrigerator and stove, both 
covered with rust, sit in one corner. 

Nothing dangerous. Nothing even interesting. But being down here is 
better than getting pounded by Barney. 

You sit in one of the old armchairs and wait. Sooner or later Barney and 
Dora will get tired of their game. Soon it will be safe to go back upstairs. 

There’s only one problem. 

A big problem.'),
('2','72','Those annoying pink dots! That creepy tingling in your fingers and toes. 

You’re still shrinking. 

Now when you try to open the cupboard door you find it’s much too 
heavy for you. You’re not sure how small you’ve become, but the pots and 
pans now seem as big as cars. 

What can you do? If you don’t leave the cupboard you’ll never be able to 
find the refrigerator and return to your true size. At this rate, you will have 
shrunk down to nothing before lunch! 

“Help!” you squeak. “Help!” 

Even if you were your normal size, you realize, no one would be able to 
hear you with all the racket coming from the TV. 

Luckily, it’s not totally dark in the cupboard. But why not? You glance 
around. You notice something you hadn’t seen before. In the back of the 
cupboard you spot a small hole. Pale light is streaming in through it. 

Maybe you can escape through the hole! 

You crawl over a pile of pan lids toward the hole. You’ve almost reached 
it when you hear a hideous scratching sound. A moment later a huge, furry 
head begins to push through the hole. Yikes! What is it?'),
('2','73','You’ve decided to tell the police what happened. 

The police car pulls up. Two blue-uniformed officers climb out. “We’re 
here about the broken window,” the taller one says. “Did any of you kids see 
who did it?” 

The other kids look down at the ground. The red-haired pitcher scuffs her 
foot in the dirt. 

“I did it,” you announce, stepping forward. “But it was an accident. It was 
my very first home run.” The officer studies you for a minute. “How old are 
you, kid?” she asks. 

You tell her and she looks surprised. “You’re awfully big for your age,” 
she says. “You’d better be careful. You don’t know your own strength.” 

“I’ll be careful from now on, officer,” you promise. 

“We’ll let you go this time,” she says, getting into the car. “Since it was 
your first homer.” She winks at you. 

What a relief! You watch the patrol car drive off. 

“Come by and play tomorrow,” the red-haired pitcher calls after you as 
the game breaks up. 

You return to your relatives’ house, and you notice something very 
strange. The porch roof is at least two inches closer to your head than it was 
when you left. 

Is this really only a growth spurt? you wonder.'),
('2','74','You run along the highway median, headed for Maddy’s Bakery. On 
either side, you hear the crashing of cars as drivers gawk at you. At last you 
see a big green highway sign: elmville, 23 miles. 

Twenty-three miles is no problem for you. It shouldn’t take more than ten 
minues or so. 

With police and army cars speeding after you, you follow the highway. At 
last you see a sign for Elmville. By now the helicopters have caught up to you 
again. You wave your arms at them, swatting them away as if they were 
mosquitoes. If only they would leave you alone! 

You turn toward the town, and quickly scan its tiny buildings till at last 
you find one that says “Maddy’s Bakery.” 

Maddy’s is a tiny brick building with a brown shingled roof. You kneel in 
the parking lot, and bend your head so you can see the bakery more clearly. 

But what you see causes your heart to sink into your toes.'),
('2','75','Plan B begins. The police cars and tanks suddenly back away. The roof of 
the red van peels back. Some sort of bizarre weapon pokes out from its roof. 

“This is your last chance, alien!” Dr. Harlan shouts. “Will you give up 
peacefully?” 

“I’m not an alien!” you explain. “I’m a kid!” 

“Your time is up!” Dr. Harlan shouts. “Activate the web gun.” 

They’re going to shoot you! Help! You turn to run. 

BOOM! 

Something heavy falls over your head. You try to pull it off, but thick 
strands pin your hands to your sides. The more you struggle, the tighter the 
strands wind around you. 

In horror, you realize that the gun shot a big net all around you. Now the 
strands wind around your feet. You feel yourself start to topple to the ground. 

“Congratulations, alien!” Dr. Harlan’s voice cries. “You’re the first 
creature to be captured by our artificial spiderweb!” 

Somehow, you don’t feel honored. 

Oh, well. That’s what happens when you become too wrapped up in 
adventure.'),
('2','76','“I’d like to try the magnetism,” you tell Dr. Abbott. 

“Excellent,” he replies. “I think you have a good chance for success. 
There’s only one drawback....” 

“What is it?” you ask anxiously. 

“Never mind,” he says briskly. “Compared to your present problem, it’s 
minor.” He wheels over one of the big machines from the corner of his lab. A 
label on its side reads supermagnetron. 

The machine is as tall as Dr. Abbott. It’s covered with dials and buttons. A 
long tube as wide as a person runs right through the center of the machine. 

Dr. Abbott picks you up and gently places you in the center of the tube. 
You feel very tiny inside the huge machine. 

“Hold very still,” he instructs you. “No matter what you hear or feel, 
don’t move!” 

You hear a metallic click, and then a loud buzzing noise. The tube begins 
to vibrate, faster and faster. You try to hold still, but it’s like trying to stay still 
during an earthquake. The buzzing grows even louder. 

It’s so loud you can’t hear anything else. Your eardrums feel as if they’re 
going to burst! And then, everything stops.'),
('2','77','The coin came up the same way three times. You guide your boat straight 
toward the waterfall. 

How horrible could a waterfall in a sewer be, anyway? 

You soon find out. Your Popsicle stick is sucked into the white water. You 
hold on as tightly as you can. SPLASH! 

You’re forced over the waterfall and into a long, wide pipe. You grip the 
Popsicle stick with your arms and legs. You tumble end over end through the 
dirty, rushing water. 

You choke as water rushes into your nose and mouth. Just when you’re 
about to drown, you reach the end of the pipe. 

You climb back on top of your Popsicle boat. The swift current is now 
rushing you toward a big machine. The machine makes hideous grinding 
noises. 

And then you realize what the waterfall was. 

It was the main pipe to the sewage treatment plant! 

You and the Popsicle stick are about to be ground into tiny pieces! 

Up ahead you see the sharp metal teeth of the grinder. 

GRRRRRRR! GRRRRRRR! 

There’s no way back. Only forward. 

Too bad — this adventure is grinding to an'),
('2','78','There’s got to be a logical explanation. Maybe you didn’t notice how 
much Dora has grown. Maybe you’re losing weight. Maybe you’re just 
imagining things. 

“You’re looking awfully thin, dear,” Aunt Fiona tells you at supper that 
night. “Have some more mashed potatoes.” 

“Yeah, wimp.” Barney grins. “Eat some of my food while you’re at it.” 
When his mother isn’t looking, he dumps his broccoli on your plate. 

You ignore Barney. Because you’ve just noticed something disturbing. 

The table seems a lot higher than it used to be. 

Something really bizarre is happening to you. 

I’ll feel better after a good night’s sleep, you think. 

That night you have weird dreams about pink dots and tingling toes. And 
the next morning, when you climb out of bed, your pajama bottoms fall off 
your body onto the floor! 

What is happening? you wonder in a panic. 

You pick up your pajama bottoms and examine them. They are exactly the 
same as they were last night. 

Of course they are. Because you now know what the problem is. 

Your pajamas haven’t gotten bigger. Dora hasn’t grown and your 
watchband hasn’t stretched. 

You have shrunk. '),
('2','79','You stick out your tongue and lick up the teeniest, tiniest bit of the herbal 
powder. It’s such a small amount, you don’t even taste anything as you 
swallow. 

You hold your breath, waiting for something to happen. 

But nothing does. 

“Notice any difference?” you shout down to the clown. 

“No.” He shakes his head. “But at least you aren’t growing any bigger. 
Maybe you have to wait for it to work.” 

“Maybe,” you agree. But you can’t help being disappointed. Maybe you 
should eat the rest of the mixture. You start to lift your hand to your lips when 
you suddenly hear a familiar noise — 

Sirens and helicopters! 

Oh, no! The police have found you! 

Should you eat the rest of the mixture? 

Before you can decide, a helicopter swoops down outside the tent. Its 
rotors blow the rest of the mixture out of your hand. 

The herbs are lost forever on the wind. 

You duck out of the big top and start running. You have to get away!'),

('2','80','You sit up and glance down at your feet. No wonder you tripped. Your 
toes have burst through the front of your sneakers! 

You yank off what’s left of the sneakers. You wiggle your squished toes. 
You’ve heard of out-growing shoes. But you never knew it could happen so 
fast! 

You hurry into the house to find new shoes. You pass through the kitchen, 
where your aunt is packing her briefcase for work. “Why are you barefoot?” 
she asks. 

“I think my shoes shrank,” you answer. You show her the ripped sneakers. 

“Perhaps you’re just having a growth spurt,” she offers. “You look a little 
taller.” 

Up in your room, you study yourself in the mirror. You do look bigger. 
Maybe even a couple of inches taller than you were yesterday. 

Your shoes are all too short. You have to borrow an old stinky pair of 
Uncle Harvey’s sneakers. They are a little too big for you, but they are 
comfortable. You’re just tying the shoelaces when Dora sticks her head inside 
the room. 

“I saw you in the basement,” she announces. “And I’m telling!”'),
('2','81','You have to get to the dump and you have to get there NOW! 

Barney is your only hope. 

“Please, Barney, I have to —” 

“What part of ‘shut up’ don’t you understand?” Barney demands. “I’m 
trying to watch TV! Do I have to teach you a lesson?” As he pulls himself up 
off the floor you realize you’re so little now, he towers over you. 

Maybe this was a bad idea. 

“Uh ... I’ll see you later,” you say and start to back out of the room. 

But Barney means business. You’ve seen that nasty expression on his face 
before. It means he’s really mad. And when Barney is mad — watch out! 

Quick! Where can you hide from your cousin?'),
('2','82','“Get ready for another crummy tea party,” the voice says. 

You glance around, your heart pounding. “Who said that?” 

“I did,” the father doll replies. Its painted mouth doesn’t move. But the 
voice is definitely coming from the doll. 

“You can talk?” you exclaim. 

“Of course I can talk,” he replies. “So can you. All dolls can talk.” 

“I’m not a doll,” you protest. 

“Then what are you doing in our dollhouse?” He walks toward you stiffly. 
“Are you a burglar?” 

“No, no,” you say. He may be a doll, but he looks strong. 

“Of course you aren’t,” says the mother doll. “You’re my new 
housekeeping doll.” She brings you a tiny vacuum cleaner. 

“But —” you start to protest. The mother doll glares at you. You shrug 
and start to vacuum. 

“The new doll is dangerous and needs to be locked up,” the father doll 
insists. 

“No! There’s too much work to be done. There’s cat hair everywhere,” the 
mother doll tells him. 

You glance out the window. Puff’s yellow eyes glare back at you. 

Will Dora ever come back? you wonder as you vacuum the rug. With all 
the cleaning you have ahead of you, a little tea would sure hit the spot!'),
('2','83','You’ve got to stop Barney. You are now so big you’re afraid if you grab 
him, you’ll squash him. You have to act quickly — he’s almost at the door. 

You reach out and grab the first thing your hand touches. Unfortunately, 
it’s the roof on the neighbor’s house. 

With a hideous CRACK! the roof rips loose from the house. Bricks and 
roofing shingles scatter like falling leaves. You’ve opened the house up like a 
box. You stare at the roof in your hand. Shocked, you peer into the house. 

From inside, the neighbors stare up at you. They were eating lunch. Now 
they’re screaming in terror. 

“It’s a monster!” the father of the family shouts. 

“It’s an alien!” his wife screams. 

“Alien! Alien!” his daughters shriek. 

“No — wait!” you cry. But your voice is so loud what’s left of their house 
shakes. The family rushes out to the street. 

You search for Barney, but he’s disappeared. He’s probably gone for the 
police. You feel terrible. Maybe you can fix the damage you’ve caused. You 
kneel down beside the house and carefully set the roof back in place. 
Unfortunately, parts of it seem to be missing. You glance around the yard for 
the missing pieces. 

Then you hear an angry growl.'),
('2','84','You find yourself eye-to-eye with another strange circus performer. Only 
this time it isn’t a clown. This time it is an elephant! 

“Hi, there,” you say to the giant beast. You are so big now, you and the 
elephant are the same height. 

The elephant gazes steadily at you. It seems to be waiting for you to do 
something. But what? You glance around. You realize you are at the back 
entrance to the big top. 

Suddenly, a voice booms over the loudspeakers. “Ladies and gentlemen! 
Children of all ages! You are about to be astonished by the extraordinary feats 
of The Amazing Strongo!” 

The elephant looks at you expectantly. You have a funny feeling you are 
The Amazing Strongo. 

The announcement continues. “Watch The Amazing Strongo lift an 
elephant into the air!” 

You stumble through the flap. The elephant pushed you with its trunk! 
Then it nudges you all the way into the center ring. You are surrounded by 
cheering people. When the applause dies down, the tent grows eerily silent. 
They are all waiting for you to go into your Amazing Strongo act. But you 
can’t lift an elephant! Or can you?'),
('2','85','The water forces you down the drainpipe. You try to swim, but the current 
is too strong. You hold your breath as you swirl underwater. Just when you 
think your lungs are going to burst, you splash into a deep, dark pool. 

You push your head above water. You suck in a deep breath of air. A big 
wave pushes you back under. The next thing you know, your body is 
whooshing along a long, curving pipe. 

The water slows slightly and you come up for air. Then you’re rushing 
through the pipes again. You gasp for breath. 

SPLASH! The current lets you go. You’re drifting in a big, broad, smelly 
river. You tread water and gaze around. The only light trickles in through tiny 
openings in the grates far overhead. Empty paper cups and bits of food float 
by you. 

The whole river smells like rotten garbage. Slimy strings of filth wind 
around your arms and neck. Gross! You’re in the sewer system! 

You swim to one of the sides, but the banks are too steep and slimy to 
climb. You can’t tread water forever. Already your arms are getting tired. 

Then something familiar floats by.'),
('2','86','“I’ve been looking for a great experiment,” Dr. Abbott exclaims. “I don’t 
know anything about size change. But I’m willing to give it a shot.” 

“I’ll try anything,” you say. “I’m desperate.” 

“Excellent! Just think of the publicity!” Dr. Abbott is getting very excited. 
“People will stop accusing me of —” He glances down at you. “Well, never 
mind. Let’s get started.” 

The scientist hurries to his desk and searches through piles of papers. “I 
have to do a bit of research,” he explains. 

You smile weakly at him. You hope you haven’t made a terrible mistake. 

Finally, Dr. Abbott lifts you up in his hand and examines you carefully. 
Every time he exhales, the force of his breath almost blows you over. He 
takes out a tape measure and measures you. He puts you on a scale and 
weighs you. Then he places you on a table. 

“I’m not sure which one of my machines to use,” he says. “The 
magnetron works by changing your magnetic field. The laser gun makes the 
body’s atoms expand. What do you think?” 

“What do I think?” you reply with a gulp. Somehow, you hadn’t expected 
the decision to be yours. Still, it is your body.'),
('2','87','You take a step back, but the tiger bounds up to you. Its lips twist in a 
snarl, and its teeth glisten in the bright lights. 

“Aaaaaarrrggghh!” The piercing sound of your scream even shocks you. 
The tiger freezes midpounce. The crowd stares at you. You forgot how loud 
your voice is, now that you are a giant. 

The tiger backs away, and then, with its tail between its legs, skulks back 
to the ring. 

“I’m sorry, kitty,” you call to the frightened animal. 

You didn’t mean to scare it. And you realize that now that you are huge, 
the tigers couldn’t really hurt you. As you stride to the center of the ring, all 
the tigers cower. Even the trainer looks a little nervous. You reach out to the 
tiger and scratch it under its chin. Then it starts to rub against your legs like a 
kitten. It’s purring! 

The crowd begins applauding and cheering. But the tiger trainer just 
glares at you. 

“Nice kitty,” you tell the tiger. You kneel down and pet the beautiful 
animal. You notice the tiger trainer is still glaring at you. Oooops — it finally 
dawns on you — you’ve interrupted his performance. You better get out of 
the ring. You straighten back up and turn to go. 

Yeowch! Something just yanked your hair — hard!'),
('2','88','There is an odd number of letters in your first name. 

And you have a new idea for fighting the mouse. 

You stop dueling with the rodent. Instead, you circle around a sauce pot. 
The mouse starts to follow you. You speed up. 

And there it is! The mouse’s tail. Quickly, you grab it and hold on. 

The mouse squeaks in anger and begins to run through the cupboard. You 
continue to hold on to its tail. 

Then, just as you hoped, the mouse runs toward the front of the cupboard. 
Its weight and its momentum should do the trick. Yup! When it hits the 
cupboard door, the door pops open. 

Quickly, you let go of the mouse’s tail. You run out of the cupboard and 
into the kitchen. 

You turn around and see the mouse lying on the floor. It must have 
stunned itself when it hit the cupboard door. But it’s starting to wake up. 

There’s only one thing to do. 

What is it?'),
('2','89','Barney’s right. 

You are a wimp. 

This adventure is canceled on account of nerdiness. 

What? 

You want another chance? 

Okay.'),

('2','90','Dora is shrieking and staring at you in horror. 

“Dora —” you say. “It’s me, your cousin!” 

But you’re so big she doesn’t even recognize you. And you can tell you’re 
still growing. 

“Help!” she screams. “Help! It’s a mutant alien!” 

You pull yourself to your feet. Maybe if she can see all of you she’ll know 
who you are. As you stand, your hair brushes the treetops. Dora looks very 
small standing in the yard beneath you. 

And now Barney runs out of the house. 

“Call the police!” Dora screams. “There’s a mutant alien in our 
backyard!” 

Barney takes one look at you and turns white. He spins around and heads 
for the house. 

He’s going to call the police! They’ve already been called about you once. 
If they come again, you’ll be in so much trouble you’ll never get out of it. 
You’ve got to stop Barney. But how? '),
('2','91','“It’s the alien!” A blond kid in row two points at you. 

“I’m not an alien!” you shout. “I’m a human kid!” 

More people begin screaming, “The alien! It’s the alien!” 

In shock, you drop the elephant. This makes the elephant furious. She 
swoops you up in her powerful trunk. At first you think she is going to 
squeeze you to death. Then Dodo lifts you into the air and swings you back 
and forth. 

“Call the police!” someone shouts. Now the entire audience is shrieking. 
The situation is getting ugly. A dozen security guards start running toward 
you. 

You thought you were safe here. But now everyone thinks you’re an alien. 

Then you spot your cousin Dora sitting right in the front row. 

You’ve never been so happy to see her before in your whole life. In fact, 
this is probably the only time you’ve been happy to see her. 

“Tell them, Dora!” you shout. “Save me! Tell them I’m not an alien!” 

Dora stares back at you. Then she smiles. 

Hooray! You’re saved!'),
('2','92','You refuse to be defeated. “I’ve got an idea,” you tell Dr. Abbott. “We’ll 
make a staircase.” You and Dr. Abbott struggle and strain as you shove books 
into a pile. The books are stacked unevenly, forming steps. When the pile is as 
tall as the beaker, you and the scientist rush up the steps. At the top, you reach 
out for the remote. It’s nearly as big as you are. 

Your hands both touch the remote. With all your strength, you pull. You 
fall flat on your back. But the remote lands next to you. 

“I’ll change the settings!” Dr. Abbott cries. He presses a button on the 
remote. The buttons are so big he has to use both hands. Then, grunting and 
sweating, he turns a dial. 

“That should do it,” he tells you. “On the count of three, jump on button 
number six. At the same time, I’ll put all my weight on the ‘on’ switch. One! 

“Two!” 

You prepare to jump onto button six. 

“Three!” Will you be successful? That depends on the month you were 
born in.'),
('2','93','Quickly, before your cousin can catch up to you, you dart outside through 
the kitchen door. You may be small, but you run fast. 

You glance around for a good hiding place. No time to be choosy. You 
dash onto the lawn, then duck under the porch. 

The kitchen door slams again. Then you hear Barney’s footsteps clomping 
over your head. You crouch while Barney stumbles around on the lawn, 
calling your name. 

“I’ll give you to the count of ten to come out!” he shouts. 

You smile to yourself. How stupid can he be? Why should you come out 
and get beat up when you can relax under here, safe and comfortable? 

“One!” Barney cries. “Three! Seven!” 

He’s cheating again, but you don’t care. You’re safe, at least for now. And 
you can wait a lot longer than Barney can count. 

Yup! Just as you expected, Barney gets bored and heads back into the 
house. You figure you’ll give Barney plenty of time to cool off. 

While you wait, you see those pink dots again. But other than that, it’s 
pretty comfy under the porch. 

After you think you’ve waited long enough, you start to crawl out from 
under the porch. Then you stop in horror.'),
('2','94','It’s your cousin Dora — smirking at you from the top of the stairs. 
“You’re not supposed to be down here,” she whines. “I’m going to tell!” 
“Wait!” you cry. “It was an accident! I came in here by mistake!” 

“Yeah, sure,” she taunts. “But maybe I won’t tell — if you play with me.” 
“Maybe,” you say cautiously. 

“Let’s play dolls,” she urges. “I have a new dollhouse.” 

You hate playing with Dora. She’s really spoiled and has a tantrum if she 
doesn’t get her way. 

“I’ll tell if you don’t,” Dora persists. 

What are you going to do?'),
('2','95','You try to think of any possible reason you could suddenly start growing. 
You think back over everything you’ve done for the past twenty-four hours. 
You still haven’t figured out an answer when you enter the kitchen. 

Dora and Barney are making sandwiches in the kitchen. You are really 
hungry now. Along with everything else, your appetite has also grown. But 
when you reach for the tuna fish, Barney stops you. “You ought to go on a 
diet, wimp,” he tells you. “You’re getting fat — or haven’t you noticed?” 

Dora giggles obnoxiously. 

You know perfectly well that you’re not fat — you’re just big. Big and 
hungry! 

Then you remember something. You were very hungry when you were 
hiding in the basement. Hungry enough to eat that stale chocolate cake. 

Maybe there was some ingredient in the cake that is making you grow. It did 
taste kind of funny. 

If you find out what was in the cake, you should be able to figure out how 
to stop growing! '),
('2','96','You don’t stand up right away. You feel a little woozy from the effects of 
the machine. You lie on the bench and gaze up at Arnold. He is staring at you, 
his eyes growing wider and wider. 

Not a good sign. 

“Uh, Arnold,” you begin, “did it work?” 

His mouth opens and closes, but he doesn’t answer you. 

Definitely not a good sign. 

You leap off the bench. You run to a mirror and your heart nearly stops. 
You’re back to your normal height. But your body is totally changed! 

The flapping motion made your arms stretch. Your hands dangle below 
your knees! The swimming movement made your legs as thick as tree trunks. 
The helmet shrank your head to half its normal size! 

“I’m afraid I got the setting wrong,” Arnold says. “I should have read the 
instructions first.” 

Now he tells you!'),
('2','97','You pick up the crumb of chocolate cake, place it in your mouth, and 
swallow. A moment later, you feel an electric tingling all over your body. 

The next instant, you feel a sharp pain in your head. 

Your head has hit the top of the refrigerator. You’re growing big again! 

The chocolate cake worked! 

You jump out of the refrigerator, rubbing your head. Then you grin while 
you watch all the junk around you in the dump appear to shrink. 

In just a few seconds you’ve returned to normal kid-size. 

You arrive back at your aunt’s house in time for lunch. Barney is waiting 
for you on the porch. 

“Where have you been, wimp?” he demands. 

“Out,” you say. 

“Oh, yeah?” He pulls back his hand to give you a karate chop. But to his 
surprise, and yours, too, you move quickly to block it. 

“OW!” Barney whines, rubbing his hand. “How did you do that?” 

You don’t answer. You’re not sure. But it seems the cake not only made 
you bigger, it made you faster and stronger. Maybe the rest of the summer 
won’t be so bad after all.'),
('2','98','You’ve decided to try to fight the mouse. It’s headed straight toward you, 
and it looks mean! Mean and hungry. 

But it’s so big — you need a weapon. You glance around desperately. 

You spot a box of utensils hanging on the inside of the cupboard door. 
Inside the box are some pins for holding corn on the cob. One end of each pin 
is sharp. The other end has a plastic handle. You grab one of the pins by the 
handle. It’s as big as a sword to you. 

Then you turn to face the mouse. 

It approaches, baring its ugly yellow teeth. It lunges at you. You lunge 
back, holding your pin like a sword. The mouse easily dodges the pin. 

It reaches out a clawed paw and rakes your arm. You cry out in pain and 
thrust back with the pin. 

The two of you seem well matched. So well that the only way to 
determine the outcome of this duel between human and beast is by chance. 

Count the number of letters in your first name.'),
('2','99','You head for the metal pile as fast as you can run. 

You hear the lizard coming after you. You race ahead, faster than you’ve 
ever run before. 

The lizard’s sticky tongue darts out of its mouth. It touches the back of 
your shirt. You break away. You reach the rusty metal. Now you realize it’s a 
pile of wrecked cars. 

You climb onto the crushed metal door of one of the cars. The lizard starts 
up after you. You climb through the window and leap onto the dashboard. 

You glance at the window. The lizard glances back at you. 

Where can you hide? 

Then you spot the open glove compartment. Perfect! You crawl in and 
slam the door behind you. 

No way the lizard can get in. You glance around. The glove compartment 
is full of old, torn maps. There’s a rusty flashlight, a bunch of keys, and a 
half-eaten roll of mint candies. To you, they’re all the size of furniture. 

You lean against a map and relax. But then you hear a deafening roar. The 
car starts to tilt. Then it begins to shake.'),

('2','100','It’s gone! The refrigerator has disappeared. 

In fact, all the furniture in the basement is gone! Everything. The 
basement is completely empty! 

You rush to the kitchen. Your aunt is just leaving the house to go to work 
at the university. 

“Aunt Fiona!” you cry. “Where’s the refrigerator that was in the 
basement?” 

She frowns. “Dora told me you were playing down there yesterday,” she 
replies. 

That rat! You played with her stupid dollhouse and she still told on you. 

“Don’t worry,” Aunt Fiona goes on. “I had all the furniture hauled to the 
dump early this morning.” 

“But —” you start to protest. 

“Those old things were dirty and dangerous,” she continues. “Now it’s 
safe for you kids to play down there whenever you want.” She gives you a 
quick kiss and leaves before you can ask any more questions. 

You stare after her in shock. You’re in big trouble. Or, rather, in small 
trouble. You’re still shrinking. What if you grow so small you disappear?'),
('2','101','“I’d like to try the laser treatment,” you squeak. 

“Excellent!” Dr. Abbott replies. “Now, stay right there.” 

He rushes across the room and returns pushing a huge machine. It looks 
like a white machine gun with a pointed barrel. He aims it directly at you. 

Dr. Abbott presses several buttons on a plastic remote control. With a 
high-pitched whine, the laser starts up. Suddenly, a red ray shoots out. You 
start to sweat and pant. But you’re not growing any bigger. 

Dr. Abbott turns off the machine. “Any results?” he asks. 

“It isn’t working,” you tell him. 

“Oh, dear,” he says, frowning. “Maybe I’d better turn the ray up to full 
power.” He presses more buttons on the remote. There’s a sudden POP! and 
the entire room glows bright red. 

You fall down as everything begins to shake. The red light is so bright 
you have to cover your eyes. Then it begins to fade to pink. The shaking stops 
and the laser shuts off. 

You’re still small. 

And Dr. Abbott seems to have disappeared. 

“Dr. Abbott?” you call. “Dr. Abbott?” You approach the edge of the table 
and glance down. There on the floor is a tiny creature wearing a white lab 
coat. It looks like ...'),
('2','102','“What’s wrong?” you ask Dora. 

“Why is your watch like that?” she asks, pointing to your wrist. 

You glance where Dora is pointing and notice that your wristwatch is 
hanging loose from your wrist. “That’s strange,” you murmur. “The 
watchband must have stretched.” 

“It’s metal,” Dora points out. “How could it stretch? Didn’t it fit when 
you got here?” 

“I guess so,” you mumble. 

That’s a good question, you realize, but one you don’t have an answer for. 

Now you notice something else. When you first came here, you were 
three inches taller than Dora. Sitting beside her now, you seem to be the same 
height. How could that be possible? '),
('2','103','You rush out of the house and make a right. But you have to stop for a 
minute. Pink spots appear before your eyes and your toes tingle. Once the 
weird feeling passes, you run down the street toward the number 103 bus 
stop. 

When you hurry by your uncle’s mailbox, you see it’s now higher than 
your head. You’ve shrunk even more! 

Just as you arrive at the bus stop, the 103 bus pulls up. You start to hop on 
board. 

“Just a minute,” says the bus driver. “How old are you?” 

“I’m twelve,” you reply. 

The driver laughs. “Nice try. But no twelve-year-old could be so small. 

I’m afraid you’re too young to ride the bus by yourself. Come back with one 
of your parents.” 

“But I have to go to the university!” you protest. 

“Sorry,” the bus driver says. “Rules are rules.” He shuts the door in your 
face. Too bad. It looks as if you made the wrong choice. And this adventure is 
over. 

But wait! You have one more chance. You can still try to track down the 
refrigerator and see if the jar of purple peanut butter is inside. Hurry back to 
your uncle’s house. That will be a safe place to come up with a plan!'),
('2','104','You’ve heard that water bugs sometimes fly, but you’ve never seen one 
do it. 

And you hope you never will again. 

For now, though, you realize you are lucky you found one that can. This is 
your chance to get out of the sewer. 

But first, you’ve got to figure out some way to steer before you slide off 
the bug’s slimy back. You grasp the left antenna and pull hard. The water bug 
turns left. You pull on the right antenna, and it turns right. The antennae work 
just like reins! 

You steer the water bug along the sewer until you reach an overhead 
storm drain. You guide the insect up through the drain and out into the street. 

Then you kick the bug in the sides. It begins to fly high, higher. Soon the 
town is far below. You scan the countryside. And then you see it — the 
Fiskeville dump. 

You guide the water bug south toward the dump. The dump is huge. It 
stretches over several acres. How will you find the refrigerator? 

The insect begins to fly faster as it approaches the dump. It dips low and 
skims a few feet above the dump. It’s heading straight for a big mound of 
rotting garbage!'),
('2','105','You’ll try the steam room. You don’t want to test out some new 
contraption. 

Arnold gives you a large bathing suit to change into. Then you step 
through a door into a room that’s filled with billowing clouds of steam. 

It’s HOT in here! The steam fills your eyes, your mouth, your nose. You 
begin to sweat. You sit on a wooden bench. The steam grows hotter. You 
sweat even more. You feel the bathing suit growing loose on your body. 

It’s working! You’re shrinking! 

The warm steam makes all your muscles relax. You feel as if you don’t 
have a care in the world. You get sleepy ... sleepy. 

You wake up incredibly thirsty. Water, you think, you have to get some 
water. Your legs feel rubbery when you slide off the bench. You stumble to 
the door and try to open it. 

You can’t reach the handle. 

The steam worked too well. You’ve shrunk — just like your sweater when 
you accidentally put it in the hot-water wash. 

“Let me out!” you cry, pounding on the door. 

You realize that Arnold has forgotten all about you. 

The steam continues to pour in. You continue to shrink. When you have 
shrunk down to the size of a raisin you give up hope. 

This steamy adventure has come to a sweltering '),
('2','106','You turn around and start for the highway. 

You have to be very careful where you put your feet — whoops! There 
went someone’s bicycle. CRUNCH! You’ve just flattened Uncle Harvey’s car! 

You hope you don’t accidentally crush a person or animal. 

You step carefully over a parked van. The neighborhood still rings with 
terrified shouts: “ALIEN! ALIEN!” 

You can’t wait to get away! 

Once you reach the main roadway, you take off. CRASH! Cars collide 
behind you — but you have to keep going. You don’t even dare look back. 
Then you hear a frightening sound: sirens. 

Lots of sirens. 

Someone in your uncle’s neighborhood has called the police. You are in 
big trouble now. And if your neighbors won’t listen to you, will the police? 

You see flashing lights in the distance as the emergency vehicles race 
toward you. Above them helicopters buzz like angry hornets. 

It’s an all-out attack! Where can you go? What can you do? 

And then you see it — one of the few places in the world where you 
might be able to hide until you return to your normal size.'),
('2','107','You bend down and lick up the smear of icing. 

Then you wait. 

At first nothing happens. 

Then your arms start to ache and your mouth feels strange. Something is 
happening to you! You watch as the refrigerator appears to grow smaller. 

You’re growing! It’s working! 

You hop out of the refrigerator. As you do, the lizard hops in the 
refrigerator. It climbs up to the cake box and gobbles up the crumb of cake. 

You turn to head back for your uncle’s house. 

Then you hear a CRASH! behind you. You glance back to see that the 
lizard completely fills the refrigerator. The crumb made it grow, too!'),
('2','108','“One,” Barney counts. “Two, three, four, twenty-seven, twenty-eight, fifty 

As usual, your cousin is cheating. YouTl have to find a place to hide, fast. 

But where? Dora drops Puff and runs around to the back of the house. 

You want to stay as far away from her as possible. You glance around, then 
tiptoe into the house. 

You find yourself in a small living room crowded with furniture. You 
don’t have much time. Where can you hide? 

You dodge around a couple of chairs. Then you head for a hallway that 
leads to the kitchen. 

“Seventy!” Barney shouts from outside. “Eighty-one! Eighty-six!” 

You spot a doorway to the right of the refrigerator. You pull the door 
open. Steep, splintery steps lead down into a dark, musty-smelling room. It 
must be the way to the basement. 

But your aunt and uncle warned you to stay out of it. 

“Ninety-three!” Barney shouts. 

Quick! Make a decision. Should you forget about your aunt and uncle’s 
warning and hide in the basement? Or find somewhere else to hide? '),
('2','109','You run down the hall as fast as your tiny legs can go. The janitor’s 
footsteps thunder behind you. 

You duck into Dr. Abbott’s lab at the end of the hall. You hide in the 
space between the open door and the wall. 

“Where’s that mouse?” the janitor shouts. 

“There are no mice in here,” says a friendly voice from the back of the 
room. You glance up to see a tall scientist with a gray beard working at a 
table. He must be Dr. Abbott, you think. 

“Let’s look around to make sure,” the janitor insists. You hold your breath 
as he enters the room, then clomps around looking for you. 

Please don’t look behind the door, you think. 

“I guess it didn’t come in here,” the janitor announces. “See you later, 
Doc.” 

You let out a sigh of relief. You step out from behind the door and glance 
around. Dr. Abbott’s laboratory is huge. Way above your head you can see 
several tables and bookshelves. Two big metal machines stand in a corner. 

You hear the sound of something boiling on a gas burner. 

You’re sure to find help here. But how can you make Dr. Abbott notice 
you?'),

('2','110','The eyes are in the middle of an orange, furry face. It looks just like a 
giant tiger! The beast licks its lips. 

You realize it’s not really a tiger, but it might as well be. It’s Dora’s cat, 
Puff. It doesn’t know you’re a human. All it knows is that you look a lot like 
dinner. 

“Nice kitty,” you say, backing slowly toward the porch steps. “Nice Puff, 
nice, nice.” 

The cat blinks once, then crouches low to the ground. The cat is about to 
pounce. 

You sprint to the steps. You have to stand on your tiptoes to reach the first 
one. You strain to pull yourself up by your hands. It’s like climbing up the 
side of a building. 

You hear Puff behind you, growling softly. 

The next step is much easier to climb. It’s weathered, and you use 
splinters as handholds. 

The last step is also covered with splinters. They catch on your clothes 
and poke your skin. You climb up as quickly as you can. You reach the porch, 
exhausted. But you can’t rest. 

Puff is preparing to spring straight toward you. 

The screen door is open a couple of inches. But it’s all the way across the 
porch. Do you have time to make it there? 

Or should you head for Dora’s dollhouse a few feet away?'),
('2','111','You decide to taste the cake. That purple peanut butter looks too weird. 
You are so hungry, your mouth waters when you take a big bite of the cake. 

The frosting is hard, the cake is crumbly, and there is a funny aftertaste. 
You’ve definitely had better. 

But chocolate is chocolate. Besides, you’re starving! Your mouth is open 
for another bite when you hear your aunt calling your name. 

Uh-oh! Your aunt’s still home. You don’t want to get caught in the 
basement! What can you do? Your eyes dart around the basement, searching 
for a way out. 

The basement window! You hurry across the room and scramble onto the 
back of the sofa. By standing on your tiptoes, you can just reach the grimy 
windowsill. You hoist yourself up. 

Luckily, the window is open. You slither through, flopping onto the grass. 

Great! No one will ever know you were in the basement. Problem solved. 

But then you roll over onto your back. 

And face a new problem.'),
('2','112','You glance down the street. A police car is speeding toward the ballfield. 
Its red lights blink and its siren wails. 

“You’re in big trouble now!” Barney calls. Without looking back, he 
dashes away. Thanks a lot, cousin, you think. He disappears in the distance. 

“It wasn’t your fault,” the red-haired pitcher says. “It was just a great hit.” 

“You’d better get out of here fast,” another player suggests. 

You don’t know what to do. You didn’t mean to break the window. But 
will the police believe you? What will they do? Maybe you’d better hide until 
they go away.'),
('2','113','“I’d love to join the circus,” you tell the clown. 

“Great!” he exclaims. “We’ll work out the details later. You’ll work with 
the tigers. Starting now!” 

As the audience files in for the next show, Tombo, the tiger trainer, gives 
you a nasty look. “You don’t know anything about tigers, kid,” Tombo warns. 
“They can be very dangerous. And people can be dangerous, too!” 

Is he threatening you? Before you can find out, the ringmaster announces 
your act: “And now presenting Tombo the Tiger Trainer and his amazing new 
assistant!” 

The circus band strikes up a song. The spotlight focuses on the center 
ring. Tombo lets his five tigers out of the cage. The big cats jump onto their 
stands inside the ring. 

They snarl and growl as Tombo approaches. Tombo holds up a flaming 
hoop. He cracks his whip. One by one, he makes the tigers jump through the 
flames. The crowd applauds. “Let’s see you top that, kid,” he sneers. 

You feel sorry for the tigers. They may be dangerous animals, but you can 
tell they don’t like the whip or jumping through hoops. But somehow, you 
have to entertain the crowd. 

“Go on, kid!” Tombo whispers. “Get started! If you want to keep your 
job!”'),
('2','114','The car shakes even harder. Is this an earthquake? 

You open the glove compartment partway. The lizard is gone. But — oh, 
no! 

You glance up through the car window. The car is caught in a gigantic 
machine. The machine is pushing the car toward the huge steel jaws of a car 
crusher! 

You’ve got to get out of here! 

You jump out of the glove compartment. You race across the seat. If you 
can just make it back out the window ... But the vibrations throw you to the 
floor. 

You scramble up again. Maybe there’s a hole in the floor! Or maybe you 
can get the car door open! You hurl yourself against the car door. It doesn’t 
budge. 

The sound of the car crusher is deafening. With a jolt, you are thrown off 
your feet again. As you peer up from the floor, you see that the roof of the car 
is coming closer. 

And closer. 

And closer. 

In another few seconds, the car crusher will mash the car — and you — 
into a metal pancake. 

Alas, for you, this adventure has come to a SMASHING'),
('2','115','That floor is a long way down. 

You decide it would be safer to climb down and then back up the other 
table. It may take a bit longer, but at least you’ll get there in one piece. 

You work your way down the table leg. Luckily, the table leg has carvings 
that give you good places to put your feet. 

Once you make it to the floor, you scurry over to the lab table. You peer 
up and see that Dr. Abbott is more than halfway to the top. 

“I’m right behind you,” you call up to him. You quickly begin your climb. 
You pull yourself up, hand over hand. It’s tough going, but you are making 
progress. You glance up again. Dr. Abbott is just pulling himself up onto the 
top of the table. 

Unfortunately, he grabs on to the corner of a huge encyclopedia. The 
enormous volume tips over the edge of the table. Dr. Abbott manages to 
swing his legs up and scrambles out of the way. 

You’re not so lucky. 

“Oh, no!” you squeak. The book tumbles off the table, knocking you from 
the table leg. You land on the floor with a bone-shattering thud. A pile of 
books crashes on top of you. 

Too bad. 

What’s the scientific term for SQUASHED?'),
('2','116','You’ve decided to make friends with the mouse. You want it to know you 
aren’t a threat. 

“Hello, mousey, mousey,” you say sweetly. You try not to think about its 
long, yellow teeth. 

The mouse stops stalking you. It stares at you with its little beady eyes. 
You think back on all the mice you’ve seen in school science projects. You 
know they’re curious animals. How can you make it curious — instead of 
hungry? 

You begin to make faces at it. You rub your stomach with one hand while 
patting your head with the other. The mouse continues to gaze at you. It 
seems much less dangerous now. It starts to appear interested. 

Now you do a cartwheel. When you’re upside down, you hit your heel on 
a pot lid. 

“Ow!” you cry. The mouse squeaks at you, as if it understands that you 
hurt yourself. 

You make squeaking sounds back at the mouse. Maybe you can convince 
it that you’re just a strange-looking mouse. 

“SQUEAK!” the mouse cries. 

“SCREEK!” you reply. 

And then, suddenly, the mouse lunges at you. Its mouth is wide open. 
Have you made a mistake? Did you say something terrible in mouse squeaks?'),
('2','117','It’s a sound you never thought you’d be happy to hear — the voice of 
your cousin. “Puff!” Dora cries. “What are you doing by the dollhouse?” 

You hear a creaking noise and light floods the kitchen. Dora pulls the roof 
off the dollhouse. “See?” she tells Puff. “There’s nothing in here, it’s — 
what’s that?” 

Now you see her round eyes staring in at you. 

“Why, it looks like a little person!” she exclaims, reaching for you. 

“I’m your cousin!” you shout. “Don’t you recognize me?” 

But your voice is a pathetic squeak. No way she can hear you. “Cool!” 
she murmurs. “Another doll to play with!” 

“But I’m not a doll!” you protest. 

“Stay right here,” Dora goes on. “I’ll go get some goodies for you to eat. 
We can play tea party. Won’t it be fun?” 

“Wait!” you cry. But before you can protest again, she replaces the lid on 
the dollhouse. All you can do now is wait for her to return. Maybe you’ll be 
able to talk some sense into her. Or maybe not. 

If only Puff would go away. 

And then you hear another voice. From inside the dollhouse.'),
('2','118','You can’t join the circus! You have to find a way to make yourself 
smaller. “Thanks for your offer,” you tell the clown. “But I’m not usually this 
big.” You explain your problem. 

“I understand,” the clown tells you. “I appreciate your honesty. In return, I 
may be able to help you. One of our workers is a fortune-teller who has 
strange powers. She may be able to return you to your normal size.” 

After the show, the clown introduces you to a very small white-haired 
woman in a long pink robe. Her face is so wrinkled she appears to be 
hundreds of years old. 

“I predict,” she begins in a strange accent, “you will make lots of money 
and live a long, happy life.” 

“No, no,” the clown says. “We don’t need a fortune told. This person 
needs help!” 

“That’s different,” she says. “My fortunes are all fake.” You notice her 
accent has now disappeared. 

Your heart sinks. You thought she was going to be someone with real 
powers. 

“But my powers are very real,” she says, as if she had read your mind. 
“But I don’t use them on fortunes. Everyone wants the same thing. Fame, 
money, success....” She sighs. “Now, tell me — what’s your problem?”'),
('2','119','“What’s the condition?” Barney sobs. “I’ll do anything you say. Anything 
at all.” 

“First,” you say, “you have to promise not to call the police.” 

“I promise,” Barney cries. 

“You must also promise that from now on you’ll be nice to your cousin. 
You’ll share your bike and all your toys. And you’ll never pound anyone ever 
again.” 

“I promise,” Barney gulps. 

“Very well,” you announce. “You may live.” 

You prepare to set him down when your whole body suddenly begins to 
feel warm. It feels almost as if — 

Uh-oh. '),

('2','120','You figure the best thing to do is see a doctor. 

But how will you find one? You check by the phone. That’s where parents 
usually keep emergency phone numbers. And this is definitely an emergency. 

You’re in luck! There’s a list posted on the wall. And right between the 
phone number for the police and the phone number for pizza delivery, there’s 
a number for a Dr. Jenner. 

You dial quickly. You try not to notice how far you have to stretch to 
reach the phone. 

A woman’s voice comes on the line. “Dr. Jenner’s office.” 

“I have to see the doctor right away,” you say. 

“What’s the problem?” the woman asks. 

“I’m shrinking!” you blurt out. 

There’s dead silence on the other end of the line. 

“Please! You have to help me,” you beg. “My clothes are too big, I can’t 
reach the phone, and my watch —” 

“May I speak to an adult?” the woman breaks in. 

You can tell she doesn’t believe you. “No one is home,” you explain. 

“And this is an emergency.” 

“The doctor is very busy,” the woman says coldly. “And I don’t have time 
for prank phone calls.” 

You slam down the phone in frustration.'),
('2','121','The police are still after you. And they’ve sent for reinforcements. You 
head away from the circus, toward the highway. 

The sirens are growing closer. Your heart pounds in terror as you see 
blinking emergency lights approaching on the highway. How will you ever 
get out of here? 

You glance in the other direction. More lights. More sirens. 

And an elephant! 

“AROOOOO!” Dodo trumpets. She must have followed you. 

You glance at the elephant. She definitely likes you. She actually seems to 
be smiling. 

You stare back at the highway. Then you get an idea. 

“Dodo,” you whisper, “how would you like to do me a really big favor?” 

“AROOOO!” the elephant answers. It’s as if Dodo understands you. 

“Dodo,” you tell the elephant. “Here’s the plan. You distract them while I 
run away.” 

You could swear Dodo nods at you. You pat Dodo on the rear. The 
elephant lumbers down the highway. Right toward the police. 

You watch as the police cars skid and swerve to avoid the elephant. Dodo 
swings her trunk at the cars. She seems to be having a good time. 

You take off in the opposite direction.'),
('2','122','Dora reaches into the box and pulls out Aunt Fiona’s eye makeup. Then 
she leans closer to the mirror. 

You jump up and grab a large bath towel that’s dangling from the towel 
rack next to the sink. You begin to climb it, using the rough threads for 
handholds. 

You’ve nearly reached the sink when the towel starts to slip. Your weight 
is pulling it down! 

Your only choice is to leap onto the sink. You barely make it. You hang on 
to the slippery porcelain by your fingertips. Then you pull yourself all the 
way onto the sink. 

All this time Dora continues to put on makeup. Badly. She’s now applying 
mascara. “Dora!” you yell. 

She picks up a tube and pulls off the top. Then she starts to put on 
lipstick. She’s smearing it all over her face. 

“Dora!” you repeat. You try to get right under her and nearly trip over a 
toothbrush. As you regain your balance, one of your feet slides out from 
under you. You’re skidding on a smear of toothpaste on the porcelain. 
Somehow, you keep from sliding off the edge of the sink. 

Dora is still gazing at herself in the mirror. 

This isn’t working. You’ve got to do something more obvious.'),
('2','123','“I’ll never surrender!” you reply. You turn to run. 

“Capture the alien!” Dr. Harlan shouts. “Don’t let it get away!” 

You wish! you think. How can they catch you? You’re twenty times as big 
as any of them. 

But on the other hand, where can you go? 

Do you really want to spend the rest of your life trying to escape? Maybe 
if you talk to Dr. Harlan, you can convince him you’re not an alien. Maybe he 
can use his scientific knowledge to return you to your normal size. 

You stop running and turn back. Dr. Harlan’s red van is heading right for 
you. 

“I want to talk,” you announce. 

The van stops. Dr. Harlan steps out. “I’m listening!” he calls. “You have 
thirty seconds to explain yourself.” 

You think carefully. Whatever you say next could affect your whole 
future. But before you can begin, you suddenly feel very strange. You’re 
dizzy, and your mouth has become dry. Painfully dry. 

What’s going on?'),
('2','124','You wait for Puff to lift her paw. Then you dash for the door as fast as you 
can. 

But Puff is too quick for you. With amazing force, she smashes you with 
her paw. You fly across the porch. Everything goes black. 

When you come to, you are in bed. Aunt Fiona must have found you and 
brought you upstairs, you figure. 

Then you realize something — something wonderful! The bed is the right 
size! The pillow fits your head perfectly! You pull up the blankets, and your 
toes pop out the other end. You’re back to normal! You are your regular size 
again. 

You feel great. You leap to your feet and run over to inspect yourself in 
the mirror. It’s hanging at the perfect height. You don’t even have to stand on 
your toes to see your reflection. Maybe it was all just a bad dream, you think. 

But then you notice something terrifying outside the window. It’s a pair of 
giant yellow eyes, gazing down at you. Gigantic eyes in a huge tiger face. 

Puff! 

Somehow, you ended up in the dollhouse. No wonder the miniature 
furniture was just the right size for you. 

You are a miniature kid. 

Sorry. I guess this wasn’t your lucky day after all.'),
('2','125','You lick up all the powder on your palm. 

A second later, your mouth feels as if it’s on fire! This is the hottest stuff 
you’ve ever tasted! 

You rush outside the big top searching for water. You spot a big tank 
that’s used to water the animals. You grab it up and drain it in one gulp! 

It doesn’t help. You’ve got to find more water! 

You rush away from the circus. In the distance you see a lake. You take 
three big steps, and you’re there. You kneel down and begin to sip from the 
lake. 

By the time the lake is empty, you start to feel better. You stand up — and 
notice that you’re bigger. Much, much bigger. 

You’re so big that the dry lake is a tiny dot far below you. 

A jet plane buzzes by your ear. 

You’re so big your feet cover a whole county! 

It appears that you took too much of the herbal powder. It’s having a 
reverse effect! 

Uh-oh! You can’t breathe. You’re so tall your head reaches into outer 
space. 

Too bad, it looks as if this big adventure was really out of this world!'),
('2','126','Better stick to your original plan. Your aunt will definitely want to help 
you. These scientists might want to turn you into an experiment! 

You hurry toward the main building, but you aren’t getting very far. Since 
your feet are now the size of a normal human’s fingernail, it’s no surprise. 

You’re exhausted. But you finally spot the administration building. Just as 
you take a step, those pink dots swim in front of your eyes. That awful 
tingling starts again. 

When everything returns to normal you are shocked by how tiny you are. 
A blade of grass seems as big as an oak tree! 

Then, the dots appear again! Oh, no! You’re still shrinking! 

You took too long to get help. And now, it’s too late. You are shrinking down 

to nothing. 

Going, going, '),
('2','127','You watch as the huge beast climbs through the hole toward you. Its face 
is covered with hair. It has a long, pointed snout and huge yellow teeth. It 
opens its mouth and lets out a loud SQUEAK! 

You realize that the terrifying monster is a mouse! 

And it’s three times bigger than you are. 

You are really small now! 

The mouse glances around the cupboard, probably looking for food. Then 
it spots you. 

Its long whiskers twitch as it sniffs in your direction. It begins to move 
toward you. 

What will you do now? Should you try to fight it off? 

Or maybe it’s as gentle as the mice in the cage in your school classroom. 
Maybe you should make friends with it. 

Whatever you decide, you’ve got to do something soon! There’s no way 
out of the cupboard except through the mouse hole. And the mouse is now 
less than a whisker away!'),
('2','128','The dinosaur’s long, gray body is covered with scales. It grips the ground 
with cruel-looking claws. Its narrow tongue flicks in and out of its wide 
mouth. 

But it can’t possibly be here! Dinosaurs became extinct millions of years 
ago. 

Then you realize that it’s not a dinosaur. It’s a gray, striped lizard. But 
you’re so small now, it might as well be Tyrannosaurus rex! 

The lizard fixes its beady eyes on you. It flicks its tongue out again. Then 
it begins marching toward you. 

It thinks you’re its dinner! 

Quick! Get out of here now!'),
('2','129','“I know you were down there,” Dora continues in her whiny voice. “And 
if you won’t play tea party with me, I’ll tell.” 

Great, you think, I’ve been here less than a day, and I’m going to get into 
trouble already. Dora is such a pain. 

“I don’t want to play tea party!” you shout. Wow, you think, was that me? 
You can’t believe how loud your voice has become. 

Dora’s eyes grow big. She actually looks afraid. 

“You better not squeal on me,” you command. 

“Okay,” Dora says. “I won’t tell anybody you were in the basement.” She 
hurries down the hall. 

Getting bigger is great, you decide. Anything that makes both Barney and 
Dora stop bothering you is fantastic. This growth spurt happened at just the 
right time! 

Now that you’ve got your cousins off your back, you decide to explore 
the neighborhood. As you leave the house you realize that Uncle Harvey’s 
shoes fit really well. Too well. They aren’t big anymore. Weird, you think. 

You must still be growing. You push the thought out of your mind. 

You notice some kids playing baseball in an empty field across the street. 
You jog over to them. 

Then you hear, “Get out of here, shrimp!” Barney is glaring at you from 
center field.'),

('2','130','In front of the sideshow tent is a big sign: see the bearded lady, meet 

THE MONKEY-FACED MAN. THRILLS AND CHILLS! 

Quickly, you duck inside. You are amazed by what you see. Over in the 
corner a man covered from head to toe in tattoos is swallowing swords. A tiny 
woman and man in elegant clothes are watching his performance. They barely 
come up to the tattooed man’s knees. 

You glance to the opposite side of the tent. The fattest lady you have ever 
seen is trimming her long black beard. A man is helping her by holding a 
mirror. But he’s standing on his hands and holding the mirror between his 
feet! 

Hey, you think, being big isn’t so bad here! 

Just then, you feel something poke you in the shoulder. Startled, you turn 
and come face-to-face with a small, fat man in a yellow clown suit. 

“You’re late!” he scolds you. He sounds mad, but you can’t help laughing. 
It’s hard to take him too seriously with his whiteface makeup and a giant 
painted red mouth. 

“This is no laughing matter,” he says. “It’s show time! Now, get out 
there!” Before you can protest, he pokes you with a large tent pole. 

“Youch!” you exclaim as you stumble through a flap in the curtain. It’s 
dark. Something smells really gross. Where are you?'),
('2','131','This magnetism might not be so bad, you think. Maybe this summer 
won’t be so boring after all! 

As you walk along the street, you pretend you are a magnetic superhero. 
Every time you pass by a metal pole, you act as if you are commanding it to 
bow down to you. 

If only Barney and Dora were metal robots, you think. I’d have it made! 

You think about how you can take advantage of your new magnetic 
power. Suddenly, you hear a strange sound. It almost sounds like a roaring 
ocean. You turn to see what could be making such a racket. 

You can’t believe what you are seeing! Hundreds and hundreds of cans 
are flying in your direction. They look like a swarm of giant metal bees. They 
soar over a high cement wall, heading right your way. You glance at the sign 
on the wall. 

FISKEVILLE RECYCLING CENTER. 

You are about to be crushed under thousands of pounds of recyclable cans 
— thanks to your magnetic personality.'),
('2','132','You gaze at the kid in shock. The kid stares back, looking just as stunned. 
You realize what must have happened. 

“The laser switched our bodies!” Dr. Abbott cries. But he says it in your 
voice. 

“I know,” you reply, sounding like Dr. Abbott. 

“We have to switch back!” he exclaims. 

You think for a moment. “Not yet,” you reply. 

“What do you mean, ‘Not yet’?” Dr. Abbott demands. “When?” 

“After the summer is over,” you say. When I won’t be stuck with Barney 
the Bully and Dull Dora anymore, you think. 

“Out of the question!” Dr. Abbott roars. 

“Can you change back without my help?” 

“Of course not!” Dr. Abbott exclaims. 

“Then I guess you don’t have a choice,” you state calmly. You go to the 
desk and find your aunt’s number in the directory. 

“What are you doing?” Dr. Abbott demands as you punch in your aunt’s 
number. “You can’t just leave me like this!” 

You hear Aunt Fiona’s voice come on the line. 

“Can you please get this kid out of here?” you bark in Dr. Abbott’s 
grown-up voice. “I can’t get any work done!” 

“Don’t worry, Doc,” you say as you hang up. “I’ll come get you as soon 
as I discover a formula to make my creepy cousins disappear.”'),
('2','133','he safety pin clatters to the ground. 

You missed. 

Well, you’ll just have to try again. 

You plant your feet, twirl the rope over your head, focus on the shelf, and 


This time it works! The pin catches on the top shelf. With all your 
strength, you pull yourself hand over hand up the string. 

By the time you’re halfway up, your arm muscles are trembling. A breeze 
causes the string to swing out and away from the refrigerator. You swing back 
and forth. Back and forth. You hold on to the string tightly till the breeze dies 
down. Then you continue climbing. 

At last you reach the top shelf. You let go of your rope-string and gaze 
around. Oh, no! 

The jar is gone! All that’s left is the chocolate-cake box. 

Now what do you do? This was your last chance.'),
('2','134','What is happening to me? you wonder. Am I sick? Do I have a weird 
disease? If I keep getting bigger, I’m not going to fit into any of my clothes! 

You stop in the middle of the street. 

A terrible thought has just occurred to you. 

What if you never stop growing? 

You stand there, worrying, and a bus pulls up to the curb and stops. You 
notice a huge advertisement plastered on its side: 

GETTING TOO BIG? 

CLOTHES SEEM TO BE SHRINKING? 

THE SOLUTION IS AT ARNOLD’S! 

Who is Arnold? you wonder. And could Arnold’s be the answer to your 
problem? '),
('2','135','You hear the sharp CRACK! as the bat connects with the ball. Then you 
watch, amazed, as the ball takes off, high in the air, clear across the field. 

“Home run!” some of the kids shout. 

You notice Barney’s mouth drop open. 

You don’t move from the plate. You stare as the ball continues straight 
toward a house on the next block. You watch in disbelief as the ball smashes 
right through the enormous front window. 

You don’t even care that you broke the window. This was your first home 
run ever! As you round the bases your teammates cheer. Even Barney looks 
impressed. 

You feel great! Until you hear the unmistakable sound of police sirens. 

Headed your way.'),
('2', '136', 'THE END');












































































INSERT INTO options (
  page_id,
  target_page,
  option_text
)
VALUES 
('1', '2', 'Go to PAGE 2'),
('2', '3', 'To take a closer look, turn to PAGE 3'),
('3', '10', 'If you decide to go home, turn to PAGE 10.'),
('3', '6', 'If you climb the fence to get inside, turn to PAGE 6 .'),
('4', '34', 'To go on the rides, turn to PAGE 34.'),
('4', '77', 'To check out the midway, turn to PAGE 77.'),
('5', '127', 'Run to PAGE 127.'),
('6', '7', 'Race over to PAGE 7.'),
('7','87','Be more amazed on PAGE 87.'),
('8','9','Go to PAGE 9.'),
('9', '15','Did you land on 15?'),
('9', '19','Did you land on 19?'),
('9', '38','Did you land on 38?'),
('9', '49','Did you land on 49?'),
('10','6','Turn back to PAGE 6.'),
('11','35','Race to the back of the Freak Show on PAGE 35 .'),
('12','136','THE END'),
('13','48','Escape through the door down the hall, go to PAGE 48.'),
('13','62','Stay and talk to Big Al, go to PAGE 62.'),
('14','41','What does she mean ? Turn to PAGE 41 to find out.'),
('15','136','THE END'),
('16','72', 'For Guess Your Weight on Mars, go to PAGE 72.'),
('16','8', 'To play Wheel of Chance, go to PAGE 8.'),
('17','84', 'The Final Challenge begins on PAGE 84.'),
('18','134', 'Weigh in on PAGE 134.'),
('19','9', 'If you think you don’t have enough points, go back to PAGE 9 and spin again.'),
('19','72', 'If you think you have enough points and you haven’t played Guess Your Weight, go to PAGE 72.'),
('19','17', 'If you have played Guess Your Weight, go to PAGE 17.'),
('20','136', 'THE END'),
('21','136', 'THE END'),
('22','8', 'If you have not tried the Wheel of Chance, go to PAGE 8.'),
('22','17', 'If you Ve already played the Wheel of Chance, go to PAGE 17.'),
('23','103', 'If you decide to jump out, go to PAGE 103.'),
('23','119', 'If you urge the horse to gallop, go to PAGE 119.'),
('24','136', 'THE END'),
('25','44', 'ON PAGE 44?'),
('25','74', 'ON PAGE 74?'),
('25','124', 'ON PAGE 124?'),
('26','58', 'Go on to PAGE 58.'),
('27','55', 'Turn to PAGE 55.'),
('27','45', 'If it’s sunny out, turn to PAGE 45.'),
('28','85', 'If it’s raining or if it’s nighttime, turn to PAGE 85.'),
('29','65', 'Squeeze over to PAGE 65.'),
('30','88', 'Want to try the Boat Trip to Nowhere? Go to PAGE 88.'),
('30','66', 'Ready for the House of Horrors? Go to PAGE 66.'),
('31','89', 'Go to PAGE 89.'),
('32','105', 'Turn to PAGE 105'),
('33','89', 'If it comes up heads, take the blue door to PAGE 57.'),
('33','105', 'If it comes up tails, take the red door to PAGE 104.'),
('34','89', 'Quick! Go to PAGE 47.'),
('35','13', 'Go to PAGE 13.'),
('36','118', 'Turn to PAGE 118. HELP!'),
('37','93', 'Turn to PAGE 93.'),
('38','9', 'If you want to spin again for more points, go to PAGE 9.'),
('38','72', 'If you haven’t played Guess Your Weight on Mars yet, go to PAGE 72.'),
('38','17', 'If you have played Guess Your Weight on Mars, go to PAGE 17.'),
('39','94', 'What happens? Turn to PAGE 94 to find out!'),
('40','136', 'THE END '),
('41','16', 'Turn to PAGE 16 to find out.'),
('42','108', 'Halloween Express ? Then turn to PAGE 108.'),
('42','107', 'Mountain King? Then turn to PAGE 107.'),
('43','84', 'You have no choice. Follow Big Al to PAGE 84.'),
('44','25', 'Go back to PAGE 25 and spin again.'),
('45','98', 'Turn to PAGE 98.'),
('46','136', 'THE END ? 
Yes.'),
('47','26', 'If you decide to join Patty and Brad on the Space Coaster, get on board on PAGE 26.'),
('47','64', 'If you want to go to the House of Horrors alone, go to PAGE 64.'),
('48','60', 'Hurry to PAGE 60.'),
('49','50', 'Fly on to PAGE 50.'),
('50','115', 'If you haven’t, go to PAGE 115.'),
('51','136', 'THE END'),
('52','24', 'Chug to PAGE 24.'),
('53','40', 'Go to PAGE 40.'),
('54','83', 'Turn left! And go to PAGE 83.'),
('55','69', 'If you think the words are karru marri odonna loma molonu karrano, go to PAGE 69.'),
('55','82', 'If you think the words are oooopah lupah dummie dupah, go to PAGE 82.'),
('56','37', 'Turn to PAGE 37.'),
('57','135', 'Turn to PAGE 135.'),
('58','39', 'Turn to PAGE 39.'),
('59','11', 'If you decide to help the freaks, go to PAGE 11.'),
('59','113', 'If you don’t want to help the freaks, go to PAGE 113.'),
('60','125', 'If you run to the left, turn to PAGE 125.'),
('60','12', 'If you run to the right, turn to PAGE 12.'),
('61','136', 'THE END'),
('62','84', 'If you want to go with Al, turn to PAGE 84.'),
('62','102', 'If you trust the Snake Lady, turn to PAGE 102.'),
('63','48', 'Follow Patty? Turn to PAGE 48.'),
('63','86', 'You choose not to take the back way out? Go to PAGE 86.'),
('64','46', 'Make a grab for the side of the bridge? Turn to PAGE 46.'),
('64','30', 'Flap your arms and try to fly? Turn to PAGE 30.'),
('65','31', 'Bounce to PAGE 31.'),
('66','80', 'Look for a way out on PAGE 80.'),
('67','91', 'Try, on PAGE 91.'),
('68','136', 'THE END'),
('69','136', '“ THE END .” 
Wait! This isn’t the way this is supposed to end. Quick — you have one 
last chance. If the fortune-teller told you a secret number, go to that page 
now!'),
('70','52', 'Turn to PAGE 52.'),
('71','136', 'Turn to PAGE 52. '),
('72','18', 'Go to PAGE 18.'),
('73','136', 'THE END '),
('74','131', 'Turn to PAGE 131.'),
('75','96', 'Turn to PAGE 96.'),
('76','136', 'THE END! 

THE END! 

THE END! 


THE END! '),
('77','78', 'To find your future, go to PAGE 78.'),
('78','14', 'Pick red? Go to PAGE 14.'),
('78','59', 'Pick blue? Go to PAGE 59.'),
('79','67', 'Turn to PAGE 67 to find out what.'),
('80','29', 'If you decide to turn right, go to PAGE 29.'),
('80','118', 'If you decide to turn left, go to PAGE 118.'),
('81','136', 'THE END'),
('82','136', 'THE END'),
('83','73', 'If you can do it — turn to PAGE 73.'),
('83','127', 'If you couldn ’t — turn to PAGE 127.'),
('84','123', 'You’re going to find out on PAGE 123.'),
('85','126', 'Turn to PAGE 126.'),

('86','136', 'THE END '),
('87','4', 'Uh-oh. Quick! Better turn to PAGE 4.'),
('88','32', 'Enter the bog on PAGE 32.'),
('89','79', 'Try to kick the doctor and run ? Turn to PAGE 79.'),
('89','51', 'Wait until one of the monsters leaves and the odds are better than three against one? Turn to PAGE 51.'),
('90','100', 'If you decide to wait to be rescued, go to PAGE 100.'),
('90','56', 'If you decide to swim for it, go to PAGE 56.'),
('91','22', 'Turn to PAGE 122 '),
('92','20', 'Hold your breath and turn to PAGE 20.'),
('93','26', 'Quick! Hurry to PAGE 26 and you can go on the Space Coaster with them. '),
('94','92', 'Wait for help to come? Turn to PAGE 92.'),
('94','111', 'Hop out of the car? Go to PAGE 111.'),
('95','117', 'To find out what’s so funny, turn to PAGE 117.'),
('96','23', 'Turn to PAGE 23.'),
('97','129', 'Hurry to PAGE 129.'),
('98','136', 'THE END '),
('99','104', 'If you leave by the red door, go to PAGE 104.'),
('100','136', 'THE END (Burp!)'),
('101','136', 'THE END '),
('102','120', 'Turn to PAGE 120 for the bad news.'),
('103','109', 'Go to PAGE 109.'),
('104','61', 'Go to PAGE 61.'),
('105','90', 'Turn to PAGE 90.'),
('106','42', 'Turn to PAGE 42.'),
('107','75', 'If you want to go on the Mountain King ride, turn to PAGE 75.'),
('107','75', 'If you want to go on the Mountain King ride, turn to PAGE 75.'),
('108','54', 'Speed over to PAGE 54.'),
('109','114', 'If you are reading this book on a Monday, Wednesday, Friday, or Saturday, go to PAGE 114.'),
('109','71', 'If it’s a Tuesday, Thursday, or Sunday, go to PAGE 71.'),
('110','133', 'Quick — head over to PAGE 133.'),
('111','99', 'Follow the dwarf? Go to PAGE 99.'),
('111','33', 'Decide not to follow the dwarf? Go to PAGE 33.'),
('112','136', 'THE END'),
('113','16', 'See what happens on PAGE 16.'),
('114','5', 'Run down a different path? Go to PAGE 5.'),
('114','108', 'Halloween Express ? Go to PAGE 108.'),
('115','136', 'THE END'),
('116','97', 'If you won a can of Monster Blood, go to PAGE 97.'),
('116','27', 'If you don’t have the Monster Blood, run to PAGE 27.'),
('117','106', 'Unless what? Turn to PAGE 106.'),
('118','36', 'Turn to PAGE 36. HELP!'),
('119','136', 'THE END'),
('120','28', 'Turn to PAGE 28.'),
('121','63', 'Zoom to PAGE 63.'),
('122','81', 'If you think the creature is a robot, try to knock his head off on PAGE 81.'),
('122','110', 'If you think he’s a real monster or something worse, stay cool on PAGE 110.'),
('123','25', 'Zing back to PAGE 25.'),
('124','112', 'Your eyes flutter open on PAGE 112.'),
('125','43', 'Don’t scream yet. Turn to PAGE 43.'),
('126','136', 'THE END'),
('127','130', 'Cannon ? Go to PAGE 130.'),
('127','128', 'Choo-choo? Go to PAGE 128.'),
('128','70', 'Turn to PAGE 70.'),
('129','136', 'THE END'),
('130','101', 'Go to PAGE 101. SUCKER!'),
('131','116', 'Quick! Turn to PAGE 116.'),
('132','21', 'Turn to PAGE 21.'),
('133','117', 'You have no choice. You have to open the door and go to PAGE 117.'),
('134','53', 'If you think your Mars weight is 37 to 39, go to PAGE 53.'),
('134','22', 'If you think your Mars weight is less than 37 or more than 39, go to PAGE 22.'),
('135','121', 'Pick slide 1,4, or 5, and go to PAGE 121.'),
('135','95', 'Pick slide 2, 7, or 9, and go to PAGE 95.'),
('135','68', 'Pick slide 3, 6, 8, or 10, and go to PAGE 68.'),
('136','1', 'Start over?'),

-- // book 2
('137','138','Go on to PAGE 2.'),
('138','159','Turn to PAGE 23.'),
('139','240','Fly on to PAGE 104.'),
('140','270','Turn to PAGE 134.'),
('141','175','If you dash into the physics building, zoom over to PAGE 39.'),
('141','262','If you keep looking for your aunt, turn to PAGE 126.'),
('142','255','Go on to PAGE 119.'),
('143','215','Should you eat just part of the mixture? Turn to PAGE 79.'),
('143','261','Or maybe you ought to take the whole thing — try PAGE 125.'),
('144','272','FLAT END'),
('145','187','Go on to PAGE 51.'),
('146','249','If you join the circus, turn to PAGE 113.'),
('146','254','If you say no thanks, go to PAGE 118.'),
('147','179','Go to PAGE 43.'),
('148','239','For the number 103 bus, race over to PAGE 103.'),
('148','141','Or take the number 5 bus on PAGE 5.'),
('149','208','What is it? Turn to PAGE 72.'),
('150','165','Turn to PAGE 29.'),
('151','226','Turn to PAGE 90.'),
('152','227','Go on to PAGE 91.'),
('153','230','Hurry to PAGE 94.'),
('154','246','Turn to PAGE 110.'),
('155','260','Is today Monday, Wednesday, Thursday, or Friday? If so, turn to PAGE 124.'),
('155','167','Or is it Tuesday, Saturday, or Sunday? Turn to PAGE 31.'),
('156','272','THE END'),
('157','203','Choose the blue liquid, turn to PAGE 67.'),
('157','164','Pick the purple liquid, turn to PAGE 28.'),
('158','272','END'),
('159','244','Gulp. Go on to PAGE 108.'),
('160','217','GTurnt o PAGE 81.'),
('161','272','THE END'),
('162','271','Swing the bat on PAGE 135.'),
('163','216','Turn to PAGE 80.'),
('164','272','THE END'),
('165','153','If you taste the purple goop, turn to PAGE 17.'),
('165','247','If you try the cake, go on to PAGE 111.'),
('166','268','Turn to PAGE 132.'),
('167','194','Turn to PAGE 58.'),
('168','198','Go on to PAGE 62.'),
('169','232','Flip to PAGE 96!'),
('170','151','Quick! Turn to PAGE 15.'),
('171','238','Turn to PAGE 102.'),
('172','193','If you decide to take the leap, turn to PAGE 57.'),
('172','251','If you think you should climb down, turn to PAGE 115.'),
('173','139','Turn to PAGE 3 — if you can stand it!'),
('174','223','Quick! Hurry to PAGE 87.'),
('175','144','Duck through the door that’s closest on PAGE 8.'),
('175','245','Or try for Dr. Abbott’s lab on PAGE 109.'),
('176','272','BACK END'),
('177','168','Head for Effy ’s Bakery on PAGE 32.'),
('177','210','Or search for Maddy’s Bakery on PAGE 74.'),
('178','211','Find out on PAGE 75.'),
('179','272','THE END'),
('180','253','Turn to PAGE 117.'),
('181','272','THE END'),
('182','272','END'),
('183','244','Return to PAGE 108 to choose again.'),
('184','269','Find out on PAGE 133.'),
('185','233','Try the crumb on PAGE 97.'),
('185','243','Or taste the icing on PAGE 107.'),
('186','236','Go to PAGE 100.'),
('187','222','Turn to PAGE 86.'),
('188 ','213','You might as well leave it to chance. Flip a coin three times. If it 
comes up heads or tails three times in a row, steer your Popsicle stick to 
PAGE 77.'),
('188','173','If the coin comes up two heads and one tail, or two tails and one head, 
move on to PAGE 37.'),
('189','272','THE END'),
('190','174','The big top? Turn to PAGE 38.'),
('190','266','Or enter the sideshow tents on PAGE 130.'),
('191','272','THE END'),
('192','272','THE END'),
('193','228','Turn to PAGE 92.'),
('194','258','Turn to PAGE 122.'),
('195','264','Rush to PAGE 128.'),
('196','184','Find out on PAGE 48.'),
('197','169','Try the new reducing machine on PAGE 33.'),
('197','241','Or go to the steam room on PAGE 105.'),
('198','157','Turn to PAGE 21.'),
('199','202','Go to PAGE 66.'),
('200','242','Escape on PAGE 106.'),
('201','257','Go on to PAGE 121.'),
('202','189','Do you head straight home? Then turn to PAGE 53.'),
('202','267','Or if you want to see what other magnetic possibilities you have, go to PAGE 131.'),
('203','272','THE END'),
('204','194','Turn to PAGE 58.'),
('205','178','Will you give up? Surrender on PAGE 42.'),
('205','259','Or try to get away on PAGE 123.'),
('206','221','Go to PAGE 85.'),
('207','150','Turn to PAGE 14.'),
('208','263','Turn to PAGE 127.'),
('209','231','Go on to PAGE 95.'),
('210','205','Turn to PAGE 69.'),
('211','272','THE END'),
('212','199','Did it work? Turn to PAGE 63.'),
('213','272','END'),
('214','186','Turn to PAGE 5O.'),
('215','177','Run to PAGE 41.'),
('216','265','Turn to PAGE 129.'),
('217','149','Dash into the kitchen and hide in a cupboard on PAGE 13.'),
('217','229','Or find a hiding spot outdoors. Run to PAGE 93.'),
('218','272','THE END'),
('219','200','Turn to PAGE 64.'),
('220','152','If you are able to do five push-ups, turn to PAGE 16.'),
('220','176','If you can do less than five push-ups, turn to PAGE 40.'),
('221','188','If it’s a Popsicle stick, go to PAGE 52.'),
('221','147','If it’s a blue plastic can with the words monster blood on it, turn to PAGE 11.'),
('222','212','Do you want to try magnetism ? Go to PAGE 76.'),
('222','237','Or is the laser gun the answer? Turn to PAGE 101.'),
('223','146','Go to PAGE 10.'),
('224','242','Turn to PAGE 116.'),
('225','162','You can stand up to Barney the Bully by rushing over to PAGE 26!'),
('226','142','Grab him and try to explain? Turn to PAGE 6.'),
('226','219','Or throw something in his path on PAGE 83.'),
('227','201','Turn to PAGE 65.'),
('228','166','If you were bom in the first half of the year — January through June — turn to PAGE 30.'),
('228','204','If you were born in the months of July through December, turn to PAGE 68.'),
('229','154','Quick! Turn to PAGE 18.'),
('230','158','If you refuse to budge, turn to PAGE 22.'),
('230','171','If you give in and play with Dora, turn to PAGE 35.'),
('231','170','Rush down to the basement on PAGE 34.'),
('232','272','THE END'),
('233','272','THE END'),
('234','161','If you have an EVEN number of letters, turn to PAGE 25.'),
('234','224','If the number of letters is ODD, turn to PAGE 88.'),
('235','250','Quick! Turn to PAGE 114.'),
('236','160','If you think you can find the refrigerator at the dump, hurry to PAGE 24.'),
('236','256','If you think you should see a doctor, turn to PAGE 120.'),
('237','172','Quick! Turn to PAGE 36!'),
('238','214','What is going on ? Rush to PAGE 78.'),
('239','194','Turn to PAGE 58.'),
('240','195','Quick! Jump off the water bug and turn to PAGE 59.'),
('241','272','END'),
('242','190','Turn to PAGE 54.'),
('243','191','Turn to PAGE 55.'),
('244','207','To creep down to the basement, turn to PAGE 71.'),
('244','183','Or find another hiding place on PAGE 47.'),
('245','145','Turn to PAGE 9.'),
('246','155','Run for the door on PAGE 19.'),
('246','180','Or head for the dollhouse, PAGE 44.'),
('247','163','What is it? Turn to PAGE 27.'),
('248','209','If you wait for the police and confess, turn to PAGE 73.'),
('248','140','If you run and hide, race to PAGE 4.'),
('249','192','Get to work on PAGE 56.'),
('250','272','END '),
('251','272','THE END'),
('252','181','Turn to PAGE 45.'),
('253','218','Turn to PAGE 82.'),
('254','143','Tell her on PAGE 7.'),
('255','182','What’s happening? Find out on PAGE 46.'),
('256','148','Now what? Turn to PAGE 12.'),
('257','177','Run to PAGE 41.'),
('258','206','Get noticed on PAGE 70.'),
('259','156','Find out on PAGE 20.'),
('260','272','THE END'),
('261','272','THE END'),
('262','272','THE END'),
('263','234','Fight the mouse? Turn to PAGE 98.'),
('263','252','Or make friends with it? Try PAGE 116.'),
('264','235','Head for the pile of twisted metal on PAGE 99.'),
('264','196','Or run for the jungle — PAGE 60.'),
('265','162','If you stand up to Barney and join the game, turn to PAGE 26.'),
('265','225','If you try to avoid him, turn to PAGE 89.'),
('266','220','Find out on PAGE 84.'),
('267','272','THE END'),
('268','272','THE END'),
('269','185','Go to PAGE 49.'),
('270','197','If you go to Arnold’s, turn to PAGE 61.'),
('270','231','If you think you should continue home, go to PAGE 95.'),
('271','248','Go on to PAGE 112.'),
('272','137', 'Start over?');


-- ('','',''),
-- ('','',''),
-- ('','',''),
-- ('','',''),
-- ('','',''),
-- ('','',''),
-- ('','',''),
-- ('','',''),
-- ('','',''),
-- ('','',''),
-- ('','',''),
-- ('','',''),
-- ('','',''),
-- ('','',''),
-- ('','',''),
-- ('','',''),
-- ('','',''),
-- ('','',''),
-- ('','',''),
-- ('','',''),
-- ('','',''),
-- ('','',''),
-- ('','',''),
-- ('','',''),
-- ('','',''),
-- ('','',''),
-- ('','',''),
-- ('','',''),
-- ('','',''),
-- ('','',''),
-- ('','',''),
-- ('','',''),
-- ('','',''),
-- ('','',''),
-- ('','',''),
-- ('','',''),
-- ('','',''),
-- ('','',''),
-- ('','',''),
-- ('','',''),
-- ('','',''),
-- ('','',''),
-- ('','',''),
-- ('','',''),
-- ('','',''),
-- ('','',''),
-- ('','',''),
-- ('','',''),
-- ('','',''),
-- ('','',''),
-- ('','',''),
-- ('','',''),
-- ('','',''),
-- ('','',''),
-- ('','',''),
-- ('','',''),
-- ('','',''),
-- ('','',''),
-- ('','',''),
-- ('','',''),
-- ('','',''),
-- ('','',''),
-- ('','',''),
-- ('','',''),
-- ('','',''),
-- ('','',''),
-- ('','',''),
-- ('','',''),
-- ('','',''),
-- ('','',''),
-- ('','',''),
-- ('','',''),
-- ('','',''),
-- ('','',''),
-- ('','',''),
-- ('','',''),
-- ('','',''),
-- ('','','');



-- ('2','1',''),
-- ('2','2',''),
-- ('2','3',''),
-- ('2','4',''),
-- ('2','5',''),
-- ('2','6',''),
-- ('2','7',''),
-- ('2','8',''),
-- ('2','9',''),

-- ('2','10',''),
-- ('2','11',''),
-- ('2','12',''),
-- ('2','13',''),
-- ('2','14',''),
-- ('2','15',''),
-- ('2','16',''),
-- ('2','17',''),
-- ('2','18',''),
-- ('2','19',''),

-- ('2','20',''),
-- ('2','21',''),
-- ('2','22',''),
-- ('2','23',''),
-- ('2','24',''),
-- ('2','25',''),
-- ('2','26',''),
-- ('2','27',''),
-- ('2','28',''),
-- ('2','29',''),

-- ('2','30',''),
-- ('2','31',''),
-- ('2','32',''),
-- ('2','33',''),
-- ('2','34',''),
-- ('2','35',''),
-- ('2','36',''),
-- ('2','37',''),
-- ('2','38',''),
-- ('2','39',''),

-- ('2','40',''),
-- ('2','41',''),
-- ('2','42',''),
-- ('2','43',''),
-- ('2','44',''),
-- ('2','45',''),
-- ('2','46',''),
-- ('2','47',''),
-- ('2','48',''),
-- ('2','49',''),

-- ('2','50',''),
-- ('2','51',''),
-- ('2','52',''),
-- ('2','53',''),
-- ('2','54',''),
-- ('2','55',''),
-- ('2','56',''),
-- ('2','57',''),
-- ('2','58',''),
-- ('2','59',''),

-- ('2','60',''),
-- ('2','61',''),
-- ('2','62',''),
-- ('2','63',''),
-- ('2','64',''),
-- ('2','65',''),
-- ('2','66',''),
-- ('2','67',''),
-- ('2','68',''),
-- ('2','69',''),

-- ('2','70',''),
-- ('2','71',''),
-- ('2','72',''),
-- ('2','73',''),
-- ('2','74',''),
-- ('2','75',''),
-- ('2','76',''),
-- ('2','77',''),
-- ('2','78',''),
-- ('2','79',''),

-- ('2','80',''),
-- ('2','81',''),
-- ('2','82',''),
-- ('2','83',''),
-- ('2','84',''),
-- ('2','85',''),
-- ('2','86',''),
-- ('2','87',''),
-- ('2','88',''),
-- ('2','89',''),

-- ('2','90',''),
-- ('2','91',''),
-- ('2','92',''),
-- ('2','93',''),
-- ('2','94',''),
-- ('2','95',''),
-- ('2','96',''),
-- ('2','97',''),
-- ('2','98',''),
-- ('2','99',''),

-- ('2','100',''),
-- ('2','101',''),
-- ('2','102',''),
-- ('2','103',''),
-- ('2','104',''),
-- ('2','105',''),
-- ('2','106',''),
-- ('2','107',''),
-- ('2','108',''),
-- ('2','109',''),

-- ('2','110',''),
-- ('2','111',''),
-- ('2','112',''),
-- ('2','113',''),
-- ('2','114',''),
-- ('2','115',''),
-- ('2','116',''),
-- ('2','117',''),
-- ('2','118',''),
-- ('2','119',''),

-- ('2','120',''),
-- ('2','121',''),
-- ('2','122',''),
-- ('2','123',''),
-- ('2','124',''),
-- ('2','125',''),
-- ('2','126',''),
-- ('2','127',''),
-- ('2','128',''),
-- ('2','129',''),

-- ('2','130',''),
-- ('2','131',''),
-- ('2','132',''),
-- ('2','133',''),
-- ('2','134',''),
-- ('2','135',''),
-- ('2','136','');