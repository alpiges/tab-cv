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

%%% PACKAGES
\RequirePackage[top=2.2cm, bottom=2.2cm, left=2.2cm, right=2.2cm]{geometry}

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




%------------------------------------------------
%	BODY CONFIGURATION
%------------------------------------------------

% HEADER
\newcommand{\header}[1]{\par{\centering
{\Large\textcolor{maincolor}{#1}}
\bigskip\par}}

% SECTIONS
\usepackage{titlesec} % Used to customize the \section command
\titleformat{\section}{\bfseries\raggedright\color{maincolor}}{}{0em}{}[\titlerule] % Text formatting of sections
\titlespacing{\section}{0pt}{12pt}{3pt} % Spacing around sections

% ENTRIES
\newcommand{\tabspace}{\rule{0pt}{3.5ex}}
\newcommand{\inst}[1]{{\bfseries{{#1}}}}
\newcommand{\pos}[1]{{\itshape\textcolor{maincolor}{#1}}}
\newcommand{\grade}[1]{{\footnotesize[{#1}]}}
\newcommand{\sgright}[1]{{\hfill\footnotesize\color{dgray}{{#1}}}}
\newcommand{\yr}[1]{{\footnotesize\color{dgray}{{#1}}}}
\newcommand{\scb}[1]{{\small\bfseries{#1}}}

\DeclareSymbolFont{stmry}{U}{stmry}{m}{n}
\DeclareMathSymbol\rightarrowtriangle\mathrel{stmry}{"5F}
\renewcommand{\to}{$\rightarrowtriangle$~}