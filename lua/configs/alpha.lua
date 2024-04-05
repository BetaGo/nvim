local alpha = require("alpha")
local dashboard = require("alpha.themes.dashboard")

local header_car_a = {
    "⠀⠀⠀⠋⠙⠛⠋⠉⠑⠾⠿⡆⠈⠛⠋⠈⠟⠉⠁⠈⠛⠛⠋⠉⠙⢿⠁⠉⠉⠽⢿⠛⠉⠉⠉⠛⠙⣿⡿⠋⡡⠄⠀⠀⠀⠀⠀⠀⠀⠠",
    "⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢇⠀⠀⠀⠀⠀⠀⠀⠿⢆⠀⠘⢁⡞⢡⠀⠀⠀⢀⡄⠀⠀⠀⠀",
    "⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠁⢄⠀⠀⠀⠐⣦⣄⡀⠀⠀⢺⠁⡾⠀⡰⠀⠊⠁⠀⠀⠀⠀",
    "⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢻⡿⠛⠀⠀⢸⢀⠉⠴⠠⢖⣤⠀⠀⠀⠀⠀",
    "⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠃⠀⠀⠀⠸⢈⠀⡀⠀⠈⠉⠓⠀⠀⠀⠀",
    "⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠘⠇⡀⠀⠀⠀⠀⠀⠀⠀⠀",
    "⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠘⣿⠀⠀⠀⠀⠀⠀⠀⠀",
    "⠀⠀⠀⠀⠀⠀⣀⣀⣤⣤⣴⣦⣦⣀⣀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠰⠋⠀⠀⠀⠀⠀⠀⠀⠀",
    "⠀⠀⠀⣠⣾⡿⠛⠛⡉⣉⣉⡀⠀⢤⡉⢳⣄⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢀",
    "⣀⣤⣾⡿⢋⣴⣖⡟⠛⢻⣿⣿⣽⣆⠙⢦⡙⣧⡀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢀⣠⠖⠒⠻⠻⠶⣦⣄⠀",
    "⠉⣿⢸⠁⣸⣥⣹⠧⡠⣾⣿⣿⣿⣿⣧⡈⢷⣼⣧⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⣠⣿⣾⣿⣿⣶⣦⣈⠈⠻⣤",
    "⠀⢹⡇⢸⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⠀⣿⣇⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢸⡟⣫⠀⠙⣿⣿⣿⣿⣷⡄⣽",
    "⠀⠀⠳⣾⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣟⣀⣿⣟⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠸⣷⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿",
    "⠀⠀⠀⠈⠙⠻⢿⣿⣿⣿⣿⣿⣿⣿⣿⠭⠛⠉⠉⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠸⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿",
    "⠀⠀⠀⣼⠉⠓⢦⠀⠀⠉⠩⠉⠉⠁⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⡠⠒⡊⠙⠉⠉⠉⠓⠲⠤⡀⠀⠀⠙⠿⣿⣿⣿⣿⣿⣿⣿⠏",
    "⠀⠀⠀⠈⢦⡀⠈⡇⠀⠀⡠⠒⠛⢲⣄⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠐⠿⣦⣴⣿⣶⣶⠀⠠⠀⣰⣤⣿⣦⠀⠀⠀⠀⠉⠙⠛⠻⠛⠁⠀",
    "⠀⠀⠀⠀⠀⡇⠀⢧⡴⠋⠀⣀⡀⢰⡟⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠙⢛⠃⢀⣄⠀⣿⡿⠟⠉⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢀",
    "⠀⠀⠀⠀⠀⡇⠀⠉⠀⣰⠋⢱⠃⢸⡁⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠊⠟⠋⠈⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⣠⠖⠋⠉",
    "⠀⠀⠀⠀⠀⢇⠀⣰⡿⠋⠀⠘⢦⠼⠁⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢼⠋⠁⣀⡤⠎",
    "⠀⠀⠀⠀⠀⠈⠋⠁⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠌⠀⢀⡄⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠉⠉⠁⠀⠀",
    "⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢦⣄⡀⠀⠀⢀⣀⣠⣴⡿⣿⣦⣀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀",
    "⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠙⠛⠻⠿⠉⠉⠉⠉⠉⠑⠋⠙⠻⣦⣄⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀",
    "⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠈⠙⢳⡀⠀⠀⠀⠀⠀⠀⠀⠀⠀",
    "⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠃⠀⠀⠀⠀⠀⠀⠀⠀⠀",
    "⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀",
}

-- cpoy form http://uguu.org/sources.html
local header_maple = {
    "                             $p=",
    '                           "Z',
    "                          Cc",
    "                           !",
    "                          FTAb!TBBBb!C",
    "                   NIAa!ALMl!GICbncgb!JDzk!BIze",
    "              dgb!Icsdua!Gznl!Ebxengd!DaBlhfzBa!BAb",
    "           CaAcrAfqCd!BafBbAbDdBdBbAiebCi!AheAeiCnAdgf!",
    "         AlBgAeDmBabjd!ibAaAAfAeFiECck!kAbAeAaBaAfBbcdbBd",
    "       n!baiAbBbHcDcgaAcp!AhbBcBaEBfChrd!AcgBcJfDeqdc!AaBgB",
    "     AaLcFrhb!CAgPEDcubb!DgKKBteac!DAfGedHsgb!EgFiGbbvb!EAgEB",
    "    c  cHencdAa!GfAbJGbx!HdCeAGDdoAf!IcDaAaBcdDqBcAa!JcDaMf  E",
    [[   aA   c Da!KbNCe!XBABd!";$q=" FKIGHo!GENJimc!UEFteaf!   NGED]],
    "  yaj!DAh  MA zo    !Baa  JbIo  ks !AaNaFzv!aACDBcC   aDsgfs!aJ",
    " dCaBhrnla!aJd Dzkod!aHKAhrij   gc!aCaCaNgodza !AaCcNCnlz!BaBXzp",
    " g!CbJPCzbigE  c!EbRHB ueuCa    !GcMMAdvpFa!J  bGSuehiCa!FDBbZec",
    "iir!McCViqo !  MdETnl l!NcA      bAOdaCmme        aCa!BMbAAAbaEI",
    "bCbCyFBa!Pa DC ajIaH d  m HBa!CM  aKaPaHDaDdC  aIa!QaJcOaKdIaHa!L",
    "EaCGAaBfGbLa CI  aG        a!K    DCaJaIeCaCH aALbDa!RaBHaLFaJaPc",
    [[ !SaIaNCBaI  a!A  S       bDBaAM   EBcDb!UcCbVBcb!Xd!";\$r='$b=q="]],
    [[=;$c=q{$d=  qq{          \44p=$    b$p$b;\44q=$b$q$b;\44r=\47$r\]],
    [[ 4  7;eval(   \            44r      );};$d=~s/\s//gs;$p=~s/\s//g]],
    [[    s;$i=0;                         print(map{($l=$_%32)&&$_>92?]],
    [[    substr(                        $d,($i+=$l)-$l,$l):chr($_>63?]],
    [[    32:10)       x$l}unpac        k(q{C*},$p));};$c=~s/\s//gs;]],
    [[    eval$c;      $b=";eval       (%w{d=%{\44p=\42#{$p}\42;\44]],
    [[     q=\42#{       $q}\42        ;\44r=\47#{$r}\47;eval(\44 r]],
    [[      );}.gs ub                 (/\s/,%{});i=0;$q.gsub(/\s]],
    [[       /,%{   }).ea            ch_byte{|b|l=b%32;p rint(b]],
    [[        >95    ? d  [(i+=l)    -l,l]:(b>63?32:10  ).c h]],
    [[         r*l    )             }}*%{}     ) ;#"    ;]],
    "           ';                 eval(",
    "                             $r);",
}

local header_periodic_table = {
    " __________________________________________________________________________ ",
    "|   1   2   3   4   5   6   7   8   9   10  11  12  13  14  15  16  17  18 |",
    "|                                                                          |",
    "|1  H                                                                   He |",
    "|                                                                          |",
    "|2  Li  Be                                          B   C   N   O   F   Ne |",
    "|                                                                          |",
    "|3  Na  Mg                                          Al  Si  P   S   Cl  Ar |",
    "|                                                                          |",
    "|4  K   Ca  Sc  Ti  V   Cr  Mn  Fe  Co  Ni  Cu  Zn  Ga  Ge  As  Se  Br  Kr |",
    "|                                                                          |",
    "|5  Rb  Sr  Y   Zr  Nb  Mo  Tc  Ru  Rh  Pd  Ag  Cd  In  Sn  Sb  Te  I   Xe |",
    "|                                                                          |",
    "|6  Cs  Ba  *   Hf  Ta  W   Re  Os  Ir  Pt  Au  Hg  Tl  Pb  Bi  Po  At  Rn |",
    "|                                                                          |",
    "|7  Fr  Ra  **  Rf  Db  Sg  Bh  Hs  Mt  Ds  Rg  Cn  Nh  Fl  Mc  Lv  Ts  Og |",
    "|__________________________________________________________________________|",
    "|                                                                          |",
    "|                                                                          |",
    "| Lantanoidi*   La  Ce  Pr  Nd  Pm  Sm  Eu  Gd  Tb  Dy  Ho  Er  Tm  Yb  Lu |",
    "|                                                                          |",
    "|  Aktinoidi**  Ac  Th  Pa  U   Np  Pu  Am  Cm  Bk  Cf  Es  Fm  Md  No  Lr |",
    "|__________________________________________________________________________|",
}

local header_panda = {
    "                                                                                  ",
    "                                                                                  ",
    "                      *((##*                                                      ",
    "                  /###%%#%&&&%,                           .%((//(/.              ",
    "                  #%%&&&&@@@@@@@*                        #%#&%@&%%##%%            ",
    "                 &&&@@@@@@@@@@@@@   .**(/(,*,/,*,       &@@@@@@@@@&&%%%*          ",
    "                 @@@@@@@@@@&@*                         %@@@@@@@@@@@@&&&&          ",
    "                  @@@@%/,               ,                 /@&%@@@@@@@&&&*         ",
    "                   &@,                 .                      /%@@@@@@@&.         ",
    "                .(..                  ,                         *#@@@@@#          ",
    "              .(                                                 .@@@@*           ",
    "              #                                                    (              ",
    "             ,             *%@%             .@@@@&*                 ,             ",
    "          *            /@@@@@@&            @@@@@@@@&                .*           ",
    "          ,            @@@@@@@@,   ...  .   .@@@@@@@@@                 /          ",
    "          /           @@@@@@/                  *&@@@@@&                           ",
    "         /           ,@&@@@.    %@@@@@@@@@,     .#@@@&&                 ,         ",
    "         #            (%%%/    *@@@@@@@@@%*      *&%#(*                 /         ",
    "         *        .     .           /                   , .,.                     ",
    "          .                /                     *                      *         ",
    "          *                #.    ./%,%/.      ,%                       /..        ",
    "          .,                                                        ,,*  *        ",
    "            %*                                 (%%#%%(,          *&*..    ,       ",
    "           ,/**#@%,**         ........ ...    #&&&@&&&%%%&(,#@@@@@&##%(%%#,,.     ",
    "          .%@@@@@@@@@@@@@@@@@@@@@@@&@@@@@@@@@(@@@@@@&&@@%&%%&&&#@@@@@@@@&&&%(,    ",
    "          (%@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@.@@@@@@@@@@@@@@@&&%&@%&@@@@@@@@@%#,   ",
    "        *&@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@/@@@@@@@@@@@@@@@@@@@@&%&&*&@@@@@@&&#.  ",
    "        &@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@/@@@@@@@@@@@@@@@@@@@@@&@@@&&(@@@@@@&%* ",
    "      .#@@@@@@@@@@@@@@@@@@@@@@@@@@@&@@@%@@@(@@@@@@@@@@@@@@@@@@@@@@@@@&@@@@##@@@@#.",
    "      /@@@@@@@@@@@%%&%@&##%&#%/(@(&#%%###%&%@/@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@&/",
    "     @@@@@@@@@@%((/((**,.,,,,*,,.,*.*.,*,,,,.. @@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@/",
    "    .@@@@@@@@@/.*   .                           @@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@(",
}

-- Set header
dashboard.section.header.val = header_maple
-- Set menu
dashboard.section.buttons.val = {
    dashboard.button("n", " > Obsidian",
        ":cd " .. require("user-conf").obsidian_valut_path .. ' | Telescope find_files<CR>'),
    dashboard.button("r", " > Recent", ":Telescope oldfiles<CR>"),
    dashboard.button("p", " > Projects", ":Telescope projects<CR>"),
    dashboard.button("s", " > Settings", ":e $MYVIMRC | :cd %:p:h | split . | wincmd k | pwd<CR>"),
    dashboard.button("q", "󰩈 > Quit NVIM", ":qa<CR>"),
}

-- Send config to alpha
alpha.setup(dashboard.config)

-- Disable folding on alpha buffer
vim.cmd([[
    autocmd FileType alpha setlocal nofoldenable
]])
