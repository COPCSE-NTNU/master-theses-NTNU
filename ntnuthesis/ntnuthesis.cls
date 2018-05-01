%% 'ntnuthesis.cls' - a LaTeX class for master's theses at ntnu
%%
%% Copyright (C) 2005 Ivar Farup and Kjetil Orbekk
%%
%% CHANGE LOG:
%%
%% v0.1 2005/03/09:
%%
%%  * First pre-alpha draft
%%
%% v0.2 2005/03/10:
%%
%%  * Reduced size of heading to 7pt
%%
%%  * Reimplemented the heading without using fancyhdr, making the
%%    package (more) compatible with hyperref.
%%
%%  * Introduced \thesisdate for upper right header
%%
%% v0.3 2005/03/11:
%%
%%  * \chapter{} and \chapter*{} heading can cover several lines
%%
%% v0.4 2005/04/19:
%%
%%  * new itemize and enumerate environments
%%
%%  * twoside, adjusted headers and margins; header and footers are
%%    not shown on pages that are empty due to new chapters
%%
%%  * \thesistitlepage: dummy title page using new commands
%%    \thesisauthor, \thesisdate, and \thesistitle
%%
%%  * no centering of sections
%%
%%  * \subsubsection and \paragraph now produce an error message
%%
%% v0.5 2005/05/10:
%%
%%  * \subsubsection and \paragraph reintroduced
%%
%%  * \parskip and \parindent changed
%%
%% v0.6 2005/05/13:
%%
%%  * \chapter no longer in capitals
%%
%% v0.7 2007/05/30:
%%
%%  * Added frontpage matter implemented by Kjetil Orbekk
%%
%%  * Fixed compatibility problem with hyperref using \phantomsection
%%    as suggested by Halvor Borgen
%%
%% v0.8 2008/05/20
%%
%%  * Options oneside and twoside added by Rune Hammersland
%%
%% v0.9 2010/04/20
%%  * Warning about page numbers (pdflatex) fixed by defining 
%%     the title page format
%%  * Added a spill programmering option
%%
%% v1.0 2011/01/18
%%  * Added infosek-bachelor, ingeniør
%%
%% v1.01 2011/05/10
%%  * fixed front cover for both oneside and twoside
%%
%% v1.1 2012/05/22
%%  * Added CIMET page
%%
%%
%% v1.2 2014/05/10
%%  Fixed Summary page
%%  And last warning about page numbering.
%%
%% v1.2.1 2014/06/05
%%  Adding MTDMT
%%
%% v2 2016/31/03
%%  Changing to NTNU
%%
%% TODO:
%%
%%

%% MACRO
\newcommand{\NTNU}{{N}orwegian {U}niversity of {S}cience and {T}echnology} %the extra {'s protect upper case
\newcommand{\NTNUno}{{N}orges teknisk-naturvitenskapelige universitet}
\newcommand{\NTNUgjovik}{{NTNU} i {G}j\o{}vik}
\newcommand{\NTNUalesund}{{NTNU} i \AA{}lesund}



%% IDENTIFICATION

\xdef\ntnuthesisdate{2017/01/22}
\xdef\ntnuthesisversion{2.1}
\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{ntnuthesis/ntnuthesis}
  [\ntnuthesisdate\space
   v\ntnuthesisversion\space
   Creative Commons Attribution 2016 Simon McCallum]

%% CLASS FILE COMMANDS

\LoadClassWithOptions{report} 





%% PACKAGE LOADING

\RequirePackage{geometry}
\RequirePackage[T1]{fontenc}
\RequirePackage{charter}
%\RequirePackage{euler}
\RequirePackage{lastpage}
\RequirePackage{babel}
\RequirePackage{enumitem}
\RequirePackage{listings}
\setlist[enumerate]{itemsep=0mm, topsep=5pt, partopsep=0mm, parsep=0mm}
\setlist[enumerate,1]{label=\arabic*., ref=\arabic*}
\setlist[enumerate,2]{label=\arabic*., ref=\arabic*}
\setlist[enumerate,3]{label=\alph*., ref=\alph*}
\setlist[itemize]{itemsep=0mm, topsep=5pt, partopsep=0mm, parsep=0mm}
\setlist[itemize,1]{label=$\bullet$}
\setlist[itemize,2]{label=$\circ$}
\setlist[itemize,3]{label=$\cdot$}
%\RequirePackage[absolute]{textpos}



%% MAIN PART

% Page geometry and layout
%\setlength{\TPHorizModule}{30mm}
%\setlength{\TPVertModule}{\TPHorizModule}
%\textblockorigin{10mm}{10mm}


\AtBeginDocument{\baselineskip=14pt%
  \parskip=0pt%
  \parindent=14pt%
  \frenchspacing%
  \setcounter{secnumdepth}{2}%
}

\pagenumbering{roman}           % until first chapter, see below

% Header and footer

\def\thesis@title{Use thesistitle to insert your title here.}
\def\thesis@shorttitle{Use thesisshorttitle to insert your short title here.}
\def\thesis@date{Use thesisdate to insert your date here.}
\def\thesis@author{Use thesisauthor to insert your name here.}
\def\thesis@hostInstitution{Use thesisHostInstitution to insert the location of the defense.}
\def\thesis@campus{Gjovik by default}
\def\thesis@publishertext{}

% for theses with multiple authors
%\def\thesis@authorA{}
%\def\thesis@authorB{}
%\def\thesis@authorC{}
\def\thesis@supervisor{}
%\def\thesis@supervisorA{}

\newif\if@supervisorA    \@supervisorAfalse
\def\setthesissupervisorA#1{\gdef\@supervisorA{#1} \@supervisorAtrue }

\newif\if@supervisorB    \@supervisorBfalse
\def\setthesissupervisorB#1{\gdef\@supervisorB{#1} \@supervisorBtrue }

%\def\thesis@supervisorB{}

%for the french thesis with know jury
\def\thesis@juryA{}
\def\thesis@juryB{}
\def\thesis@juryC{}
\def\thesis@juryD{}


\def\nmt@keywords{}
\def\nmt@desc{}
\def\nmt@pub{}

\def\thesis@titleNOR{Use thesistitleNor to insert your Norwegian title here.}
\def\nmt@keywordsNOR{}
\def\nmt@descNOR{}
\def\nmt@pubNOR{}

\def\nmt@number{}
\def\nmt@contact{}
\def\nmt@appnumber{}
\def\nmt@pagecount{}

\def\setthesistitle#1{\def\thesis@title{#1}\def\thesis@shorttitle{#1}}
\def\setthesisshorttitle#1{\def\thesis@shorttitle{#1}}
\def\setthesisdate#1{\def\thesis@date{#1}}
%\def\setthesisyear#1{\def\thesis@year{#1}}


\def\setthesisauthor#1{\def\thesis@author{#1}}
\def\setthesisauthorA#1{\def\thesis@authorA{#1}}
\def\setthesisauthorB#1{\def\thesis@authorB{#1}}
\def\setthesisauthorC#1{\def\thesis@authorC{#1}}
\def\setthesissupervisor#1{\def\thesis@supervisor{#1}}
%\def\setthesissupervisorA#1{\def\thesis@supervisorA{#1}}
%\def\setthesissupervisorB#1{\def\thesis@supervisorB{#1}}
\def\setnmtoppdragsgiver#1{\def\thesis@oppdragsgiver{#1}}

\def\setthesisHostInstitution#1{\def\thesis@hostInstitution{#1}}
\def\setthesisPublisherText#1{\def\thesis@publishertext{#1}}
\def\setthesisjuryA#1{\def\thesis@juryA{#1}}
\def\setthesisjuryB#1{\def\thesis@juryB{#1}}
\def\setthesisjuryC#1{\def\thesis@juryC{#1}}
\def\setthesisjuryD#1{\def\thesis@juryD{#1}}

\def\thesistitle{\thesis@title}
\def\thesisdate{\thesis@date}
\def\thesisyear{\thesis@year}
\def\thesisauthor{\thesis@author}
\def\thesissupervisor{\thesis@supervisor}
%\def\thesissupervisorA{\thesis@supervisorA}
%\def\thesissupervisorB{\thesis@supervisorB}





\def\nmtkeywords#1{\def\nmt@keywords{#1}}
\def\nmtdesc#1{\def\nmt@desc{#1}}
\def\nmtpub#1{\def\nmt@pub{#1}}

\def\nmtkeywordsNOR#1{\def\nmt@keywordsNOR{#1}}
\def\nmtdescNOR#1{\def\nmt@descNOR{#1}}
\def\nmtpubNOR#1{\def\nmt@pubNOR{#1}}
\def\setthesistitleNOR#1{\def\thesis@titleNOR{#1}}


\def\nmtnumber#1{\def\nmt@number{#1}}
\def\nmtbachelornumber#1{\def\nmt@number{#1}}
\def\nmtcontact#1{\def\nmt@contact{#1}}
\def\nmtappnumber#1{\def\nmt@appnumber{#1}}
\def\nmtpagecount#1{\def\nmt@pagecount{#1}}

\def\ps@ntnuheadings{%
  \def\@oddfoot{\reset@font\hfil\thepage\hfil}
  \def\@oddhead{\underline{\hbox
      to\hsize{\fontsize{7}{9}\selectfont\hfil\thesis@shorttitle}}}
  \def\@evenhead{\underline{\hbox
      to\hsize{\fontsize{7}{9}\selectfont\thesis@shorttitle\hfil}}}
  \let\@evenfoot=\@oddfoot}
\pagestyle{ntnuheadings}
% Empty page does not have header or footer
\def\cleardoublepage{\clearpage\if@twoside \ifodd\c@page\else
    \hbox{}\thispagestyle{empty}\newpage\if@twocolumn\hbox{}\newpage\fi\fi\fi}

\newif\if@masters
\newif\if@DAIM
\newif\if@CIMET
\newif\if@MTDMT
\newif\if@Bpaper



% Title page

%%\def\@subtitle{\relax}
%%\newcommand{\subtitle}[1]{\gdef\@subtitle{#1}}
%%\renewcommand{\maketitle}{
%%	\newpage
%%	\null
%%	\vskip 2em%
%%	\begin{center}%
%%	\let \footnote \thanks
%%	{\LARGE \@title \par}%
%%	\vskip 1.5em%
%%	{\large
%%		\lineskip .5em%
%%		\begin{tabular}[t]{c}%
%%		\@author
%%		\end{tabular}\par}%
%%	\vskip 1em%
%%	{\large \@date}%
%%	\end{center}%
%%	\par
%%	\vskip 1.5em
%%}



\def\thesistitlepage{
  \title{\thesis@title}
  \date{\thesis@date}
  \author{\thesis@author}
  \maketitle
}

% Sectioning commands

\def\section{\@startsection
  {section}%
  {1}%
  {0mm}%
  {-10pt}%
  {4pt}%
  {\normalfont\fontsize{12}{14}\selectfont\bfseries}%
}
   
\def\subsection{\@startsection
  {subsection}%
  {2}%
  {0mm}%
  {-6pt}%
  {2pt}%
  {\normalfont\fontsize{10.5}{14}\selectfont\bfseries}%
}

\def\subsubsection{\@startsection
  {subsubsection}%
  {3}%
  {0mm}%
  {-6pt}%
  {2pt}%
  {\normalfont\normalsize\selectfont\bfseries}%
}

\def\paragraph{\@startsection
  {paragraph}%
  {4}%
  {0mm}%
  {-6pt}%
  {2pt}%
  {\normalfont\normalsize\selectfont\itshape}%
}

\newcounter{firstchapter}       % hack to find out where to start
\c@firstchapter=1               % arabic page numbering, see below

\newcounter{tmpfig}             % hack to have continuous numbering of
\newcounter{tmptab}             % figures and tables, see below

\newcounter{numapp}
\newcommand{\numberofapp}{%
    \immediate\write\@auxout%
      {\string\setcounter{numapp}{\the\c@chapter}}%
}



\renewcommand\chapter{%\if@openright\cleardoublepage\else\clearpage\fi
  \cleardoublepage
%  \thispagestyle{plain}%
  \global\@topnum\z@
  \@afterindentfalse
  \secdef\@chapter\@schapter}
\def\@chapter[#1]#2{\ifnum \c@secnumdepth >\m@ne
  \c@tmpfig=\c@figure           % hack for figure and table numbering
  \c@tmptab=\c@table
  \refstepcounter{chapter}%
  \c@figure=\c@tmpfig
  \c@table=\c@tmptab
  \ifnum\c@firstchapter = 1     % hack for page numbering
  \pagenumbering{arabic}
  \c@page=1 \c@firstchapter=0
  \fi
  \typeout{\@chapapp\space\thechapter.}%
  \phantomsection
  \addcontentsline{toc}{chapter}%
  {\protect\numberline{\thechapter}#1}%
  \else
  \phantomsection
  \addcontentsline{toc}{chapter}{#1}%
  \fi
  \chaptermark{#1}%
% Add extra space in list of figures and list of tables between
% figures & tables belonging to different chapters:
%  \addtocontents{lof}{\protect\addvspace{10\p@}}%
%  \addtocontents{lot}{\protect\addvspace{10\p@}}%
  \if@twocolumn
  \@topnewpage[\@makechapterhead{{#2}}]%
  \else
  \@makechapterhead{{#2}}%
  \@afterheading
  \fi}
\def\@makechapterhead#1{%
  \vspace*{24\p@}%
  {\parindent \z@ \raggedright \normalfont
    \ifnum \c@secnumdepth >\m@ne
    \begin{center}
    \normalfont\fontsize{14}{14}\selectfont\bfseries\thechapter
    \fi
    \normalfont\fontsize{14}{14}\selectfont\bfseries\quad #1
    \end{center}\par\nobreak
    \vskip 12\p@
  }}
\def\@schapter#1{\if@twocolumn
  \@topnewpage[\@makeschapterhead{{#1}}]%
  \else
  \@makeschapterhead{{#1}}%
  \@afterheading
  \fi
  \phantomsection
  \addcontentsline{toc}{chapter}{#1}% Contentsline also for \chapter*
}
\def\@makeschapterhead#1{%
  \vspace*{24\p@}%
  {\parindent \z@ \raggedright
    \normalfont
    \interlinepenalty\@M
    \begin{center}\fontsize{14}{14} \bfseries  #1\end{center}\par\nobreak
    \vskip 12\p@
  }}

% Table of contents

\def\l@chapter#1#2{\@dottedtocline{1}{0em}{1.5em}{\bf #1}{\bf #2}}

% Table and figure captions

\long\def\@makecaption#1#2{%
  \vskip\abovecaptionskip
  \sbox\@tempboxa{\fontsize{9}{13}\selectfont #1: #2}%
  \ifdim \wd\@tempboxa >\hsize
    \fontsize{9}{13}\selectfont #1: #2\par
  \else
    \global \@minipagefalse
    \hb@xt@\hsize{\hfil\box\@tempboxa\hfil}%
  \fi
  \vskip\belowcaptionskip}

% Table and figure numbering without chapter number

\def\thefigure{\@arabic\c@figure}
\def\thetable{\@arabic\c@table}

% Quotes

\renewenvironment{quote}
{\list{}{\rightmargin\leftmargin\fontsize{9}{12}\selectfont}%
\item\relax}
{\endlist}

% Lists (itemize and enumerate)

%% removed the old itemize material as it should be in a package enumitem
%%
%% nmt Frontpage by Kjetil:
%%

\newcommand{\nmt@frontpagesyear}{%
Use $\backslash$setthesisyear\{<year>\} to set year.
}

\newcommand{\setthesisyear}[1]{%
  \renewcommand{\nmt@frontpagesyear}{#1}
}


\newcommand\nmt@firstpagetext{%
  \noindent Use this class with options\\
  ``MACS'' Masters in Applied Computer Science,\\
  ``MIS'' Masters in Information Security,\\
  ``CIMET'' Erasmus mundus Masters in Colour Science,\\
  ``MTDMT''  Masters in 3D Multimedia Technology
}

\newcommand\nmt@secondpagetext{%
  \noindent Use this class with options\\ 
  ``MACS'' Masters in Applied Computer Science,\\
  ``MIS'' Masters i Informasjonssikkerhet,\\
  ``CIMET'' Erasmus mundus Masters in Colour Science,\\
  ``MTDMT''  Masters in 3D MultimMTDMTedia Technology
}

	    



%% OPTIONS (declare more here if needed)

\DeclareOption{DAIM}{\@Bpapertrue \@twosidetrue  \@mparswitchtrue%
	\geometry{b5paper, left=32mm,   right=18mm,  top=27mm, bottom=30mm, head=1.2cm, foot=2cm}
	\@DAIMtrue
}




\DeclareOption{a4paper}{\@Bpaperfalse }
\DeclareOption{b5paper}{\@Bpapertrue }


\DeclareOption{oneside}{\@twosidefalse \@mparswitchfalse%
	\if@Bpaper{
		\geometry{b5paper, left=25mm,   right=25mm,  top=27mm, bottom=30mm, head=1.2cm, foot=2cm}}
	\else{
		\geometry{a4paper, left=3.75cm, right=3.75cm, top=3cm, bottom=4cm, head=1.2cm, foot=2cm, marginpar=2.75cm}}
	\fi
	}
	
\DeclareOption{twoside}{\@twosidetrue  \@mparswitchtrue%
	\if@Bpaper{
	\geometry{b5paper, left=32mm,   right=18mm,  top=27mm, bottom=30mm, head=1.2cm, foot=2cm}}
	\else{\geometry{a4paper, left=4.5cm, right=3cm, top=3cm, bottom=4cm,
  head=1.2cm, foot=2cm}}
	\fi
	}


\newif\if@norsk
\newif\if@english

	\newcommand\nmt@DepartmentNameText{}
	\newcommand\nmt@IDI{
		Department of Computer Science\\
		\NTNU, 
		}
	\newcommand\nmt@IIK{
			Department of Information Security and Communication Technology\\
		\NTNU, 
		}
	\newcommand\nmt@ID{
			Department of Interaction Design\\
		\NTNU, 
		}
	
	\newcommand\nmt@DegreeNameText{}
  \newcommand\nmt@MIXD{Master of Science in Interaction Design}
  \newcommand\nmt@MACS{Master of Science in Applied Computer Science}
  \newcommand\nmt@MIS{Master of Science in Information Security}
  \newcommand\nmt@CIMET{Master In Colour science}
  \newcommand\nmt@MTDMT{Masters in 3D Multimedia Technology}




\DeclareOption{norsk}{
   \@norsktrue 
   \@englishfalse

	\renewcommand\nmt@IDI{%
	   Institute for Datateknikk og Informatikk\\
	 	\NTNUno, 
	}
	\renewcommand\nmt@IIK{
			Institutt for informasjonssikkerhet og kommunikasjonsteknologi\\
		\NTNUno, 
		}	
	\renewcommand\nmt@ID{
			Institutt for interaksjondesign\\
		\NTNUno, 
		}	

	
  \renewcommand\nmt@MIXD{Master i interaksjonsdesign}
  \renewcommand\nmt@MACS{Master of Science in Applied Computer Science}
  \renewcommand\nmt@MIS{Master i informasjonssikkerhet}
  \renewcommand\nmt@CIMET{No Norwegian}
  \renewcommand\nmt@MTDMT{No Norwegian}


  
}

\DeclareOption{english}{
   \@englishtrue 
   \@norskfalse
}

	
 \if@norsk
\fi



\DeclareOption{MACS}{%
  \renewcommand\nmt@DepartmentNameText{%
    	\nmt@IDI
			}
  \renewcommand\nmt@DegreeNameText{%
    	\nmt@MACS
			}
}

\DeclareOption{MIS}{%
  \renewcommand\nmt@DepartmentNameText{%
    	\nmt@IIK
			}
  \renewcommand\nmt@DegreeNameText{%
    	\nmt@MIS
			}
}

\DeclareOption{MIXD}{%
  \renewcommand\nmt@DepartmentNameText{%
    	\nmt@ID
			}
  \renewcommand\nmt@DegreeNameText{%
    	\nmt@MIXD
			}
}



\DeclareOption{CIMET}{
  \@masterstrue
  \@CIMETtrue
  \if@norsk  
	\renewcommand\nmt@firstpagetext{%
    	  Only english for CIMET thesis\\
	\\
	}
  \else
	\renewcommand\nmt@firstpagetext{%
 	  Master's Thesis\\
    	  Master In Colour science\\
       	  30 ECTS\\
	  \nmt@UniNameText
	}
  \fi
  \renewcommand\nmt@secondpagetext{\thesis@publishertext}
}


\DeclareOption{MTDMT}{
  \@masterstrue
  \@MTDMTtrue
  \if@norsk  
	\renewcommand\nmt@firstpagetext{%
    	  Only english for 3D MultiMTDMT Technology thesis\\
	\\
	}
  \else
	\renewcommand\nmt@firstpagetext{%
 	  Master's Thesis\\
    	  Master in 3D MultiMTDMT Technology\\
       	  30 ECTS\\
	  \nmt@UniNameText
	}
  \fi
  \renewcommand\nmt@secondpagetext{\thesis@publishertext}
}


	\renewcommand\nmt@firstpagetext{%
	   Master's Thesis\\
		 \nmt@DegreeNameText\\
	   30 ECTS\\
	   \nmt@DepartmentNameText\\
	 }




\ProcessOptions\relax


\if@CIMET
\else
	\if@MTDMT
	\else
		\setthesisPublisherText{%
%			\noindent
%			Avdeling for\\
%			informatikk og medieteknikk\\
%			\NTNUno\\
%			Postboks 191\\
%			2802 Gj\o{}vik
%			\vskip 3em%
%			\noindent
%			Department of Computer Science\\
%			and Media Technology\\
%			\NTNU\\
%			Box 191\\
%			N-2802 Gj\o{}vik\\
%			Norway
		}
	\fi
\fi


%% FRONTPAGE GENERATION
\newcommand\makefrontpages{%
	\if@DAIM
	 %No front page
	\else
	  \if@CIMET
	     \makeCIMETfrontpages
	   \else
	     \if@MTDMT
	        \makeMTDMTfrontpages
	     \else
	        \makemastersfrontpages
	     \fi
	   \fi
	\fi
}


\newcommand\makemastersfrontpages{%
  \begin{titlepage}%
    %\thispagestyle{empty}
    %\setcounter{page}\z@
		\hypersetup{pageanchor=false}
    \let\footnotesize\small
    \let\footnoterule\relax
    \let \footnote \thanks
    \null\vfil
      \includegraphics[width=200pt]{ntnuthesis/hovedlogo_eng} \\    
    \vskip 125\p@
    \begin{center}%
      {\fontsize{30}{34}\selectfont \thesis@title}%
      \vskip 3em%
      {%\large
        \lineskip .75em%
        \begin{tabular}[t]{c}%
          {\fontsize{18}{20}\selectfont \thesis@author \par} %\@author
        \end{tabular}\par}%
      % \vskip 1.5em%
      % {\large Dato \par}%       % Set date in \large size.
    \end{center}\par
    \vskip 3em
    \begin{center}%
			\thesis@date\\
      \medskip
      \nmt@firstpagetext
    \end{center}	
		\vspace*{\fill}
		
		Supervisor: \thesis@supervisor 
		
		\if@supervisorA Co-Supervisor: \@supervisorA \fi

		\if@supervisorB Co-Supervisor: \@supervisorB \fi
		
  \end{titlepage}

 % \newpage
 % \thispagestyle{empty}
 % \null\vfil
 % \vfill
 % \vbox{\footnotesize{\nmt@secondpagetext}}
 %	\hypersetup{pageanchor=true}
}


\newcommand\makeCIMETfrontpages{%
    \begin{titlepage}%
    % \thispagestyle{empty}
    % \setcounter{page}\z@
\hypersetup{pageanchor=false}
    \let\footnotesize\small
    \let\footnoterule\relax
    \let \footnote \thanks
    \null\vfil
    
	\begin{center}
		{\fontsize{16}{20}\selectfont Master Erasmus Mundus in \\ Color in Informatics and MTDMT Technology (CIMET)\\}
	\end{center}
	%\vskip 165\p@
    \vskip 3em
	\begin{center}
		\includegraphics[width=400pt]{ntnuthesis/CIMETlogo}
      \medskip
    \end{center}
	%\vskip 165\p@
    \vskip 3em
	
    \begin{center}%
      {\fontsize{16}{18}\selectfont \thesis@title \\}%
	  \vskip 1em
	  {\fontsize{14}{16}\selectfont Master Thesis Report}%
      \vskip 4em
	  {\fontsize{14}{16}\selectfont Presented by}
      \vskip 2em
	  
      {%\large
        \lineskip .75em%
        \begin{tabular}[t]{c}%
          {\fontsize{14}{16}\selectfont \thesis@author \par} %\@author
        \end{tabular}\par}%
      % \vskip 1.5em%
      % {\large Dato \par}%       % Set date in \large size.
	  \vskip 2em
	  {\fontsize{14}{16}\selectfont and defended at}
      \vskip 2em
	  {\fontsize{14}{16}\selectfont \thesis@hostInstitution}
	  
    \end{center}\par
    \@thanks
    \vfill
    \vskip 1em
	
	{\fontsize{12}{14}\selectfont Academic Supervisor(s): \thesis@supervisor \\
	\hspace*{50mm} \thesis@supervisorA \\
	\hspace*{50mm} \thesis@supervisorB}
	\vskip 1em
	{\fontsize{12}{14}\selectfont Jury Committee:\hspace*{5mm} \thesis@juryA \\
	\hspace*{40mm} \thesis@juryB\\
	\hspace*{40mm} \thesis@juryC\\
	\hspace*{40mm} \thesis@juryD}
	
  \end{titlepage}

  \newpage
  \hypersetup{pageanchor=false}
  \thispagestyle{empty}
  \null\vfil
  \vfill
  \vbox{\footnotesize{\nmt@secondpagetext}}
}

\newcommand\makeMTDMTfrontpages{%
    \begin{titlepage}%
    % \thispagestyle{empty}
    % \setcounter{page}\z@
\hypersetup{pageanchor=false}
    \let\footnotesize\small
    \let\footnoterule\relax
    \let \footnote \thanks
    %\null\vfil
    
	\begin{center}
		{\fontsize{16}{20}\selectfont  Master in 3D Multimedia Technology\\}
	\end{center}
	%\vskip 165\p@
    \vskip 3em
	\begin{center}
		\includegraphics[width=300pt]{ntnuthesis/3DMT-header}\\
		\includegraphics[height=50pt]{ntnuthesis/logo_jaune_UJM}\hspace{1cm}\includegraphics[height=50pt]{ntnuthesis/hovedlogo_eng}\\
      		\medskip
        \end{center}
	%\vskip 165\p@
    \vskip 3em
	
    \begin{center}%
      {\fontsize{16}{18}\selectfont\bfseries \thesis@title \\}%
	  \vskip 1em
	  {\fontsize{12}{14}\selectfont Master Thesis Report}%
      \vskip 4em
	  {\fontsize{12}{14}\selectfont Presented by}
      \vskip 1em
      {%\large
        \lineskip .75em%
        \begin{tabular}[t]{c}%
          {\fontsize{14}{16}\selectfont \thesis@author \par} %\@author
        \end{tabular}\par}%
      % \vskip 1.5em%
      % {\large Dato \par}%       % Set date in \large size.
	  \vskip 2em
	  {\fontsize{12}{14}\selectfont and defended at}
      \vskip 1em
	  {\fontsize{14}{16}\selectfont \thesis@hostInstitution}
	  
    \end{center}\par
    \@thanks
    %\vfill
    \vskip 5em
	
	{\fontsize{12}{14}\selectfont Academic Supervisor(s): \thesis@supervisor \\
	\hspace*{50mm} \thesis@supervisorA \\
	\hspace*{50mm} \thesis@supervisorB}
	\vskip 1em
	{\fontsize{12}{14}\selectfont Jury Committee:\hspace*{5mm} \thesis@juryA \\
	\hspace*{40mm} \thesis@juryB\\
	\hspace*{40mm} \thesis@juryC\\
	\hspace*{40mm} \thesis@juryD}
	
  \end{titlepage}

  \newpage
  \hypersetup{pageanchor=false}
  \thispagestyle{empty}
  \null\vfil
  \vfill
  \vbox{\footnotesize{\nmt@secondpagetext}}

\pdfinfo{
   /Author (\thesis@author)
   /Title  (\thesis@title)
   /CreationDate (\nmt@frontpagesyear)
   /Keywords (\nmt@keywords)
}
}


