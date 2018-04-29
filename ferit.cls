% LaTeX predložak za pismene radove na
% FERIT
% Verzija: 1.0
%
% Pokriveni radovi su: Seminar, Završni i Diplomski rad
%
% Opcije:
%  - seminar - podesi stil za Seminar (standardna postavka)
%  - diplomski - podesi stil za Diplomski rad
%  - zavrsni - podesi stil za Završni rad
%  - proizvoljni - podesi stil za "proizvoljni" rad (za nestandardne radove)
%  - lmodern - koristi font lmodern (standardna postavka)
%  - times - koristi font times
%  - utf8 - učitaj inputenc paket i opcijom utf8 (standardna postavka)
%  - cp1250 - učitaj inputenc paket i opcijom cp1250
%  - authoryear - stil citiranja ``(author, year)'' (standardna postavka)
%  - numeric - stil citiranja ``[broj]''
%  - english - omogući pisanje radova na engleskom jeziku
% originalni rad: https://github.com/Vedrana/fer-latex-templates/

\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{ferit}

% Predefinirane vrijednosti opcija
\newif\if@fontlmodern     \global\@fontlmoderntrue
\newif\if@fonttimes       \global\@fonttimesfalse
\newif\if@radzavrsni      \global\@radzavrsnifalse
\newif\if@radseminar      \global\@radseminartrue
\newif\if@raddiplomski    \global\@raddiplomskifalse
\newif\if@radproizvoljni  \global\@radproizvoljnifalse
\newif\if@citeauthoryear  \global\@citeauthoryeartrue
\newif\if@citenumeric     \global\@citenumericfalse
\newif\if@encutf          \global\@encutftrue
\newif\if@enccp           \global\@enccpfalse
\newif\if@langeng         \global\@langengfalse

% Postavi font
\DeclareOption{lmodern}{\@fontlmoderntrue%
            \@fonttimesfalse}
\DeclareOption{times}{\@fonttimestrue%
            \@fontlmodernfalse}
            
% Tip rada
\DeclareOption{seminar}{\@radseminartrue%
            \@radzavrsnifalse%
            \@raddiplomskifalse%
            \@radproizvoljnifalse}
\DeclareOption{zavrsni}{\@radseminarfalse%
            \@radzavrsnitrue%
            \@raddiplomskifalse%
            \@radproizvoljnifalse}
\DeclareOption{diplomski}{\@radseminarfalse%
            \@radzavrsnifalse%
            \@raddiplomskitrue%
            \@radproizvoljnifalse}
\DeclareOption{proizvoljni}{\@radseminarfalse%
            \@radzavrsnifalse%
            \@raddiplomskifalse%
            \@radproizvoljnitrue}
            
% Encoding
\DeclareOption{utf8}{\@encutftrue%
           \@enccpfalse}
\DeclareOption{cp1250}{\@encutffalse%
           \@enccptrue}

% Način citiranja
\DeclareOption{authoryear}{\@citeauthoryeartrue%
           \@citenumericfalse}
\DeclareOption{numeric}{\@citeauthoryearfalse%
           \@citenumerictrue}

% Postavi varijable za konstantne stringove u tekstu
% (svrha: omogućavanje prijevoda).
\newcommand{\strdodatak}{Dodatak}
\newcommand{\strsveuciliste}{SVEU\v{C}ILI\v{S}TE U OSIJEKU}
\newcommand{\strferit}{FAKULTET ELEKTROTEHNIKE I RA\v{C}UNARSTVA OSIJEK}
\newcommand{\strzavrsni}{ZAVR\v{S}NI RAD br}
\newcommand{\strdiplomski}{DIPLOMSKI RAD br}
\newcommand{\strseminar}{SEMINAR}
\newcommand{\strvoditelj}{Voditelj}
\newcommand{\strzivotopis}{\v{Z}IVOTOPIS}
\newcommand{\strsijecanj}{sije\v{c}anj}
\newcommand{\strveljaca}{velja\v{c}a}
\newcommand{\strozujak}{o\v{z}ujak}
\newcommand{\strtravanj}{travanj}
\newcommand{\strsvibanj}{svibanj}
\newcommand{\strlipanj}{lipanj}
\newcommand{\strsrpanj}{srpanj}
\newcommand{\strkolovoz}{kolovoz}
\newcommand{\strrujan}{rujan}
\newcommand{\strlistopad}{listopad}
\newcommand{\strstudeni}{studeni}
\newcommand{\strprosinac}{prosinac}

% Koristi engleski jezik
\DeclareOption{english}{%
  \@langengtrue%
  \renewcommand{\strdodatak}{Appendix}%
  \renewcommand{\strsveuciliste}{UNIVERSITY OF OSIJEK}%
  \renewcommand{\strferit}{FACULTY OF ELECTRICAL ENGINEERING AND COMPUTING OSIJEK}%
  \renewcommand{\strzavrsni}{BACHELOR THESIS num}%
  \renewcommand{\strdiplomski}{MASTER THESIS num}%
  \renewcommand{\strseminar}{SEMINAR}%
  \renewcommand{\strzivotopis}{BIOGRAPHY}%
  \renewcommand{\strvoditelj}{Mentor}%
  \renewcommand{\strsijecanj}{January}%
  \renewcommand{\strveljaca}{February}%
  \renewcommand{\strozujak}{March}%
  \renewcommand{\strtravanj}{April}%
  \renewcommand{\strsvibanj}{May}%
  \renewcommand{\strlipanj}{June}%
  \renewcommand{\strsrpanj}{July}%
  \renewcommand{\strkolovoz}{August}%
  \renewcommand{\strrujan}{September}%
  \renewcommand{\strlistopad}{October}%
  \renewcommand{\strstudeni}{November}%
  \renewcommand{\strprosinac}{December}}

\ProcessOptions

\LoadClass[12pt, onecolumn]{report}

\RequirePackage[a4paper, left=2.5cm, right=2cm, bottom=2cm, top=2cm]{geometry}

% Postavljanje encodinga
\if@encutf \RequirePackage[utf8]{inputenc}
\else \if@enccp \RequirePackage[cp1250]{inputenc} \fi
\fi

\if@langeng \RequirePackage[english]{babel}
\else \RequirePackage[croatian]{babel}
\fi
\RequirePackage{graphicx} % Uključeno jer je često korišteno
\RequirePackage{amssymb} % Uključeno jer je često korišteno
\RequirePackage{amsmath} % Uključeno jer je često korišteno
\RequirePackage{fixltx2e}
\RequirePackage{caption}
\RequirePackage{ifthen}
\RequirePackage{url} % Potrebno radi natbiba
\RequirePackage{enumitem} % Potrebno radi izmjene itemize okoline

% Numeriranje literature kod seminara
\if@radseminar%
  \RequirePackage[nottoc, notlof, notlot, numbib, chapter]{tocbibind}
\else
  \RequirePackage[nottoc, notlof, notlot]{tocbibind}
\fi

% Postavljanje fonta
\if@fonttimes\RequirePackage{times} \fi
\if@fontlmodern\RequirePackage{lmodern} \fi
\RequirePackage[T1]{fontenc}

% Postavljanje stila citiranja
\if@citeauthoryear \RequirePackage[authoryear, round]{natbib}
\else \RequirePackage[numbers, square]{natbib}
\fi

% Umjesto poziva \RequirePackage[outsidefoot]{pageno}.
% Neke LaTeX distribucije odbijaju automatski instalirati pageno paket.
% Stoga, dio paketa koji se koristi je kopiran u ovu cls datoteku.
\renewcommand{\ps@plain}{%
   \renewcommand{\@mkboth}{\@gobbletwo}%
   \renewcommand{\@oddhead}{}%
   \renewcommand{\@evenhead}{}%
   \renewcommand{\@evenfoot}{\reset@font\rmfamily\thepage\hfil}%
   \renewcommand{\@oddfoot}{\reset@font\rmfamily\hfil\thepage}}
\pagestyle{plain}

\renewcommand{\captionlabelfont}{\bfseries}
\renewcommand{\captionfont}{\small}

% 1.5 prored, 1.3 je faktor za množenje
\linespread{1.3}

% Promjena naziva poglavlja ``Bibliografija'' -> ``Literatura''
\addto\captionscroatian{%
  \def\bibname{\large LITERATURA}
}

% Primjena naziva listing (programski kod)
\addto\captionscroatian{%
  \def\lstlistingname{Programski kod}
}

% Podešavanje oznaka kod listi (1. razina je crtica, 2. puni krug) 
\renewcommand{\labelitemi}{\textendash}
\renewcommand{\labelitemii}{\textbullet}

% http://www.tex.ac.uk/cgi-bin/texfaq2html?label=seccntfmt
% dodaje tocku nakon section broja ali ne i nakon chapter!
% za chapter se koristi jednostavno http://theoval.cmp.uea.ac.uk/~nlct/latex/thesis/node10.html
\renewcommand*{\@seccntformat}[1]{%
  \csname the#1\endcsname.\quad
}

% http://stackoverflow.com/questions/2426963/modifying-latex-table-of-contents-to-add-a-period-after-chapter-table-figure-numb
% Dodaje u toc tocke
\let \savenumberline \numberline
\def \numberline#1{\savenumberline{#1.}}

\renewcommand\theequation{\ifnum \c@chapter>\z@ \thechapter.\fi \@arabic\c@equation}
\renewcommand\thefigure{\ifnum \c@chapter>\z@ \thechapter.\fi \@arabic\c@figure}
\renewcommand\thetable{\ifnum \c@chapter>\z@ \thechapter.\fi \@arabic\c@table}

% Iskljuci numeriranje stranica van poglavlja
\renewcommand{\thepage}{}

\if@radseminar\else%
% Ispis napomene o umetanju izvornika.
\newcommand{\izvornik}{%
  \newpage
  \thispagestyle{empty}
  \vspace*{\fill}
  \hfil \textsl{Umjesto ove stranice umetnite izvornik Va\v{s}eg rada.} \par \hfil
  \hfil \textsl{Kako biste uklonili ovu stranicu, obri\v{s}ite naredbu \texttt{\textbackslash izvornik}.} \hfil
  \vspace*{\fill}
}
\fi

% Dodana zahvala
\newif\if@dodanazahvala    \global\@dodanazahvalafalse
\if@radseminar\else%
% Naredba za dodavanje zahvale.
\newcommand{\zahvala}[1]{%
  \newpage
  \setcounter{page}{3}
  \vspace*{\fill}
  \hfil {\itshape #1}\hfil
  \vspace*{\fill}
  \@dodanazahvalatrue
}
\fi

% TOC
\renewcommand\tableofcontents{%
   \if@dodanazahvala\else \setcounter{page}{4} \fi
   \if@radseminar \setcounter{page}{2} \fi
   \chapter*{\contentsname
   \@mkboth{%
   \MakeUppercase\contentsname}{\MakeUppercase\contentsname}}%
   \@starttoc{toc}%
}

% Podešavanje dodatka
\newboolean{atappendix}
\setboolean{atappendix}{false}
\newboolean{secondpart}
\setboolean{secondpart}{false}

\renewcommand{\appendix}{
  \setboolean{atappendix}{true}
  \setcounter{chapter}{0}
  \renewcommand{\thechapter}{\Alph{chapter}}
}

% Margine kod naslova
\renewcommand{\@makechapterhead}[1]{%
\ifthenelse{\boolean{atappendix}}{%
  \vspace*{0\p@}%
  {\setlength{\parskip}{0em} \parindent \z@ \raggedright \normalfont
    \interlinepenalty\@M
    \ifnum \c@secnumdepth >\m@ne
      \large\bfseries \strdodatak\ \thechapter \\ #1
      \par\nobreak
    \fi
    \nobreak
    \vskip 12\p@
  }
}
{
  \ifthenelse{\boolean{secondpart}}
  {
  }
  {
    \setcounter{page}{1}
    \renewcommand{\thepage}{\arabic{page}}
    \setboolean{secondpart}{true}
  }

  \vspace*{0\p@}%
  {\setlength{\parskip}{0em} \parindent \z@ \raggedright \normalfont
    \interlinepenalty\@M
    \ifnum \c@secnumdepth >\m@ne
      \large\bfseries \thechapter.~#1
      \par\nobreak
    \fi
    \nobreak
    \vskip 12\p@
  }
}
}

\renewcommand{\@makeschapterhead}[1]{%
\ifthenelse{\boolean{atappendix}}{%
  \vspace*{0\p@}%
  {\setlength{\parskip}{0em} \parindent \z@ \raggedright
    \normalfont
    \interlinepenalty\@Mdef
    \Bold\large \strdodatak\ \\ #1\par
    \nobreak
    \vskip 15\p@
  }
}
% Stranice van poglavlja (npr. sazetak, zakljucak)
{%
  \vspace*{0\p@}%
  {\setlength{\parskip}{0em} \parindent \z@ \raggedright
    \normalfont
    \interlinepenalty\@M
    \Huge \textbf{#1}\par
    \nobreak
    \vskip 15\p@
  }
}
}

% Dodavanje naredbe \voditelj za tip rada seminar
\if@radseminar
  \def\voditelj#1{\gdef\@voditelj{#1}}
  \def\@voditelj{\@latex@warning@no@line{Voditelj nije naveden.
  Koristi \noexpand\voditelj za definiranje}}
\fi
  
% Dodavanje naredbe \tiprada za proizvoljni tip rada.
% Primjer korištenja: \tiprada{Diplomski projekt}
\if@radproizvoljni
  \def\tiprada#1{\gdef\@tiprada{#1}}
  \def\@tiprada{\@latex@warning@no@line{Tip rada nije definiran.
  Koristi \noexpand\tiprada za definiranje}}
\fi
  
% Ako je tip rada diplomski ili zavrsni, dodaj naredbu
% \thesisnumber za definiranje broja rada.
\if@radseminar\else\if@radproizvoljni\else
  \def\thesisnumber#1{\gdef\@thesisnumber{#1}}
  \def\@thesisnumber{\@latex@warning@no@line{Broj rada nije definiran.
  Koristi \noexpand\thesisnumber za definiranje}}
\fi\fi

% Definiranje naslovne stranice.
\if@titlepage
  \renewcommand{\maketitle}{%
    % Postavi margine na veličine za naslovnu stranicu
    \addtolength{\voffset}{0.5cm}%
    \addtolength{\hoffset}{-0.25cm}%
    \addtolength{\marginparwidth}{0.5cm}%
    \addtolength{\textwidth}{-1cm}%
    \addtolength{\textheight}{-1cm}%
    \begin{titlepage}%
      % Koristi Helvetica font na naslovnoj stranici
      % (zamjena za Arial koji nije dostupan na svim platformama).
      \fontfamily{phv}\selectfont% 
      \let\footnotesize\small
      \let\footnoterule\relax
    
      \begin{center}
        {\large \strsveuciliste}
        
        {\large\bfseries \strferit}
      \end{center}
      \vfill
      \begin{center}
        \if@radseminar \vskip 3em
        \else \vskip 1em
        \fi
        {\huge \bfseries \@title \par}
        \vskip 1em
        {\large\lineskip .75em
        \begin{tabular}[t]{c}
              \if@radseminar
                {\itshape \@author} \\
                \strvoditelj{}: {\itshape \@voditelj}
              \else
              \@author
          \fi
        \end{tabular}\par}
      \end{center}\par
      \vfill
      \begin{center}
        {\large Osijek, 
        \ifcase\month\or
          \strsijecanj\or \strveljaca\or \strozujak\or \strtravanj\or
          \strsvibanj\or \strlipanj\or \strsrpanj\or \strkolovoz\or
          \strrujan\or \strlistopad\or \strstudeni\or
          \strprosinac\fi \space \number\year\if@langeng\else.\fi%
        }
      \end{center}
    \end{titlepage}%
    % Vrati sf typeface na pravu vrijednost
    \if@fonttimes\renewcommand{\sfdefault}{ptm}\fi%
    \if@fontlmodern\renewcommand{\sfdefault}{lmr}\fi
    % Vrati margine na postavke za ostale stranice
    \addtolength{\voffset}{-0.5cm}%
    \addtolength{\hoffset}{0.25cm}%
    \addtolength{\marginparwidth}{-0.5cm}%
    \addtolength{\textwidth}{1cm}%
    \addtolength{\textheight}{1cm}%
    \setcounter{footnote}{0}%
    \global\let\maketitle\relax
    \global\let\@date\@empty
    \global\let\date\relax
    \global\let\and\relax
  }
\fi

\newdimen\listindentation
\setlength{\listindentation}{3 em}

% Podešavanje izemize okoline
% Zahtjeva enumitem paket
\renewenvironment{itemize}%
{
  \setlength{\parskip}{0em}
  \advance\@itemdepth\@ne
  \edef\@itemitem{labelitem\romannumeral\@itemdepth}%

  \begin{list}{\csname\@itemitem\endcsname}{\setlength{\leftmargin}{\listindentation}\setlength{\itemsep}{0 em}\setlength{\topsep}{0 em}}
}%
{\end{list}}

% Naredba \engl
\newcommand{\engl}[1]{(engl.~\emph{#1})}

% Sažetak na hrvatskom
\if@langeng
\long\def\hrtitle#1{\gdef\@hrtitle{#1}}
\def\@hrtitle{\@latex@warning@no@line{Hrvatski naziv rada nije definiran.
Koristi \noexpand\hrtitle za definiranje}}
\fi
\newenvironment{sazetak}
{
% Ako je rad na engleskom, nemoj preći na novu stranicu
\if@langeng\else\newpage\fi
\vspace*{\fill}
\thispagestyle{empty}
\begin{center}
  {\bf \if@langeng\@hrtitle\else\@title\fi}
\end{center}
\hspace*{\fill} {\bf Sa\v{z}etak} \hspace*{\fill} \par
\vspace*{25pt}
}
{
\vspace*{\fill}
}

% Ključne riječi na hrvatskom
\newcommand{\kljucnerijeci}[1]
{
\vspace{15pt}
\noindent \textbf{Klju\v{c}ne rije\v{c}i:} #1
}

% Ključne riječi na engleskom
\newcommand{\keywords}[1]
{
\vspace{15pt}
\noindent \textbf{Keywords:} #1
}

% Sažetak na engleskom
\if@langeng \else
\long\def\engtitle#1{\gdef\@engtitle{#1}}
\def\@engtitle{\@latex@warning@no@line{Engleski naziv rada nije definiran.
Koristi \noexpand\engtitle za definiranje}}
\fi
\renewenvironment{abstract}
{
\if@langeng\newpage\fi
\vspace*{\fill}
\thispagestyle{empty}
\begin{center}
  {\bf \if@langeng\@title\else\@engtitle\fi}
\end{center}
\hspace*{\fill} {\bf Abstract} \hspace*{\fill} \par
\vspace*{25pt}
}
{
\vspace*{\fill}
}

\newenvironment{biografija} {
\newpage
    {
        \noindent\large\bf \strzivotopis\
        \vskip 12\p@
    }
\thispagestyle{empty}
}
{
\vspace*{\fill}
}

\endinput
