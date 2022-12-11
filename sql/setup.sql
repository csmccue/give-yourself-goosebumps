-- Use this file to define your SQL tables
-- The SQL in this file will be executed when you run `npm run setup-db`
DROP TABLE IF EXISTS users;
DROP TABLE IF EXISTS books CASCADE;
DROP TABLE IF EXISTS pages CASCADE;
DROP TABLE IF EXISTS options CASCADE;

CREATE TABLE users (
  id BIGINT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
  email VARCHAR,
  password_hash VARCHAR NOT NULL,
  first_name VARCHAR NOT NULL,
  last_name VARCHAR NOT NULL
);

CREATE TABLE books (
  id BIGINT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
  title VARCHAR
);

CREATE TABLE pages (
  id BIGINT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
  book_id BIGINT,
  page_text VARCHAR,
FOREIGN KEY (book_id) REFERENCES books(id)
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
('Escape from the Carnival of Horrors');

INSERT INTO pages (
  book_id,
  page_text
)
VALUES
('1', '"What do you want to do?”
“I don’t know, Patty. What do you want to do?”
“Not fair, Brad. I asked you first.”
Patty and Brad. Your two best friends. Arguing. As usual.
It’s the last week of August. And Patty and Brad haven’t stopped fighting since your summer vacation started.
Patty likes being bossy. You don’t mind, though. It’s no big deal.
It’s hard to win a fight with her anyway. You don’t know why Brad even tries. You guess it’s because he doesn’t want to look like a wimp in front of a girl.
“There’s nothing to do. I guess I’ll just go home,” Brad says. He shoves his hands in his pockets. Then his shoulders slump and he sort of shrivels up. You guess Brad is kind of a wimp — even if he is your best friend.
“You’re so boring, Brad,” Patty complains. Whenever Patty complains, her freckles really pop out. Now there are about a million of them spread across her face.
“Hey! I know what we should do!” Patty suddenly bursts out.'),
('1', '“Let’s bike over to Bennet’s Field and watch them set up the carnival!”
“I don’t know,” you answer. “It’s getting dark, and Mom said I have to be in by nine.”
“It’s only a quick bike ride,” Brad says. “Are you some kind of wimp?”
Brad calling you a wimp? You can’t believe it!
“Okay. Okay,” you agree. “But if it’s as bad as last year, there won’t be much to see. Don’t you remember the main attraction?” you remind them. “The ride they called Terror Track? It turned out to be a baby choo-choo train that circled around and around and around.”
It doesn’t matter what you say. Patty’s made up her mind. You’re going to ride over to the carnival.
A hot, humid breeze blows in your face as you pedal along. Patty’s in the lead. No surprise. And Brad’s puffing behind you.
It’s dark by the time you reach Bennet’s Field.
You and your friends drop your bikes in the grass and race across the moonlit field, toward the huge wooden fence that surrounds the carnival.'),
('1', 'As you reach the carnival entrance, you hear music coming from inside. Not the usual corny organ stuff they always play. But some really strange music. It sounds familiar and totally new at the same time.
Brad stretches his neck to try to peer over the fence. But no luck. The fence is way too high.
Patty jiggles the padlock on the gate. It’s sealed shut.
“I guess we’ll have to wait until tomorrow night when the carnival opens,” Brad says.
“No way,” Patty says. “Let’s climb the fence. Now!”
“Are you crazy?” Brad says. “We’ll get caught!”
“Come on. There’s probably no one in there,” Patty replies.
Your friends turn to you to cast the deciding vote. You glance at your watch. It’s almost 9:00 p.m. If you’re going to get home in time, you should start back now.
What are you going to do?'),
('1', '“Wh-what do you mean?” Brad asks, trembling all over.
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
('1', '“Come on, run!” you yell to Patty and Brad as you spin around. “There’s got to be another way out!”
Big A1 blows a whistle. Its shrill blast hurts your ears. He blows it again and, suddenly, dozens and dozens of carnival people appear out of nowhere. But they don’t look the way they did before.
Some have green flesh. Some are deathly white. Their rotting skin hangs from their bones. Above their sunken cheekbones, their eyes glow an eerie yellow.
You watch in horror as more and more of them appear.
What should you do? Your legs won’t budge. You can’t think clearly. You’re terrified! You stand there — frozen — in a trance.
But Brad breaks the spell when he screams out, “They’re ghosts! That’s why they’re wearing those old-fashioned clothes. They’re dead!”
“Watch out! Over there!” Patty yells. “That — that ghost... It’s coming right at us. Run!”'),




INSERT INTO options (
  page_id,
  target_page,
  option_text
)
VALUES 
('1', '2', 'Go to PAGE 2'),
('2', '3', 'To take a closer look, turn to PAGE 3'),
('3', '10', 'If you decide to go home, turn to PAGE 10.'),
('3', '6', 'If you climb the fence to get inside, turn to PAGE 6 .');
('4', '34', 'To go on the rides, turn to PAGE 34.'),
('4', '77', 'To check out the midway, turn to PAGE 77.'),
('5', '127', 'Run to PAGE 127.')






