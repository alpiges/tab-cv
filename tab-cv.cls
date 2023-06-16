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

% Tabular
\RequirePackage{tabularx}
\RequirePackage{booktabs}

% Symbols
\RequirePackage{fontawesome5}

% Colors
\RequirePackage[usenames,dvipsnames]{xcolor} % Required for specifying custom colors
\definecolor{dgray}{gray}{.3}
\definecolor{gray}{gray}{.4}
\definecolor{lgray}{gray}{.6}

\definecolor{dred}{RGB}{130,0,0}
\definecolor{dblu}{RGB}{10,90,130}

\colorlet{maincolor}{dblu}

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
\newcommand{\header}[4]{\par{\centering
{\Large\textcolor{maincolor}{#1}} % Name
\bigskip\par}{\par{\centering
	\location{#2}\par\vskip0.5ex % Address 
  \email{#3}\par\vskip0.5ex % E-mail
  #4\par % other information
}}
}

\newcommand{\aboutme}[1]{
  \vskip\baselineskip
  \begin{tabularx}{\textwidth}{rX}
    \bfseries\color{maincolor}{\small ABOUT} & \textcolor{dgray}{\small #1}
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