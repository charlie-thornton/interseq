package  
{
	public class Words 
	{
		public static function getRandomWord(len:uint):String
		{
			var words:Array;
			switch (len)
			{
				case 3: words = L3; break;
				case 4: words = L4; break;
				case 5: words = L5; break;
				case 6: words = L6; break;
				case 7: words = L7; break;
				default:
					words = new Array("error"); break;
			}
			
			var i:int = (Math.random() * (words.length - 1));
			return words[i];
		}
		
		public static const L3:Array = new Array
		(
			"sap","sat","sad","rat","rap","ram","rag","nap","Nat","mat","map","mad",
			"lap","lag","lad","fat","fan","fad","fin","fit","lid","lip","lit","mid",
			"nit","nip","rid","rig","rim","rip","Sid","sin","sip","log","mom","mop",
			"nod","rod","Ron","rot","sod","fun","mud","mum","nut","rug","rut","sum",
			"sun","fed","led","leg","met","Ned","net","bag","bad","bam","bat","cap",
			"cab","dad","Dan","gas","gag","ham","hat","jab","jam","pan","pat","tab",
			"tag","tan","tap","bid","dig","dip","hid","hit","hip","Jim","jig","kin",
			"kid","pin","pit","pig","tin","tip","Tim","cop","con","Don","dog","hop",
			"hog","job","jog","pot","pop","top","Tom","bug","bud","bum","cup","cub",
			"dud","dug","Gus","gun","hum","jug","pup","tub","tug","beg","bed","bet",
			"hen","jet","Ken","pen","pet","peg","pep","and","for","had","but","not",
			"all","can","out","her","him","see","way","oil","its","day","did","get",
			"may","man","say","too","old","boy","set","put","end","big","ask","men",
			"off","add","saw","got","run","car","sea","eat","far","let","cut","hot",
			"ran","red","sit","six","ten","yes","act","ant","Ben","bit","bun","cat",
			"dam","den","dim","gut","hug","hut","ink","Jan","kit","Sam","tam","van",
			"wet","win","bib","box","bus","dot","fib","fix","fog","fox","gum","lug",
			"mob","mug","Pam","rub","sub","wag","wax","wig","zap","Ann","Kim","mix",
			"Pip","Rex","Tad","Ted","yet","zip","arm","bee","bob","dab","egg","fur",
			"hay","jar","jaw","Jen","joy","law","lay","Lee","lot","moo","nab","oak",
			"oat","pal","paw","pay","raw","ray","rob","Roy","sag","sir","soy","tea",
			"tot","toy","web","yak","yum","zoo","ban","bar","bay","aid","aim","arc",
			"art","ash","axe","cog","cot","ear","eel","elf","elk","elm","fee","fig",
			"fir","gap","inn","Jay","nag","odd","pea","pod","rib","sob","tar","tax",
			"vet","yap","zen","bog","boo","caw","cob","cod","coy","hem","imp","jib",
			"jut","lop","pad","urn","wed","God","sis","ill"
		);
		
		public static const L4:Array = new Array
		(
			"mitt","that","with","this","from","were","when","each","will","then","them","than",
			"been","call","long","part","back","just","help","much","mean","tell","farm","well",
			"must","such","turn","went","read","need","land","hand","play","away","high","food",
			"last","keep","tree","left","seem","next","hard","feet","stop","miss","girl","soon",
			"list","song","best","cold","draw","fall","fast","full","hold","hurt","jump",
			"pick","pull","sing","upon","wish","band","bank","bell","belt","bend","bent","Bess",
			"bled","blot","brag","brat","bred","brig","brim","bump","bunt","bust","camp","cast",
			"clad","clam","clan","clap","clip","clot","club","crab","cram","crib","crop","damp",
			"dent","drag","drip","drop","drug","drum","dump","dust","fact","fell","felt","fill",
			"film","fist","flag","flap","flat","fled","flip","flop","frog","gasp","glad","glum",
			"golf","grab","gram","grim","grin","grip","gulp","gust","held","hint","honk","hung",
			"hunt","junk","kept","lamp","lick","lift","limp","lock","luck","lump","Mack","mask",
			"mass","mast","melt","mend","Mick","milk","mill","mint","mist","neck","nest","pant",
			"pass","past","pest","pill","plan","plop","plot","plug","plum","plus","pomp","pond",
			"prop","punk","raft","rock","romp","Runs","runt","rust","sack","sand","sank","scab",
			"scan","scat","self","sell","send","sent","sick","skid","skim","skin","skip","skit",
			"slam","slap","slat","sled","slim","slip","slob","slot","slug","slum","smog","smug",
			"snag","snap","snip","snub","snug","sock","soft","span","spat","sped","spin","spit",
			"spot","spun","stab","stem","step","stun","suck","sung","swam","swim","tack","tent",
			"test","till","tilt","trap","trim","trip","trot","twig","twin","weld","wind","ball",
			"bang","bill","chin","chip","chop","cuff","dash","deck","dish","fang","fish","Fran",
			"fuss","gift","hall","hang","Hank","huff","Jack","king","kiss","loft","lost","lung",
			"mall","math","mess","pack","path","puff","rash","rest","rich","ring","sang","sash",
			"shed","ship","shop","shut","sink","sits","stub","sunk","tall","tank","thud","tick",
			"toss","vent","vest","wall","whip","wing","wink","yell","says","Beth","Bing","bong",
			"Buck","Burt","Cass","Chad","chug","coal","doll","firm","foam","Gert","gosh","Herb",
			"hill","hush","Jeff","Jill","Josh","kick","Kirk","Nick","Norm","peck","ping","pong",
			"quit","Rick","roam","ruff","Seth","Tess","toad","Todd","turf","wham","York","zing",
			"auto","bald","bark","bath","bead","beam","bean","beat","beef","beet","bird","blur",
			"boat","body","boil","bold","boot","born","bunk","burn","buzz","cart","chat","clay",
			"coat","coax","coil","coin","cool","core","cork","corn","curb","curl","dark","dart",
			"dawn","deep","desk","dirt","duck","dunk","dusk","easy","ever","fail","fawn","feed",
			"feel","fern","flaw","foal","foil","fold","fool","fork","form","fort","fray","free",
			"goat","gold","gray","hail","harm","harp","haul","hawk","heat","heel","hoot","horn",
			"hump","hunk","hurl","inch","itch","Jean","jeep","jerk","Joan","join","kits","knee",
			"knit","knob","knot","lack","lawn","leap","less","link","load","loaf","loop","mail",
			"main","mark","Matt","meat","meet","moan","mold","mood","nail","neat","nips","noon",
			"oink","ooze","pail","pain","park","pawn","peak","peep","pink","ploy","pool","port",
			"rack","rail","rain","rang","rink","road","room","rush","sail","seal","seat","sigh",
			"sips","slur","soak","soap","soil","sore","sort","spur","star","stay","stir","surf",
			"sway","tail","taps","team","thin","toil","told","tool","torn","tray","tusk","ugly",
			"verb","void","wait","weed","week","whiz","wore","worn","wrap","yard","yarn","yawn",
			"Zack","zoom","bait","barn","bawl","beak","blab","blip","bond","boys","brad","bran",
			"card","cash","cask","claw","clod","coop","cord","cost","disk","dock","east","flit",
			"fond","Fred","fret","gang","glee","glen","glob","goal","grit","heal","heap","hoop",
			"husk","jail","laid","leak","lend","lent","lint","loan","loin","loot","lord","loud",
			"lurk","maid","meal","mock","moon","murk","musk","paid","peek","peel","pelt","perk",
			"plod","pork","pray","prim","prod","punt","raid","rant","real","rent","risk","roof",
			"rung","scar","scum","seek","seen","shot","sift","silk","slaw","slay","slid","slit",
			"slop","snob","sour","spud","Stan","sulk","swig","swum","task","tend","tint","tock",
			"toys","tram","trek","trod","Troy","wept","west","whir","wick","wilt","zest","days",
			"boom","copy","else","fizz","kill","leaf","mash","mush","ouch","push","salt","jazz"
		);
		
		public static const L5:Array = new Array
		( 
			"spell","study","still","plant","along","often","until","carry",
			"black","bring","drink","funny","seven","blast","blend","blimp",
			"blink","bliss","block","blond","bluff","blunt","brand","brass",
			"brunt","clamp","clasp","class","cliff","cling","clink",
			"clump","clung","craft","cramp","crisp","crust","draft","drank",
			"dress","drift","drill","fling","flung","flunk","frank","frill",
			"frisk","frost","gland","glass","glint","gramp","grand","grant",
			"grasp","grass","grill","grump","grunt","plank","plump","prank",
			"press","print","scalp","scram","scrap","skill","skunk","slang",
			"slant","slept","sling","slump","smack","smell","snack","sniff",
			"spank","spend","spent","spill","splat","split","spunk","stack",
			"stamp","stand","stiff","sting","stink","stomp","strap","strip",
			"stuck","stump","swang","swell","swift","swing","swung","tramp",
			"trend","trick","trunk","trust","twang","twist","admit","album",
			"blank","clock","crack","crept","cross","index","stuff","stunt",
			"upset","click","cluck","Ellen","stick","Texas","added","attic",
			"brick","buddy","bunny","buses","cabin","camel","candy","daddy",
			"Danny","fifty","habit","happy","jelly","Jimmy","kitty","lemon",
			"limit","model","nanny","penny","puppy","robin","salad","sandy",
			"scrub","silly","slick","stung","sunny","truck","tummy","unzip",
			"visit","wagon","bless","brisk","clack","clang","crick","crock",
			"flick","flock","frizz","gloss","gruff","plums","scuff","skips",
			"skull","smock","snuff","speck","swept","track","given","adult",
			"angry","belly","empty","extra","hurry","nasty","sorry"
		);
		
		public static const L6:Array = new Array
		(
			"number","around","animal","letter","mother","always","Indian","family","better","giving",
			"script","splint","strand","struck","strung","absent","basket","bedbug","branch","catnip",
			"dusted","goblin","hotrod","hunted","invent","lapdog","lasted","mascot","napkin","picnic",
			"pigpen","public","rented","rested","shrimp","shrunk","splash","sunlit","sunset","suntan",
			"tilted","tiptop","zigzag","Blanch","Carmen","crunch","Curtis","dinner","doctor","forgot",
			"insect","market","napper","sister","squirt","sudden","twitch","afraid","artist",
			"attack","awning","bleach","bonnet","bright","cheese","church","clever","clutch","dragon",
			"fabric","finish","flaunt","flight","fluffy","forest","forget","fright","garden","happen",
			"hidden","hungry","kitten","knight","launch","living","mitten","object","poison","rabbit",
			"return","ribbon","runway","scorch","scream","screen","shrink","slight","smooth","snooze",
			"sprain","sprawl","spring","sprint","squawk","strain","stream","street","strict","string",
			"strong","Sunday","swerve","switch","tablet","tennis","thirst","thrill","throat","travel",
			"vanish","wreath","wrench","winter","mitten","grouch","intern","plants","snatch","sneeze",
			"speech","twelve","twenty","during","rather","things","zipper","asleep","August","carpet",
			"corner","crayon","banana","bucket","carrot","finger","nickel","person","pocket","puppet",
			"rocket","seesaw","squeak","sticky","summer","supper","ticket","melted","handed","landed"
		);
		
		public static const L7:Array = new Array
		(
			"America","between","without","banging","bathtub","blasted","blended","bobsled",
			"camping","contest","dentist","disrupt","himself","jumping","lending","pinball",
			"planted","plastic","problem","ringing","shifted","sinking","sunfish","trusted",
			"twisted","nothing","fishing","forever","grinned","perfect","Sanchez","sunburn",
			"swimmer","whisper","applaud","begging","broiler","collect","delight","explore",
			"gumball","harmful","helpful","herself","highway","kneecap","oatmeal","painful",
			"popcorn","pretzel","restful","sandbox","scratch","splotch","stiffer","stretch",
			"teacher","thinner","topcoat","traffic","treetop","trumpet","tugboat","visitor",
			"weekend","wettest","written","present","twitter","against","balloon","bedroom",
			"cartoon","chicken","squeeze","address","blanket","kitchen","monster","morning",
			"pretend","shampoo","unhappy","pumpkin","printed"
		);
		
	}

}