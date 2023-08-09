\ProvidesClass{tab-cv}[2023/06/14 CV class]

%------------------------------------------------
%	DOCUMENT CONFIGURATIONS
%------------------------------------------------

\DeclareOption{print}{\def\@cv@print{}}
\DeclareOption*{%
  \PassOptionsToClass{\CurrentOption}{article}%
}
\ProcessOptions\relax
\LoadClass{article}

%%% Page setup
\RequirePackage[top=2.2cm, bottom=2.2cm, left=2.2cm, right=2.2cm]{geometry}
\setlength\parindent{0pt}

% Fonts & encoding
\RequirePackage[T1]{fontenc}
\RequirePackage[utf8]{inputenc}
\RequirePackage[default]{lato}

\newcommand{\bodyfont}{\fontseries{l}\selectfont}
\newcommand{\thinfont}{\fontseries{el}\selectfont}
\newcommand{\semibold}{\fontseries{sb}\selectfont}

\newcommand{\textsb}[1]{{\semibold #1}}

% Tabular
\RequirePackage{tabularx}
\RequirePackage{booktabs}

% Lists
\RequirePackage{enumitem}

% Symbols
\RequirePackage{fontawesome5}

% Colors
\RequirePackage[usenames,dvipsnames]{xcolor} % Required for specifying custom colors
\definecolor{dgray}{gray}{.3}
\definecolor{gray}{gray}{.4}
\definecolor{lgray}{gray}{.6}

\definecolor{dred}{RGB}{130,0,0}
\definecolor{dblu}{RGB}{0,0,130}
\definecolor{blu}{RGB}{10,90,130}

\colorlet{maincolor}{blu}

\DeclareTextFontCommand{\note}{\color{gray}\em}

\renewcommand{\labelitemi}{\color{maincolor}{\textbullet}}

% Links
\RequirePackage{hyperref} % Required for adding links	and customizing them
\hypersetup{colorlinks,breaklinks,urlcolor=maincolor,linkcolor=maincolor} % Set link colors throughout the document

\RequirePackage{ifthen}

% ICONS
\newcommand{\infofield}[2]{\mbox{\makebox[2ex]{\textcolor{maincolor}{\normalsize #1}} #2}}
\newcommand{\email}[1]{\infofield{\faEnvelope}{\href{mailto:#1}{\texttt{#1}}}}
\newcommand{\address}[1]{\infofield{\faAt}{#1}}
\newcommand{\location}[1]{\infofield{\faMapMarker}{#1}}
\newcommand{\phone}[1]{\infofield{\faPhone}{#1}}
\newcommand{\homepage}[2]{\infofield{\faHome}{\href{#1}{#2}}}
\newcommand{\linkedin}[2]{\infofield{\faLinkedin}{\href{#1}{#2}}}
\newcommand{\github}[2]{\infofield{\faGithub}{\href{#1}{\texttt{#2}}}}
\newcommand{\twitter}[2]{\infofield{\faTwitter}{\href{#1}{\texttt{@#2}}}}
\newcommand{\mastodon}[2]{\infofield{\faMastodon}{\href{#1}{\texttt{#2}}}}


%------------------------------------------------
%	BODY CONFIGURATION
%------------------------------------------------

% HEADER
\RequirePackage{tikz}

\colorlet{headerfill}{maincolor!30!dgray}
\colorlet{headertext}{white}


\newcommand{\header}[3]{%
  \begin{tikzpicture}[remember picture,overlay]
    \node [rectangle, fill=headerfill, anchor=north, minimum width=\paperwidth,
minimum height=2.8cm, yshift=1mm] (box) at (current page.north){};
    \node [anchor=center, yshift=1mm] (name) at (box) {%
      \fontsize{36pt}{48pt}\color{headertext}%
      {\thinfont #1}\hskip1em{\bodyfont  #2}
    };
    \node [anchor=north] at (name.south) {%
      \fontsize{15pt}{20pt}\color{headertext}%
      \thinfont #3%
    };
  \end{tikzpicture}
  \vspace{1.5ex}
}

\newcommand{\addressline}[3]{%}
  \begin{tikzpicture}[remember picture,overlay]
    \node [rectangle, fill=lgray!30, anchor=north, minimum width=\paperwidth,
    minimum height=1.2cm, yshift=-2.7cm] (box) at (current page.north){};
    \node [anchor=center, yshift=-0.5mm, align=center] (name) at (box) {%
    \location{#1}\\[0.3ex] % Address 
    \email{#2} \hskip2em % E-mail
    #3 % other information
    };
  \end{tikzpicture}
  \vspace{2.5ex}
  }

\newcommand{\aboutme}[1]{
  \vskip\baselineskip
  \begin{tabularx}{\textwidth}{rX}
    \bfseries\color{maincolor}{ABOUT} & \task{#1}
  \end{tabularx}
}

% FOOTER
\RequirePackage{tikz}
\newcommand{\lastupdated}[1]{%
  \begin{tikzpicture}[remember picture,overlay]
    \node [anchor=south east, xshift=-1ex, yshift=0.5em] at (current page.south east){%
    \color{gray}%
    \footnotesize Last updated on #1
    };
  \end{tikzpicture}
  \vspace{-2\parskip}
}

% SECTIONS
\RequirePackage{titlesec} % Used to customize the \section command
\titleformat{\section}{\bfseries\raggedright\color{maincolor}}{}{0em}{}[\titlerule] % Text formatting of sections
\titlespacing{\section}{0pt}{12pt}{3pt} % Spacing around sections

% ENTRIES
\newcommand{\tabspace}{\rule{0pt}{3.5ex}}
\newcommand{\inst}[1]{{\bfseries{{#1}}}}
\newcommand{\pos}[1]{{\itshape\textcolor{maincolor}{#1}}}
\newcommand{\task}[1]{{\small{#1}}}
\newcommand{\grade}[1]{{\footnotesize[graded{#1}]}}
\newcommand{\sgright}[1]{{\hfill\footnotesize\color{dgray}{{#1}}}}
\newcommand{\yr}[1]{{\footnotesize\color{dgray}{{#1}}}}
\newcommand{\scb}[1]{{\small\bfseries{#1}}}

\DeclareSymbolFont{stmry}{U}{stmry}{m}{n}
\DeclareMathSymbol\rightarrowtriangle\mathrel{stmry}{"5F}
\renewcommand{\to}{$\rightarrowtriangle$~}

\newenvironment{entrylist}{%
  \renewcommand{\arraystretch}{1.5}
  \tabularx{\textwidth}{rX}
}{%
  \endtabularx
}

\newenvironment{tightentrylist}{%
  % \renewcommand{\arraystretch}{1}
  \tabularx{\textwidth}{rX}
}{%
  \endtabularx
}

% Plain entry, can be adapted individually
\newcommand{\entry}[3]{%
  \yr{#1} &
  {#2} \sgright{#3}\\%
}

% Pre-defined entry for job positions
\newcommand{\jobentry}[5]{%
  \yr{#1} &%
  \inst{#2} \sgright{#3}%
  \newline%
  \pos{#4} \task{#5}\\%
}

% Pre-defined macro for education item
\newcommand{\eduentry}[6]{%
  \yr{#1} &%
  \inst{#2} \sgright{#3}%
  \newline%
  \pos{#4}%
  \newline%
  \task{\emph{Thesis:} #5}%
  \ifthenelse{\equal{#6}{}}{}{\newline\task{#6}}\\%
}

% Pre-defined macro for publication item
\newcommand{\pubentry}[4]{%
  \yr{#1} &%
  {#2}\newline%
	\textbf{#3}\newline%
	\textit{#4}\\%
}

% Heading within entrylist environment
\newcommand{\entrysection}[1]{%
  \multicolumn{2}{l}{\pos{#1}}\\%
}