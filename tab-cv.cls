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
\usepackage{tabularx}

% Symbols
\usepackage{fontawesome5}

% Colors
\usepackage[usenames,dvipsnames]{xcolor} % Required for specifying custom colors
\definecolor{dgray}{gray}{.25}
\definecolor{gray}{gray}{.35}
\definecolor{lgray}{gray}{.6}

\definecolor{dred}{RGB}{130,0,0}
\definecolor{dblu}{RGB}{0,0,130}

\colorlet{maincolor}{dred}

% Links
\usepackage{hyperref} % Required for adding links	and customizing them
\hypersetup{colorlinks,breaklinks,urlcolor=maincolor,linkcolor=maincolor} % Set link colors throughout the document

\RequirePackage{ifthen}


%------------------------------------------------
%	BODY CONFIGURATION
%------------------------------------------------

% HEADER
\newcommand{\header}[4]{\par{\centering
{\Large\textcolor{maincolor}{#1}} % Name
\bigskip\par}{\par{\centering
	#2\par % Address 
  #3\par % E-mail
  #4\par % other information
}}
}

% SECTIONS
\usepackage{titlesec} % Used to customize the \section command
\titleformat{\section}{\bfseries\raggedright\color{maincolor}}{}{0em}{}[\titlerule] % Text formatting of sections
\titlespacing{\section}{0pt}{12pt}{3pt} % Spacing around sections

% LIST
% \newenvironment{entrylist}{%
%   \begin{tabular*}{\textwidth}{rX}
% }{%
%   \end{tabular*}
% }

% ENTRIES
\newcommand{\tabspace}{\rule{0pt}{3.5ex}}
\newcommand{\inst}[1]{{\bfseries{{#1}}}}
\newcommand{\pos}[1]{{\itshape\textcolor{maincolor}{#1}}}
\newcommand{\task}[1]{{\small\textcolor{dgray}{#1}}}
\newcommand{\grade}[1]{{\footnotesize[graded{#1}]}}
\newcommand{\sgright}[1]{{\hfill\footnotesize\color{gray}{{#1}}}}
\newcommand{\yr}[1]{{\footnotesize\color{dgray}{{#1}}}}
\newcommand{\scb}[1]{{\small\bfseries{#1}}}

\DeclareSymbolFont{stmry}{U}{stmry}{m}{n}
\DeclareMathSymbol\rightarrowtriangle\mathrel{stmry}{"5F}
\renewcommand{\to}{$\rightarrowtriangle$~}


% \newcommand{\entry}[5]{%
%   % \hangindent=3mm \hangafter1% 
%   {\leavevmode\yr{#1}}& %\parbox[t]{\textwidth}{%
%   \inst{#2}
%   \sgright{#3}\\
%   % \pos{#4} \small{#5}}\\
% }

% \RequirePackage{parskip}

\newenvironment{entrylist}{%
  \tabularx{\textwidth}{rX}
}{%
  \endtabularx
}
% \renewcommand{\bfseries}{\headingfont\color{headercolor}}

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